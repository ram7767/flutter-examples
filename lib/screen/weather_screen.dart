import 'dart:async';
import 'dart:convert';

import 'package:basic_weather_app/helper/forecast_card.dart';
import 'package:basic_weather_app/helper/addtion_information_widget.dart';
import 'package:basic_weather_app/helper/hourly_forecast_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

// Main Screen
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;
  final location = TextEditingController();
  Future<Map<String, dynamic>> getWeather([String cityName = "nandyal"]) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=24628d9e32ac156d9c1b9f02661cd1b0'),
      );
      final data = jsonDecode(response.body);
      if (data['cod'].toString() != "200") {
        throw Exception('Weather data unavailable for $cityName');
      }
      return data;
    } catch (e) {
      throw Exception('Failed to fetch weather data');
    }
  }

  IconData getIcons(String iconName) {
    switch (iconName) {
      case '01d':
        return Icons.wb_sunny_rounded;
      case '01n':
        return Icons.wb_sunny_outlined;
      case '02d':
        return Icons.cloud_circle;
      case '02n':
        return Icons.cloud_circle_outlined;
      case '03d':
        return Icons.cloud;
      case '03n':
        return Icons.cloud_outlined;
      case '04d':
        return Icons.cloudy_snowing;
      case '04n':
        return Icons.cloudy_snowing;

      case '09d':
        return Icons.sunny_snowing;
      case '09n':
        return Icons.sunny_snowing;
      case '11d':
        return Icons.thunderstorm;
      case '11n':
        return Icons.thunderstorm;
      case '13d':
        return Icons.snowing;
      case '13n':
        return Icons.snowing;
      case '15d':
        return Icons.foggy;
      case '15n':
        return Icons.foggy;
      default:
        return Icons.broken_image;
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                location.clear();
                weather = getWeather();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.error.toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        weather = getWeather();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final data = snapshot.data!;

          final currentData = data['list'][0];

          final currentWind = currentData['wind']['speed'];
          final currentPressure = currentData['main']['pressure'];
          final currentHumidity = currentData['main']['humidity'];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        setState(() {
                          weather = getWeather(location.text);
                          location.clear();
                        });
                      },
                      controller: location,
                      decoration: const InputDecoration(
                        hintText: "Enter Location",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      data['city']['name'],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ForecastCard(
                      icon:
                          getIcons(currentData['weather'][0]['icon'].toString()),
                      degree: currentData['main']['temp'].toString(),
                      weather:
                          currentData['weather'][0]['description'].toString(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Weather Forecast",
                    style: TextStyle(),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          final hourlyForecast =
                              data['list'][index + 1]['dt_txt'];
                          final icon = getIcons(data['list'][index + 1]['weather']
                                  [0]['icon']
                              .toString());
                          final temp = data['list'][index + 1]['main']['temp'];
                          final time = DateTime.parse(hourlyForecast);
                          return HourlyForecastCard(
                              time: DateFormat('j').format(time),
                              icon: icon,
                              temp: temp);
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Additional Information",
                    style: TextStyle(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AddtionInformationWidget(
                          icon: Icons.water_drop,
                          value: currentHumidity.toString(),
                          weather: "Humidity"),
                      AddtionInformationWidget(
                          icon: Icons.air,
                          value: currentWind.toString(),
                          weather: "Wind Speed"),
                      AddtionInformationWidget(
                          icon: Icons.umbrella_rounded,
                          value: currentPressure.toString(),
                          weather: "Pressure"),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
