import 'package:flutter/material.dart';
import 'package:micro_frontend_flutter/app/utils/constants/app_constants.dart';
import 'package:post/app/models/post_model.dart';

class PostListTile extends StatelessWidget {
  final PostModel post;
  final void Function()? onTap;
  const PostListTile({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
      onTap: onTap,
    );
  }
}
