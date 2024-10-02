import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necstaff/models/ModelProvider.dart';
import 'package:necstaff/request/repository/roles_repo.dart';
import 'package:necstaff/utils.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  StaffBloc() : super(StaffInitial()) {
    on<GetAllOndutyRequestsByProctor>(getAllOndutyRequestsByProctor);
  }

  FutureOr<void> getAllOndutyRequestsByProctor(
      GetAllOndutyRequestsByProctor event, Emitter<StaffState> emit) async {
    emit(GetAllOndutyRequestsByProctorLoadingState());
    List res = await getllOndutyrequestByProctorFunction(event.proctorid);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(GetAllOndutyRequestsByProctorSuccessState(ondutylist: res[1]));
        },
        failure: () {
          emit(GetAllOndutyRequestsByProctorFailureState());
        });
  }
}
