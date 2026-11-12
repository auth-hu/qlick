import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:qlick/const/bool.dart';
import 'package:qlick/const/color.dart';
import 'package:qlick/const/splash_cons.dart';
import 'package:qlick/ui/splash_screen/splah_screen_component/qrCode.dart';

class SplashSecreen extends StatefulWidget {
  const SplashSecreen({super.key});

  @override
  State<SplashSecreen> createState() => _SplashSecreenState();
}

class _SplashSecreenState extends State<SplashSecreen> {
  final random = Random();
  final connection = InternetConnection().hasInternetAccess;
  late String selectedLink;
  String message = 'جاري التحقق من الانترنيت';
  IconData stutusIcon = Icons.wifi;
  Color stateColor = darkBackground;

  @override
  void initState() {
    super.initState();
    int randomNumber = Random().nextInt(AppLink.links.length);
    selectedLink = AppLink.links[randomNumber];
    Future.delayed(Duration(seconds: 4));
    checkConnection();
  }

  Future<void> checkConnection() async {
    await Future.delayed(const Duration(seconds: 4));

    final bool hasInternet = await InternetConnection().hasInternetAccess;
    if (!mounted) return;

    setState(() {
      offline = !hasInternet;

      if (offline) {
        message = 'لا يوجد اتصال بالانترنيت';
        stutusIcon = Icons.wifi_off;
        stateColor = Colors.red;
      } else {
        message = 'تم الاتصال بنجاح';
        stutusIcon = Icons.wifi;
        stateColor = Colors.green;

        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [SizedBox(height: 200), Qrcode(links: selectedLink,),
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
          width: double.infinity,
          child: Center(
            child: Text(
              'Qlick | كليك',
              style: GoogleFonts.rubik(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 24, bottom: 12, right: 175, left: 175),
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(12),
            color: darkBackground,
          ),
        ),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(0),
                child: Icon(stutusIcon,
                color: stateColor,
                size: 20,
                ),
              ),
              SizedBox(width: 12,),
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  message,
                ),
              )
            ]
          )
        ]),
      ),
    );
  }
}
