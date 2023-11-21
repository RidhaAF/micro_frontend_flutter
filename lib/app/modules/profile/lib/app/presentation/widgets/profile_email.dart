import 'package:flutter/material.dart';

class ProfileEmail extends StatelessWidget {
  final String email;
  const ProfileEmail({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Text(
      email,
      style: const TextStyle(
        color: Colors.grey,
      ),
      textAlign: TextAlign.center,
    );
  }
}
