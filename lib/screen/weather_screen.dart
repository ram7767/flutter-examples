import 'package:basic_weather_app/helper/forecast_card.dart';
import 'package:basic_weather_app/helper/addtion_information_widget.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App",
        style: TextStyle(fontWeight: FontWeight.bold),),
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
              child: ForecastCard(),
            ),
            const SizedBox(height: 20,),
            const Text(
              "Weather Forecast",
              style: TextStyle(),),

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
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Column(
                        children: [
                          Text("00:00",
                          style: TextStyle(fontSize: 16),),
                          SizedBox(height: 8,),
                          Icon(Icons.cloud),
                          SizedBox(height: 8,),
                          Text("320"),
                        ],
                      ),
                    ),
                  ),
                ],
                           ),
             ),

            const SizedBox(height: 20,),
            const Text("Additional Information",
            style: TextStyle(),),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AddtionInformationWidget(),
                 AddtionInformationWidget(),
                  AddtionInformationWidget()
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}


