import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicatorSpinKit extends StatelessWidget {
  const LoadingIndicatorSpinKit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: 
          SpinKitFadingCircle(
            color: Colors.blueAccent,
            size: 60.0,
          ),
      
    );
  }
}
