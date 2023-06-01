import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/pages/config.dart';

class ProgressIndicatorWidget1 extends StatefulWidget {
  const ProgressIndicatorWidget1({Key? key}) : super(key: key);

  @override
  _ProgressIndicatorWidgetState1 createState() => _ProgressIndicatorWidgetState1();
}

class _ProgressIndicatorWidgetState1 extends State<ProgressIndicatorWidget1> {
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
    
      const headers = {'Content-Type': 'application/json'};
      final response = await http.get(Uri.parse(level1) , headers: headers);
      if (response.statusCode == 200) {
        // Data retrieval was successful
        setState(() {
          data = response.body;
        });
      }else {
      setState(() {
        data = 'Error: ${response.statusCode}';
      }); 
    } 
  }

  @override
  Widget build(BuildContext context) {
    late double x ;
     x = double.parse(data) / 100;
    return CircularPercentIndicator(
      radius: 75.0,
      lineWidth: 10.0,
      percent: data.isNotEmpty ? x : 0.0,
      center: Text(
        //data.isNotEmpty ? 
        '$data  %',// : 'Loading...', // Show loading indicator if data is empty
        style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
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