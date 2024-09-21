// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'roles_bloc.dart';

@immutable
sealed class RolesState {}

final class RolesInitial extends RolesState {}

class GetAllStaffDetailsSuccessState extends RolesState {
  final List<Proctor> proctordatalist;
  GetAllStaffDetailsSuccessState({
    required this.proctordatalist,
  });
}

class GetAllStaffDetailsFailureState extends RolesState {}

class GetAllStaffDetailsLoadingState extends RolesState {}


class GetAllStaffDetailsEmptyState extends RolesState {}
