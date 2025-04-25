import 'package:flutter/material.dart';
import 'package:ucp1/navigation/piketpage.dart';
import 'package:ucp1/navigation/pelangganpage.dart';
import 'package:ucp1/navigation/pendataanpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        )),
    );
  }
}