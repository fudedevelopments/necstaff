import 'package:flutter/material.dart';

class AcademicCoordinatorPage extends StatefulWidget {
  const AcademicCoordinatorPage({super.key});

  @override
  State<AcademicCoordinatorPage> createState() => _AcademicCoordinatorPageState();
}

class _AcademicCoordinatorPageState extends State<AcademicCoordinatorPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Ac page"),
      ),);
  }
}