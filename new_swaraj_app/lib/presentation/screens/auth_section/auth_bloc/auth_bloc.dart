import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../data/models/auth_models/check_app_version_model.dart';
import '../auth_repo/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSplashInitialEvent>(authSplashInitialEvent);
    on<AuthCheckInternewEvent>(authCheckInternewEvent);
  }
  AuthRepo authRepo = AuthRepo();

  Future<FutureOr<void>> authSplashInitialEvent(
      AuthSplashInitialEvent event, Emitter<AuthState> emit) async {
    // emit(loadingState());
    // Check Internet Connection
    var internetStatus = await checkinterNect();
    if (internetStatus) {
      // Check App Version
      Map<String, dynamic> data = {
        'key': 'mySwarajSecret',
        'platform': (Platform.isIOS) ? 'ios' : 'android',
      };
      var appVersionResult = await authRepo.apiGetLatestVersionApp(data);
      if (appVersionResult.status) {
        print('Get the Data Handel it ${appVersionResult.data[0].versionNo}');
      } else {
        print('Error Wile Fetching Data ${appVersionResult}');
      }
      // emit(AuthInitialState());
    } else {
      print("Don't have Internet");
      emit(AuthNoInternetState());
    }
  }

  Future<FutureOr<void>> authCheckInternewEvent(
      AuthCheckInternewEvent event, Emitter<AuthState> emit) async {
    var internetStatus = await checkinterNect();
    if (internetStatus) {
      print('Have Internet');
      emit(AuthInitialState());
    } else {
      print("Don't have Internet");
      emit(AuthNoInternetState());
    }
  }

  Future<bool> checkinterNect() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }
}
