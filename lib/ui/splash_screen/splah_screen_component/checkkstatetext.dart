import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlick/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:qlick/cubit/splash_screen/splash_screen_state.dart';

class Checkkstatetext extends StatefulWidget {
  const Checkkstatetext({super.key});

  @override
  State<Checkkstatetext> createState() => _CheckkstatetextState();
}

class _CheckkstatetextState extends State<Checkkstatetext> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 200, right: 200, top: 32),
      child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
        builder: (context, state){
          IconData? stutusIcon;
          String message;

          switch (state.status) {
            case CheckStatus.checking:
              message = 
              break;
            default:
          }
        }
        ),
    );
  }
}