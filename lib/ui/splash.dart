import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/login')
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color : Colors.white,
      child: Center(
        child: Text("Praktikum\nPPB",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xff3D4DE0)
        ),)
      ),
    );
  }
}
