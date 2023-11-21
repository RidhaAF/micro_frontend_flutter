import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:profile/app/data/models/profile_model.dart';

class ProfileName extends StatelessWidget {
  final Name name;
  const ProfileName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    String fullname = '${name.first} ${name.last}';

    return Text(
      fullname,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: AppConstants.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
