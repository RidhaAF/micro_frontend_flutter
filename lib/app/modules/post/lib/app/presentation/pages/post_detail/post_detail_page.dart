import 'package:flutter/material.dart';
import 'package:post/app/data/models/post_model.dart';
import 'package:post/app/presentation/widgets/post_list_tile.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late PostModel post;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    post = ModalRoute.of(context)!.settings.arguments as PostModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title ?? 'Title'),
      ),
      body: _postDetailApp(),
    );
  }

  Widget _postDetailApp() {
    return SingleChildScrollView(
      child: _postDetailListTile(),
    );
  }

  Widget _postDetailListTile() {
    return PostListTile(post: post);
  }
}
