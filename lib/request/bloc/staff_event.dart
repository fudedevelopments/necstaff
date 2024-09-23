// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bloc.dart';

@immutable
sealed class StaffEvent {}

class GetallclassRoomDetailsbyProctor extends StaffEvent {
  final String proctorid;
  GetallclassRoomDetailsbyProctor({
    required this.proctorid,
  });
}
