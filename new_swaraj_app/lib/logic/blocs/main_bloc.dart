import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_swaraj_app/logic/blocs/common_state.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc<E extends MainEvent, S extends CommonState> extends Bloc<E, S> {
  MainBloc(S initialState) : super(initialState);
}




