import 'package:flutter/material.dart';
import 'package:profile/app/data/models/profile_model.dart';

class ProfilePhoto extends StatelessWidget {
  final Picture picture;
  const ProfilePhoto({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(picture.large!),
        ),
      ),
    );
  }
}
