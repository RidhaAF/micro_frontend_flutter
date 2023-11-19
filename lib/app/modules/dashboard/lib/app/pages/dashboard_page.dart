import 'package:dashboard/app/cubit/post/post_cubit.dart';
import 'package:dashboard/app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_frontend_flutter/app/utils/app_constants.dart';
import 'package:micro_frontend_flutter/app/widgets/default_loading_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/default_refresh_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/error_message.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void _getPosts() {
    context.read<PostCubit>().getPosts();
  }

  _onRefresh() async {
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: _dashboardApp(),
    );
  }

  Widget _dashboardApp() {
    return DefaultRefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: _dashboardListView(),
    );
  }

  Widget _dashboardListView() {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostLoading) {
          return const DefaultLoadingIndicator();
        } else if (state is PostLoaded) {
          final List<PostModel> posts = state.posts;
          final int postsLength = posts.length;

          return ListView.builder(
            padding: const EdgeInsets.all(AppConstants.defaultMargin),
            itemCount: postsLength,
            itemBuilder: (context, i) {
              final PostModel post = posts[i];

              return _dashboardListTile(post);
            },
          );
        } else if (state is PostError) {
          return ErrorMessage(message: state.message);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _dashboardListTile(PostModel post) {
    return ListTile(
      title: Text(post.title ?? 'No title'),
      subtitle: Text(post.body ?? 'No body'),
      contentPadding: EdgeInsets.zero,
    );
  }
}
