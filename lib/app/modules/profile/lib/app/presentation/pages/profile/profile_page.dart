import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/default_loading_indicator.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/default_refresh_indicator.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/error_message.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:profile/app/data/models/profile_model.dart';
import 'package:profile/app/presentation/cubit/profile/profile_cubit.dart';
import 'package:profile/injection.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileCubit _profileCubit;

  Future<void> _getProfile() async {
    if (!_profileCubit.isClosed) {
      await _profileCubit.getProfile();
    }
  }

  Future<void> _onRefresh() async {
    _getProfile();
  }

  @override
  void initState() {
    super.initState();
    _profileCubit = di<ProfileCubit>();
    _getProfile();
  }

  @override
  void dispose() {
    _profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: _profileApp(),
    );
  }

  Widget _profileApp() {
    return DefaultRefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: _profileListView(),
    );
  }

  Widget _profileListView() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: _profileCubit,
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const DefaultLoadingIndicator();
        } else if (state is ProfileLoaded) {
          final ProfileModel profile = state.profile;
          Picture? picture = profile.results![0].picture;
          Name? name = profile.results![0].name;
          String? email = profile.results![0].email;

          return ListView(
            padding: const EdgeInsets.all(AppConstants.defaultMargin),
            children: [
              _profilePhoto(picture!),
              const SizedBox(height: AppConstants.defaultMargin),
              _profileName(name!),
              _profileEmail(email!),
            ],
          );
        } else if (state is ProfileError) {
          return ErrorMessage(message: state.message);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _profilePhoto(Picture picture) {
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

  Widget _profileName(Name name) {
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

  Widget _profileEmail(String email) {
    return Text(
      email,
      style: const TextStyle(
        color: Colors.grey,
      ),
      textAlign: TextAlign.center,
    );
  }
}
