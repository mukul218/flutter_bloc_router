import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../logic/blocs/main_bloc.dart';

part 'mf_event.dart';
part 'mf_state.dart';

class MfBloc extends MainBloc<MfEvent, MfState> {
  MfBloc() : super(MfInitial()) {
    on<MfEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
