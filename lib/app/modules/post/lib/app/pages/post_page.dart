import 'package:post/app/cubit/post/post_cubit.dart';
import 'package:post/app/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:micro_frontend_flutter/app/widgets/default_loading_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/default_refresh_indicator.dart';
import 'package:micro_frontend_flutter/app/widgets/error_message.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
        title: const Text('Post'),
      ),
      body: _postApp(),
    );
  }

  Widget _postApp() {
    return DefaultRefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const DefaultLoadingIndicator();
          } else if (state is PostLoaded) {
            final List<PostModel> posts = state.posts;

            return _postListView(posts);
          } else if (state is PostError) {
            return ErrorMessage(message: state.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _postListView(List<PostModel> posts) {
    final int postsLength = posts.length;

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultMargin),
      itemCount: postsLength,
      itemBuilder: (context, i) {
        final PostModel post = posts[i];

        return _postListTile(post);
      },
    );
  }

  Widget _postListTile(PostModel post) {
    return ListTile(
      title: Text(
        post.title ?? 'Title',
        style: const TextStyle(
          fontWeight: AppConstants.bold,
        ),
      ),
      subtitle: Text(post.body ?? 'Description'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
