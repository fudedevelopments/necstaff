part of 'userattributes_bloc.dart';

@immutable
sealed class UserattributesEvent {}

class GetUserAttributesEvent extends UserattributesEvent{}
