part of 'addevent_bloc.dart';

@immutable
sealed class AddeventState {}

final class AddeventInitial extends AddeventState {}


class AddEventSuccesstate extends AddeventState{}


class AddEventFailurestate extends AddeventState {}


class AddEventLoadingstate extends AddeventState {}
