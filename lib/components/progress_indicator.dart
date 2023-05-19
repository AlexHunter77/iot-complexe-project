import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/pages/config.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  _ProgressIndicatorWidgetState createState() => _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  Timer? _timer;
  String data = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      fetchData();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> fetchData() async {
    try {
      //const headers = {'Content-Type': 'application/json'};
      final response = await http.get(Uri.parse(level));
      if (response.statusCode == 200) {
        // Data retrieval was successful
        setState(() {
          data = response.body;
        });
      } 
    } catch (e) {
      setState(() {
        data = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 75.0,
      lineWidth: 10.0,
      percent: data.isNotEmpty ? double.parse(data) / 100 : 0.0,
      center: Text(
        data.isNotEmpty ? data : 'Loading...', // Show loading indicator if data is empty
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
      ),
      progressColor: Colors.blue,
      backgroundColor: Colors.blue.shade100,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

























/*import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/pages/config.dart';
class progressIndicator extends StatefulWidget {
  const progressIndicator({super.key});

  @override
  State<progressIndicator> createState() => _progressIndicatorState();
}
void fetchData() async {
  try {
    var response = await http.get(Uri.parse(Temp));
    if (response.statusCode == 200) {
      // Data retrieval was successful
      var data = response.body;
      print(data);
    } else {
      // Error occurred while fetching data
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Error occurred during the HTTP request
    print('Error: $e');
  }
}
class _progressIndicatorState extends State<progressIndicator> {
  @override
  Widget build(BuildContext context) {
    return  CircularPercentIndicator(
            radius:75.0,
            lineWidth: 10.0,
            percent: 0.4,

            center: Text("40%",style:TextStyle(fontSize: 30,fontWeight: FontWeight.normal)),
            progressColor: Color(0xff005BE0),
            backgroundColor: Colors.blue.shade100,
            circularStrokeCap: CircularStrokeCap.round,
          );
      
  }
}

*/