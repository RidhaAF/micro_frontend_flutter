import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/default_loading_indicator.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/default_refresh_indicator.dart';
import 'package:micro_frontend_flutter/app/presentation/widgets/error_message.dart';
import 'package:post/app/data/models/post_model.dart';
import 'package:post/app/presentation/cubit/post/post_cubit.dart';
import 'package:post/app/presentation/widgets/post_list_tile.dart';

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
      itemCount: postsLength,
      itemBuilder: (context, i) {
        final PostModel post = posts[i];

        return _postListTile(post);
      },
    );
  }

  Widget _postListTile(PostModel post) {
    return PostListTile(
      post: post,
      onTap: () {
        Navigator.pushNamed(
          context,
          '/posts/:id',
          arguments: post,
        );
      },
    );
  }
}
