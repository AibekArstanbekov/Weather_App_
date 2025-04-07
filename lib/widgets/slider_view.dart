import 'package:flutter/material.dart';
import 'package:flutter_weather_app/styles/app_styles.dart';

class SliderView extends StatelessWidget {
  const SliderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 27.7, bottom: 12.39),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Today',
                    style: AppStyles.todayTextStyle,
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Text(
                    'Tomorrow',
                    style: AppStyles.tomorrowTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Next 7 days'),
                  SizedBox(
                    width: 45,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15.17,
                    color: Color(0xff9A938C),
                  ),
                ],
              )
            ],
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 0.86,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 5,
              pressedElevation: 5,
            ),
            overlayShape: const RoundSliderOverlayShape(
              overlayRadius: 14,
            ),
          ),
          child: Slider(
            activeColor: Colors.black,
            inactiveColor: Colors.black,
            value: 100,
            max: 100,
            divisions: 5,
            label: 'hello',
            onChanged: (double value) {},
          ),
        ),
      ],
    );
  }
}
