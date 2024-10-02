// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bloc.dart';

@immutable
sealed class StaffEvent {}

class GetAllOndutyRequestsByProctor extends StaffEvent {
  final String proctorid;
  GetAllOndutyRequestsByProctor({
    required this.proctorid,
  });
}
