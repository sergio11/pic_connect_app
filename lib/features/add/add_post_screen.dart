import 'package:flutter/material.dart';
import 'package:pic_connect/features/add/add_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPostBloc, AddPostState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return const Text("Add Post Screen");
        });
  }
}
