import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path/path.dart';
import 'package:qlick/cubit/splash_screen/splash_screen_state.dart';
import 'package:sqflite/sqflite.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit()
    : super(const ConnectionActivityState(status: CheckStatus.checking));

  Future checkInternet() async {
    final connection = await InternetConnection().hasInternetAccess;
    switch (connection) {
      case true:
        ConnectionActivityState(status: CheckStatus.seccess);
      case false:
        ConnectionActivityState(status: CheckStatus.failure);
        break;
      }
  }
  
  Future checkFirestoreBase() async{
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection(uid).limit(1).get().timeout(Duration(seconds: 10));
  }

  Future checkLocal() async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'click.db');
    final db = await openDatabase(path, version: 1);
    try {
      await db.rawQuery('SELECT 1');
    } finally {
      db.close();
    }
  }

  Future runCheck({
    required SplashScreenState checking,
    required SplashScreenState success,
    required SplashScreenState failure,
    required Future Function() action,
  }) async {
    emit(checking);
    try {
      await action().timeout(Duration(seconds: 10));

      emit(success);
    } catch (e) {
      emit(failure);
    }

    await Future.delayed(Duration(milliseconds: 700));
  }

  Future checkAll() async{
    await runCheck(
      checking: ConnectionActivityState(status: CheckStatus.checking),
      success: ConnectionActivityState(status: CheckStatus.seccess),
      failure: ConnectionActivityState(status: CheckStatus.failure),
      action: await checkInternet(),
    );

    await runCheck(
      checking: ConnectionActivityState(status: CheckStatus.checking),
      success: ConnectionActivityState(status: CheckStatus.seccess),
      failure: ConnectionActivityState(status: CheckStatus.failure),
      action: await checkFirestoreBase(),
    );

    await runCheck(
      checking: ConnectionActivityState(status: CheckStatus.checking),
      success: ConnectionActivityState(status: CheckStatus.seccess),
      failure: ConnectionActivityState(status: CheckStatus.failure),
      action: await checkLocal(),
    );
  }
}
