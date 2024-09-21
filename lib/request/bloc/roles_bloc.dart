import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necstaff/models/ModelProvider.dart';
import 'package:necstaff/request/repository/roles_repo.dart';
import 'package:necstaff/utils.dart';

part 'roles_event.dart';
part 'roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  RolesBloc() : super(RolesInitial()) {
    on<GetAllStaffDetailsEvent>(getAllStaffDetailsEvent);
  }

  FutureOr<void> getAllStaffDetailsEvent(
      GetAllStaffDetailsEvent event, Emitter<RolesState> emit) async {
    emit(GetAllStaffDetailsLoadingState());
    List res = await getallStaffDetailsfunction(event.email);
    handlebloc(
      statuscode: res[0],
      success: () {
        emit(GetAllStaffDetailsSuccessState(proctordatalist: res[1]));
      },
      failure: () {
        emit(GetAllStaffDetailsFailureState());
      },
    );
  }
}
