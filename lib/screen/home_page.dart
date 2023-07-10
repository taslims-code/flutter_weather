import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weather = WeatherModel();

  DateTime date = DateTime.now();

  late int temperature;
  late int temperatureMin;
  late int temperatureMax;
  late String weatherIcon;
  late String cityName;
  late String updateTime;
  late String weatherCondition;

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        temperatureMin = 0;
        temperatureMax = 0;
        weatherIcon = 'Error';
        cityName = '';
        updateTime = '';
        weatherCondition = '';
        return;
      }

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var tempMin = weatherData['main']['temp_min'];
      temperatureMin = tempMin.toInt();

      var tempMax = weatherData['main']['temp_max'];
      temperatureMax = tempMax.toInt();

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);

      cityName = weatherData['name'];

      updateTime = DateFormat('hh:mm a').format(date);
      weatherCondition = weatherData['weather'][0]['main'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(weatherIcon);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF5B4848),
        title: const Text(
          "Flutter Weather",
          // style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            // color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            // color: Colors.white,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  /* Color(0xFF4C3AE3),
                  Color(0xFF00BC40),
                  Color(0xFF538FFB),
                  Color(0xFFFED54A),*/
                  Color(0xFF6B46E1),
                  Color(0xFF5B4848),
                  // #253898 #5737D6

                  // #00BC40 #4C3AE3
                  // #538FFB #5B54FA#5B54FA
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  cityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  updateTime,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/$weatherIcon.png',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '$temperature°',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/thermometer_high.png',
                                  height: 40,
                                  width: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    '$temperatureMax°',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/thermometer_low.png',
                                  height: 40,
                                  width: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Text(
                                    '$temperatureMin°',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  weatherCondition,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
