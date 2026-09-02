import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_time_state.dart';

class SelectTimeCubit extends Cubit<SelectTimeState> {
  SelectTimeCubit() : super(SelectTimeInitial());
}
