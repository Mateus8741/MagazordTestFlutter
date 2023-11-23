import 'package:flutter/material.dart';
import 'package:magazordtestf/modules/weather_app/widgets/footer_info.dart';
import 'package:magazordtestf/modules/weather_app/widgets/locale.dart';

import '../../shared/widgets/logo.dart';
import '../widgets/weather_info.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoComponent(
          firstPartText: 'Weather',
          colorLogo: Colors.orange,
        ),
      ),
      body: const Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LocaleWeather(name: 'São Paulo', region: 'SP'),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  children: [
                    WeatherInfo(
                        celcius: '20',
                        weatherType: 'Snowy',
                        imageUrl:
                            'https://cdn.pixabay.com/photo/2016/11/29/13/07/beach-1867271_960_720.jpg'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FooterInfo(
                          textVar: '11.2 km/h', iconVar: Icons.wind_power),
                      SizedBox(width: 20),
                      FooterInfo(textVar: '18%', iconVar: Icons.water_drop),
                      SizedBox(width: 20),
                      FooterInfo(textVar: '5%', iconVar: Icons.wb_cloudy),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
