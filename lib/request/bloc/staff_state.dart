// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bloc.dart';

@immutable
sealed class StaffState {}

final class StaffInitial extends StaffState {}

class GetAllOndutyRequestsByProctorSuccessState extends StaffState {
 final List<Ondutyrequest?> ondutylist;
  GetAllOndutyRequestsByProctorSuccessState({
    required this.ondutylist,
  });
}

class GetAllOndutyRequestsByProctorLoadingState extends StaffState {}

class GetAllOndutyRequestsByProctorFailureState extends StaffState {}
