import 'package:flutter/material.dart';
import 'package:movie_booking/screens/HomePage.dart';

import 'Data/Constant.dart';

void main() {
  runApp(MovieBooking());
}

class MovieBooking extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: 'Movie Booking',
      theme: ThemeData(primarySwatch: Constants.primary),
      routes: {},
    );
  }
}
