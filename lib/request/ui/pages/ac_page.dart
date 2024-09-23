// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:necstaff/common/empty_page.dart';

import 'package:necstaff/models/Ac.dart';

class AcademicCoordinatorPage extends StatefulWidget {
  final List<Ac> acdatalist;
  const AcademicCoordinatorPage({
    super.key,
    required this.acdatalist,
  });

  @override
  State<AcademicCoordinatorPage> createState() =>
      _AcademicCoordinatorPageState();
}

class _AcademicCoordinatorPageState extends State<AcademicCoordinatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: widget.acdatalist.isEmpty
            ? const EmptyPage(message: "NO Data Found")
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Your Class Rooms",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                        itemCount: widget.acdatalist.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFFFA726),
                                  Colors.orange.shade300,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: ListTile(
                                title: Text(
                                  "Class: ${widget.acdatalist[index].classRoom!.classRoomname}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(15),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ));
  }
}
