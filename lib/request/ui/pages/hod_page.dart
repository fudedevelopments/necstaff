import 'package:flutter/material.dart';

class HodPage extends StatefulWidget {
  const HodPage({super.key});

  @override
  State<HodPage> createState() => _HodPageState();
}

class _HodPageState extends State<HodPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hod page"),
      ),
    );
  }
}