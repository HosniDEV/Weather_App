import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/styles/colors.dart';
import 'package:lottie/lottie.dart';

class CardPage extends StatelessWidget {
  CardPage({
    super.key,
    required this.city,
    required this.icon,
    required this.main,
    required this.temp,
    required this.pressure,
    required this.visibility,
    required this.wind,
    required this.humidity,
  });
  String city;
  String icon;
  String main;
  String temp;
  double wind;
  int visibility;
  int pressure;
  int humidity;

  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: Customshape(),
                child: Opacity(
                  opacity: 0.4,
                  child: Container(
                    height: 120,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(13),
                            topLeft: Radius.circular(13)),
                        gradient: LinearGradient(
                            colors: [primaryColor, Color(0xfff669bbc)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$city'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${today.year}-${today.month}-${today.day}',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white54,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${temp}°C',
                              style: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$main',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: 100,
                      child: Image.network(
                          'https://openweathermap.org/img/wn/$icon.png',
                          fit: BoxFit.contain),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ],
          ),
          Positioned(
              bottom: -116,
              left: 0,
              right: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: CustomBottomshap(),
                    child: Opacity(
                      opacity: 0.5,
                      child: Container(
                        height: 150,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(13),
                                bottomLeft: Radius.circular(13)),
                            gradient: LinearGradient(
                                colors: [primaryColor, Color(0xfff669bbc)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Spacer(),
                        ColumnCard(
                            icon:
                                'https://assets9.lottiefiles.com/packages/lf20_lzvazfvb.json',
                            text2: '${wind} km/h',
                            text3: 'wind'),
                        Spacer(),
                        ColumnCard(
                            icon:
                                'https://assets1.lottiefiles.com/private_files/lf30_qqitaobc.json',
                            text2: '${pressure / 100} km',
                            text3: 'pressure'),
                        Spacer(),
                        ColumnCard(
                            icon:
                                'https://assets4.lottiefiles.com/private_files/lf30_wz3jxlbp.json',
                            text2: '${visibility / 1000}',
                            text3: 'visibility'),
                        Spacer(),
                        Spacer(),
                        ColumnCard(
                            icon:
                                'https://assets1.lottiefiles.com/packages/lf20_nfxa6agk.json',
                            text2: '${humidity} %',
                            text3: 'humidity'),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    ]);
  }
}

class ColumnCard extends StatelessWidget {
  ColumnCard({
    super.key,
    this.icon,
    this.text2,
    this.text3,
  });
  String? icon;
  String? text2;
  String? text3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.network(
          '$icon',
          height: 50,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '$text2',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Text(
          '$text3' == '' ? "" : '$text3',
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;

    path.lineTo(0, h);
    path.quadraticBezierTo(w / 2, h - 10, w, h - 40);

    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomBottomshap extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;

    path.lineTo(0, h);

    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.quadraticBezierTo(w / 2, h - 120, 0, 40);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
