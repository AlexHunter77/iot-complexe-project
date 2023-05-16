import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iot_project/data/weather_data.dart';



var dayInfo = DateTime.now();
var dayFormat = DateFormat('EEEE , d MMM, yyyy').format(dayInfo);

class WeatherCard extends StatelessWidget {
  var client = WeatherData();

  var data;

  info() async {
    data = await client.getData('Jendouba');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: info(),
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [ Color.fromARGB(255, 31, 106, 217),Color.fromARGB(255, 45, 122, 237)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.2, 0.4],
            ),
          ),
          child: Column(
            children: [
              Text(
                '${data?.cityName}',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                dayFormat,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 10,),
              // Image.network(
              //   'https:${data?.icon}',
              //   fit: BoxFit.fill,
              //   width: 90,
              // ),
              
              Text(
                '${data?.condition}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${data?.temp}°',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/storm.png',
                        width: 30,
                      ),
                      Text('${data?.wind} km/h',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('Wind',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.6))),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/humidity.png',
                        width: 30,
                      ),
                      Text('${data?.humidity}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('Humidity',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.6))),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/wind-direction.png',
                        width: 30,
                      ),
                      Text('${data?.windDir}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('Wind direction',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.6))),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
