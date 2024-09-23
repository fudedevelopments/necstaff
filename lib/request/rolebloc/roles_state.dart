// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'roles_bloc.dart';

@immutable
sealed class RolesState {}

final class RolesInitial extends RolesState {}

class GetAllStaffDetailsSuccessState extends RolesState {
  final List<Proctor> proctordatalist;
  final List<Ac> acdatalist;
  final List<Hod> hodlist;
  GetAllStaffDetailsSuccessState({
    required this.proctordatalist,
    required this.acdatalist,
    required this.hodlist,
  });
}

class GetAllStaffDetailsFailureState extends RolesState {}

class GetAllStaffDetailsLoadingState extends RolesState {}

class GetAllStaffDetailsEmptyState extends RolesState {}
