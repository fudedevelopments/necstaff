import 'package:flutter/material.dart';

class ProctorClassRoomDetailsScreen extends StatefulWidget {
  const ProctorClassRoomDetailsScreen({super.key});

  @override
  State<ProctorClassRoomDetailsScreen> createState() =>
      _ProctorClassRoomDetailsScreenState();
}

class _ProctorClassRoomDetailsScreenState
    extends State<ProctorClassRoomDetailsScreen> {
  final List<Map<String, String>> onDutyRequests = [
    {
      'studentName': 'John Doe',
      'requestName': 'Medical Leave',
      'email': 'johndoe@example.com',
      'date': '2024-09-20',
      'location': 'Room 101'
    },
    {
      'studentName': 'Jane Smith',
      'requestName': 'Sports Event',
      'email': 'janesmith@example.com',
      'date': '2024-09-21',
      'location': 'Room 202'
    },
    {
      'studentName': 'Alice Johnson',
      'requestName': 'Personal Leave',
      'email': 'alicej@example.com',
      'date': '2024-09-22',
      'location': 'Room 303'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proctor Class Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
             
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: onDutyRequests.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final request = onDutyRequests[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.yellow],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      request['studentName']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Request: ${request['requestName']}"),
                        Text("Email: ${request['email']}"),
                        Text("Date: ${request['date']}"),
                        Text("Location: ${request['location']}"),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
