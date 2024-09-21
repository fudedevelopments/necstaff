// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:necstaff/add_events/ui/addevents.dart';
import 'package:necstaff/common/error_unknown.dart';
import 'package:necstaff/home/bloc/home_bloc.dart';
import 'package:necstaff/home/ui/announce_page.dart';
import 'package:necstaff/home/ui/events_page.dart';
import 'package:necstaff/utils.dart';

class MainScreen extends StatefulWidget {
  final List<String> useratributes;
  const MainScreen({
    super.key,
    required this.useratributes,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showEvents = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(GetAllHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationpush(context, const AddEvents());
          },
          tooltip: "Add Events & Annoucements",
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text(
            "NEC STAFF",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent.shade200,
          elevation: 1,
          shadowColor: Colors.black87,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is AllhomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AllhomeSucessState) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                          "Welcome :${widget.useratributes[1]}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                   
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showEvents = true;
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  showEvents ? Colors.white : Colors.orange,
                              backgroundColor:
                                  showEvents ? Colors.orange : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.orange),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Events'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showEvents = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              foregroundColor:
                                  !showEvents ? Colors.white : Colors.orange,
                              backgroundColor:
                                  !showEvents ? Colors.orange : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.orange),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text('Announcements'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  showEvents == true
                      ? EventsPage(
                          events: state.events,
                        )
                      : const AnnouncePage()
                ],
              );
            } else {
              return const ErrorUnkown();
            }
          },
        ));
  }
}
