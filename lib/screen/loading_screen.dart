import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screen/home_page.dart';

import '../weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    if (kDebugMode) {
      print(weatherData);
    }

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
