import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:necstaff/add_events/ui/annouceadd.dart';
import 'package:necstaff/add_events/ui/eventadd.dart';
import 'package:necstaff/utils.dart';

class AddEvents extends StatefulWidget {
  const AddEvents({super.key});

  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  String _selectedType = 'Events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              pop(context);
            },
            icon: const Icon(Ionicons.arrow_back_circle)),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Select Type"),
                  DropdownButton<String>(
                    value: _selectedType,
                    items: const [
                      DropdownMenuItem(
                        value: 'Events',
                        child: Text('Events'),
                      ),
                      DropdownMenuItem(
                        value: 'Announcements',
                        child: Text('Announcements'),
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedType = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              _selectedType == "Events"
                  ? const EventAddlist()
                  : const AnnounceList()
            ],
          ),
        ),
      )),
    );
  }
}
