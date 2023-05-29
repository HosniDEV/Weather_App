import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:weather_app/model/weather_model.dart';

import '../Services/get_weather.dart';
import '../component/card.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final searchController = TextEditingController();

  final getData = getWeather();
  var data;
  WeatherModel? newData;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1439853949127-fa647821eba0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                )),
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xfff003566), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0, 1.3]),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 16, 12, 0),
              child: Column(children: [
                Row(children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: searchController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'choose a location',
                          hintStyle: TextStyle(color: Colors.white),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          fillColor: Color(0xfff003566).withOpacity(0.4)),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      fetchWeather();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff003566)),
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 13,
                ),
                Expanded(
                  child: newData != null
                      ? CardPage(
                          city: '${newData!.name}',
                          icon: '${newData!.weather!.icon}',
                          main: '${newData!.weather!.description}',
                          temp: '${((newData!.main!.temp! - 30) / 2).ceil()}',
                          pressure: newData!.main!.pressure!,
                          wind: newData!.wind!.speed!.toDouble(),
                          visibility: newData!.visibility!,
                          humidity: newData!.main!.humidity!,
                        )
                      : Center(
                          child: CircularProgressIndicator(color: Colors.amber),
                        ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void fetchWeather() async {
    data = await getData.getData(searchController.text);
    setState(() {
      newData = data;
    });
    searchController.clear();
  }
}
