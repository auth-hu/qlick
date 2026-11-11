import 'package:flutter/material.dart';

enum CheckStatus {
  checking,
  seccess,
  failure
}

sealed class SplashScreenState{
  final String name;
  final IconData icon;
  final CheckStatus status;
  const SplashScreenState({required this.name, required this.icon, required this.status});

}



class ConnectionActivityState extends SplashScreenState {
  const ConnectionActivityState({
    required super.status
  }): super(
    name: "...جاري الاتصال بالأنترنيت",
    icon: Icons.wifi
  );
}

class FirebaseState extends SplashScreenState {
  const FirebaseState({
    required super.status
  }): super(
    name: "...جاري الاتصال السيرفر",
    icon: Icons.cloud
  );
}

class LocalDataState extends SplashScreenState {
  const LocalDataState({
    required super.status
  }): super(
    name: "...جاري فحص الملفات",
    icon: Icons.storage
  );
}
