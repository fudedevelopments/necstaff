// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:necstaff/common/display_image.dart';

import 'package:necstaff/models/EventDetatils.dart';
import 'package:necstaff/utils.dart';

class EventsPage extends StatefulWidget {
  final List<EventDetatils> events;
   const EventsPage({
    super.key,
    required this.events,
  });

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(), // Ensures smooth scrolling
          itemCount: widget.events.length,
          itemBuilder: (context, index) {
            final event = widget.events[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                color: Colors
                    .grey[100], // Light grey background to complement orange
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: CircleAvatar(
                    radius: 25, // Smaller size
                    child:  ImageDisplay(imageUrlFuture: getimage(path: event.images![0])),
                  ),
                  title: Text(
                    event.eventname!,
                    style: TextStyle(
                      fontSize: 14, // Slightly smaller font
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800], // Neutral text color
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 3),
                      Text(
                        event.location!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black, // Amber to complement orange
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(event.date!,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
