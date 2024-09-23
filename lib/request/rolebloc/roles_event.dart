// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'roles_bloc.dart';

@immutable
sealed class RolesEvent {}

class GetAllStaffDetailsEvent extends RolesEvent {
  final String email;
  GetAllStaffDetailsEvent({
    required this.email,
  });
}
