import 'package:flutter/material.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return const Text("Feed Screen");
        });
  }
}
