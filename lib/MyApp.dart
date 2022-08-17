import 'package:car_counter/vehicles_counter/vehicles_count_view.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: COLOR6),
      title: "counter",
      debugShowCheckedModeBanner: false,
      home: VehiclesCountScreen(),
    );
  }
}
