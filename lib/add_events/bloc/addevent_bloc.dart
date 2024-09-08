import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necstaff/add_events/repo/addrepo.dart';
import 'package:necstaff/utils.dart';
part 'addevent_event.dart';
part 'addevent_state.dart';

class AddeventBloc extends Bloc<AddeventEvent, AddeventState> {
  AddeventBloc() : super(AddeventInitial()) {
    on<AddeventEventDetails>(addeventEventDetails);
  }

  FutureOr<void> addeventEventDetails(
      AddeventEventDetails event, Emitter<AddeventState> emit) async {
    emit(AddEventLoadingstate());
    var res = await addevent(
        images: event.eventimages,
        eventname: event.eventname,
        eventdetails: event.details,
        date: event.date,
        location: event.location,
        registerurl: event.registerurl);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(AddEventSuccesstate());
        },
        failure: () {
          emit(AddEventLoadingstate());
        });
  }
}
