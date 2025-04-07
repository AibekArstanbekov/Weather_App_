import 'package:flutter/material.dart';
import 'package:flutter_weather_app/styles/app_styles.dart';

class WeatherViewBanner extends StatelessWidget {
  const WeatherViewBanner({
    super.key,
    required this.image,
    required this.text,
    required this.text2,
  });

  final String image, text, text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.31),
      child: Container(
        width: double.infinity,
        height: 65.54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.25),
          color: Colors.white.withOpacity(0.25),
          border: Border.all(color: const Color(0xffbceffb), width: 0.86),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.97, right: 48.29),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 37.94,
                    height: 37.94,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.8),
                    ),
                    child: Image.asset(
                      image,
                      width: 35,
                      height: 35,
                    ),
                  ),
                  const SizedBox(width: 11.42),
                  Text(
                    text,
                    style: AppStyles.rainFallTextStyle,
                  ),
                ],
              ),
              Text(
                text2,
                style: AppStyles.rainFallTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
