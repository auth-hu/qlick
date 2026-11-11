import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qlick/const/color.dart';
import 'package:qlick/const/splash_cons.dart';
import 'package:qlick/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:qlick/ui/splash_screen/splah_screen_component/checkkstatetext.dart';
import 'package:qlick/ui/splash_screen/splah_screen_component/qrCode.dart';

class SplashSecreen extends StatefulWidget {
  const SplashSecreen({super.key});

  @override
  State<SplashSecreen> createState() => _SplashSecreenState();
}

class _SplashSecreenState extends State<SplashSecreen> {
  final random = Random();

  late String selectedLink;

  @override
  void initState() {
    super.initState();
    int randomNumber = Random().nextInt(AppLink.links.length);
    selectedLink = AppLink.links[randomNumber];
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

        BlocProvider(
          create: (context) => SplashScreenCubit()..checkAll(),
          child: Checkkstatetext(),
          )
        ]),
      ),
    );
  }
}
