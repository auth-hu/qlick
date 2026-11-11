import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlick/const/color.dart';
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
          Color stateColor;
          String message;

          switch (state.status) {
            case CheckStatus.checking:
              message = ' ${state.name} جاري الاتصال ب';
              stateColor = darkBorder;
            case CheckStatus.seccess:
              message = ' ${state.name} جاري الاتصال ب';
              stateColor = Colors.green;
            case CheckStatus.failure:
              message = ' ${state.name} جاري الاتصال ب';
              stateColor = Colors.red;
          }

          return Row(
            children: [
              if(state.status == CheckStatus.checking)
              SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(strokeWidth: 2.5,),
              )
              else
              Container(
                width: 55,
                child: Icon(stutusIcon,
                color: stateColor,
                size: 25,
                ),
              ),
              SizedBox(width: 12,),
              Container(
                width: double.infinity,
                child: Text(
                  message,
                ),
              )
            ]
          );
        }
        ),
    );
  }
}