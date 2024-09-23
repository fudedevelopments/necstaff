import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necstaff/request/repository/roles_repo.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  StaffBloc() : super(StaffInitial()) {
    on<GetallclassRoomDetailsbyProctor>(getallclassRoomDetailsbyProctor);
  }

  FutureOr<void> getallclassRoomDetailsbyProctor(
      GetallclassRoomDetailsbyProctor event, Emitter<StaffState> emit) async {
    getallclassRoomDetailByProctorFunction(event.proctorid);
  }
}
