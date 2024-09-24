import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../data/models/auth_models/check_app_version_model.dart';
import '../../../../logic/blocs/main_bloc.dart';
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
    emit(loadingState());
    // Check Internet Connection
    var internetStatus = await checkinterNect();
    if (internetStatus) {
      // Check App Version
      Map<String, dynamic> data = {
        'key': 'mySwarajSecret',
        'platform': (Platform.isIOS) ? 'ios' : 'android',
      };
      var appVersionResult = await authRepo.apiGetLatestVersionApp(data);
      var latestBuild = appVersionResult.data[0].buildNo;

      if (appVersionResult.status) {
        PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
            // Check Version and show alert for update.
            var buildNumber = packageInfo.buildNumber;
            print('Latest Version is : $latestBuild');
            print('Current Version is : $buildNumber');
            if (int.parse(latestBuild) > int.parse(buildNumber)) {
              // emit('Emit state for update');
              print('Update Version');
            } else {
              // Emit('Emit State for Next state');
              print('Latest Version - Go to next step');
            }
        });
      } else {
        // emit(errorState);
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


class  AuthBlocNew extends MainBloc{

}