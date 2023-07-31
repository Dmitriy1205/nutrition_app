import 'package:flutter/material.dart';

class PhaseScreen extends StatelessWidget {
  const PhaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
        body: Center(
      child: Text('Phase',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
    ));
  }
}
