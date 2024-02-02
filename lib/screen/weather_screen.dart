import 'package:basic_weather_app/helper/forecast_card.dart';
import 'package:basic_weather_app/helper/addtion_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Main Screen
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  Future getWeather() async {
    String cityName = 'nandyal';
    http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/3.0/onecall?q=$cityName&appid=2700cb77f169014b47963479d60e46c1'),
    );
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: ForecastCard(
                icon: Icons.cloud,
                degree: "22",
                weather: "Cloud",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weather Forecast",
              style: TextStyle(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    elevation: 6,
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "00:00",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Icon(Icons.cloud),
                          SizedBox(
                            height: 8,
                          ),
                          Text("320"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Additional Information",
              style: TextStyle(),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AddtionInformationWidget(
                    icon: Icons.air, value: "16", weather: "Sunny"),
                AddtionInformationWidget(
                    icon: Icons.air, value: "16", weather: "Sunny"),
                AddtionInformationWidget(
                    icon: Icons.air, value: "16", weather: "Sunny"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
