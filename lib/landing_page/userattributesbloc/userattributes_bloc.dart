import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necstaff/landing_page/repo/landing_pagr_repo.dart';

part 'userattributes_event.dart';
part 'userattributes_state.dart';

class UserattributesBloc
    extends Bloc<UserattributesEvent, UserattributesState> {
  UserattributesBloc() : super(UserattributesInitial()) {
    on<GetUserAttributesEvent>(getUserAttributesEvent);
  }

  FutureOr<void> getUserAttributesEvent(
      GetUserAttributesEvent event, Emitter<UserattributesState> emit) async {
    emit(GetUserAttributesLoadingState());
    List<String> attributes = await fetchUserAttributes();
    emit(GetUserAttributesSuccessState(attributes: attributes));
  }
}
