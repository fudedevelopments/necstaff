import 'package:flutter/material.dart';

class AnnouncePage extends StatefulWidget {
  const AnnouncePage({super.key});

  @override
  State<AnnouncePage> createState() => _AnnouncePageState();
}

class _AnnouncePageState extends State<AnnouncePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyEvents = [
      {
        'imageUrl': 'https://images.pexels.com/photos/28098015/pexels-photo-28098015/free-photo-of-a-restaurant-with-tables-and-chairs-outside.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'name': 'Tech Conference 2024',
        'location': 'New York, NY',
        'date': 'September 10, 2024',
      },
      {
        'imageUrl': 'https://images.pexels.com/photos/11950175/pexels-photo-11950175.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'name': 'Music Fest',
        'location': 'Los Angeles, CA',
        'date': 'October 2, 2024',
      },
      {
        'imageUrl': 'https://images.pexels.com/photos/3855560/pexels-photo-3855560.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        'name': 'Art Exhibition',
        'location': 'San Francisco, CA',
        'date': 'November 15, 2024',
      },
    ];
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(), // Ensures smooth scrolling
          itemCount: dummyEvents.length,
          itemBuilder: (context, index) {
            final event = dummyEvents[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(8),
                color: Colors
                    .grey[100], 
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: CircleAvatar(
                    radius: 25, 
                    backgroundImage: NetworkImage(event['imageUrl']!),
                  ),
                  title: Text(
                    event['name']!,
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800], 
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 3),
                      Text(
                        event['location']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color:
                              Colors.black, 
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        event['date']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors
                              .black,
                        ),
                      ),
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