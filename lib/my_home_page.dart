import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/styles/app_styles.dart';
import 'package:flutter_weather_app/widgets/linear_gradient.dart';
import 'package:flutter_weather_app/widgets/slider_view.dart';
import 'package:flutter_weather_app/widgets/weather_days.dart';
import 'package:flutter_weather_app/widgets/weather_view_banner.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String weatherInfo = '';
  String sityName = '';
  String countryNames = '';
  String weatherIcon = '';
  String mainWeather = '';
  double windSpeed = 0;
  int humidityWeather = 0;
  int pressureWeather = 0;

  void weatherFun() async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=berlin,&appid=41aa18abb8974c0ea27098038f6feb1b');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);

      final data = jsonDecode(response.body);

      final name = data["name"] ?? 'unbekannt';
      final temp = data["main"]["temp"] ?? '0.0';

      final countryName = data["sys"]["country"] ?? 'unbekannt';
      final icon = data["weather"][0]["icon"] ?? '';
      final main = data["weather"][0]["main"] ?? 'unbekannt';
      final wind = (data["wind"]["speed"] ?? 0.0).toDouble();
      final humidity = data["main"]["humidity"] ?? 'unbekannt';
      final pressure = data["main"]["pressure"] ?? 'unbekannt';

      final withKelvin = temp - 273.15;
      setState(() {
        weatherInfo = withKelvin.toStringAsFixed(0);
        sityName = name;
        countryNames = countryName;
        weatherIcon = icon;
        mainWeather = main;
        windSpeed = wind;
        humidityWeather = humidity;
        pressureWeather = pressure;
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    weatherFun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgcAppBarColor,
      appBar: AppBar(
        backgroundColor: AppStyles.bgcAppBarColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.97),
          child: Image.asset(
            'assets/icons/search.png',
            width: 25.85,
            height: 25.11,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.97),
            child: Image.asset(
              'assets/icons/menu.png',
              width: 24.15,
              height: 24.15,
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradientColor.liner,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff16C4EA),
              Color(0xff7DE8FF),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.97),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$sityName\n$countryNames',
                style: AppStyles.sityNameTextStyle,
              ),
              const Text(
                'Tue,Jun 30',
                style: AppStyles.dataTextStyle,
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.network(
                      weatherIcon.isNotEmpty
                          ? "https://openweathermap.org/img/wn/$weatherIcon@2x.png"
                          : 'assets/images/cludy.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weatherInfo,
                              style: AppStyles.tempTextStyle,
                            ),
                            const Text(
                              '\u2103',
                              style: AppStyles.tempCelciumTextStyle,
                            )
                          ],
                        ),
                        Text(
                          mainWeather,
                          style: AppStyles.sityNameTextStyle.copyWith(
                            fontSize: 24.15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              WeatherViewBanner(
                image: 'assets/icons/umb.png',
                text: 'Pressure',
                text2: "${pressureWeather.toString()} cm",
              ),
              WeatherViewBanner(
                image: 'assets/icons/wind.png',
                text: 'Wind',
                text2: "${windSpeed.toString()} km/h",
              ),
              WeatherViewBanner(
                image: 'assets/icons/suu.png',
                text: 'Humidity',
                text2: "${humidityWeather.toString()} %",
              ),
              const SliderView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradientColor.liner,
        ),
        child: SizedBox(
          height: 98.99,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const WeatherDays(
                text1: 'now',
                image: 'assets/icons/icon1.png',
                text2: '19°',
              );
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
