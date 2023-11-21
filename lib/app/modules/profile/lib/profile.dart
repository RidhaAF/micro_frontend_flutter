library profile;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/app/presentation/cubit/profile/profile_cubit.dart';
import 'package:profile/app/presentation/pages/profile/profile_page.dart';
import 'package:profile/injection.dart';

class ProfileApp extends StatelessWidget {
  ProfileApp({super.key});

  static ProfileApp create() {
    setupInjection();
    return ProfileApp();
  }

  final ProfileCubit profileCubit = di<ProfileCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context) => profileCubit,
        ),
      ],
      child: MaterialApp(
        title: 'Profile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProfilePage(),
      ),
    );
  }
}
