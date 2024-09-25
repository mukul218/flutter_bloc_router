import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:new_swaraj_app/logic/blocs/common_state.dart';
import 'package:new_swaraj_app/presentation/screens/auth_section/auth_repo/auth_fun/auth_fun.dart';
import '../../../../data/sources/handel_shared_prf.dart';
import '../../../../logic/blocs/main_bloc.dart';
import '../auth_repo/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends MainBloc<MainEvent, CommonState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckInternetEvent>(checkInternetEvent);
    on<CheckAppUpdataEvent>(checkAppUpdataEvent);
    on<CheckShowIntorSlideEvent>(checkShowIntorSlideEvent);

    on<CheckClientLoginEvent>(authCheckLoginStatusEvent);
  }

  AuthRepo authRepo = AuthRepo();

  Future<FutureOr<void>> checkInternetEvent(
      CheckInternetEvent event, Emitter<CommonState> emit) async {

    emit(MainLoading());
    var internetStatus = await AuthFun.checkinterNect();
    if (internetStatus) {
      print('Have Internet');
      emit(HaveInternetState());
    } else {
      print("Don't have Internet");
      emit(NoInternetState());
    }
  }

  Future<FutureOr<void>> checkAppUpdataEvent(
      CheckAppUpdataEvent event, Emitter<CommonState> emit) async {
    var checkAppUpdate = await AuthFun.checkAppUpdate();
    if (checkAppUpdate['status']) {
      if (checkAppUpdate['app_update']) {
        emit(UpdateAvaliableState());
      } else {
        emit(LatestVersionState());
      }
    } else {
      emit(MainError(checkAppUpdate['message']));
    }
  }

  Future<FutureOr<void>> checkShowIntorSlideEvent(
      CheckShowIntorSlideEvent event, Emitter<CommonState> emit) async {
    // check if user open app first time after install or not
    var introStatus = await HandleSharedPrf.checkSharedPrf('intro_slide');
    if (!introStatus) {
      emit(ShowIntroSlideState());
    } else {
      emit(NotShowIntroSlideState());
    }
  }

  FutureOr<void> authCheckLoginStatusEvent(
      CheckClientLoginEvent event, Emitter<CommonState> emit) {
    // check if user is login or not using shared_preference
  }
}
