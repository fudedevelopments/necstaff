// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'addevent_bloc.dart';

@immutable
sealed class AddeventEvent {}

class AddeventEventDetails extends AddeventEvent {
 final List<File> eventimages;
 final String eventname;
 final String details;
 final String date;
 final String location;
 final String registerurl;
  AddeventEventDetails({
    required this.eventimages,
    required this.eventname,
    required this.details,
    required this.date,
    required this.location,
    required this.registerurl,
  });
}
