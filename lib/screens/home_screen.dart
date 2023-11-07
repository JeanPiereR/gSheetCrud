import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    getApi();
  }

  Future<void> getApi() async {
    final response = await Dio().get(
      "https://api.sheety.co/d75fef89c2c946298e85bdc044ce36ef/proyecto1/zonas"
      );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API SHEETS")
      ),

      body: const SizedBox(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {}),
    );
  }
}
