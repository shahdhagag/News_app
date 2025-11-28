import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/services/news_services.dart';
void main() {
  runApp(const MyApp());
 NewsService (Dio()).getNews(
   category: "general",
 );
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return

       MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeScreen(),


    );
  }
}
