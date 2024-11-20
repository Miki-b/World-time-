import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/worldTime.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void setupTime() async {
    worldTime w1= worldTime(location:  'Addis ababa', url:'Africa/Addis_Ababa',flag:  'eth.png');
    await w1.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'time':w1.time,
      'location':w1.location,
      'flag':w1.flag,
      'isday':w1.isday
    });
    //print(w1.time);
  }


  @override
  void initState() {
    super.initState();
    setupTime();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body:
        Center(
          child: SpinKitCircle(
            color:Colors.white,
            size: 80.0,
          ),
        )

    );
  }
}
