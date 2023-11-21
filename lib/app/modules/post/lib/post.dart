library post;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post/app/presentation/cubit/post/post_cubit.dart';
import 'package:post/app/presentation/pages/post/post_page.dart';
import 'package:post/app/routes/app_pages.dart';
import 'package:post/injection.dart';

class PostApp extends StatelessWidget {
  PostApp({super.key});

  static PostApp create() {
    setupInjection();
    return PostApp();
  }

  final PostCubit postCubit = di<PostCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => postCubit),
      ],
      child: MaterialApp(
        title: 'Post',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostPage(),
        routes: AppPages.pages,
      ),
    );
  }
}
