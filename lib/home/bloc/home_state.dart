// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class AllhomeSucessState extends HomeState {
 final List<EventDetatils> events;
  AllhomeSucessState({
    required this.events,
  });
}

class AllhomefailureState extends HomeState {}

class AllhomeLoadingState extends HomeState {}
