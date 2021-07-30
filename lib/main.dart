import 'package:flutter/material.dart';
import 'package:my_movie/screens/movie_details.dart';
import './screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My_Movies",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Home_Page(),
      initialRoute: "/",
      routes: {'/movie_detials': (context) => Movie_Details()},
    );
  }
}
