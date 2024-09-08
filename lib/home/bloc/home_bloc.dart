import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necstaff/home/repo/home_repo.dart';
import 'package:necstaff/models/EventDetatils.dart';
import 'package:necstaff/utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetAllHome>(getAllHome);
  }

  FutureOr<void> getAllHome(GetAllHome event, Emitter<HomeState> emit) async {
    emit(AllhomeLoadingState());
    List res = await getAllHomefunction();
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(AllhomeSucessState(events: res[1]));
        },
        failure: () {
          emit(AllhomefailureState());
        });
  }
}
