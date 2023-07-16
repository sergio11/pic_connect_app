import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/comments/comments_bloc.dart';
import 'package:pic_connect/features/core/widgets/comment_card.dart';
import 'package:pic_connect/utils/colors.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController commentEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsBloc, CommentsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildScreenContent(state);
        });
  }

  Widget _buildScreenContent(CommentsState state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: const Text(
            'Comments',
          ),
          centerTitle: false,
        ),
        body: state.isLoading
            ? _buildProgressIndicator()
            : _buildCommentsListView(state),
        bottomNavigationBar: _buildTextInput(state)
    );
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildCommentsListView(CommentsState state) {
    return ListView.builder(
      itemCount: state.commentsByPost.length,
      itemBuilder: (ctx, index) => CommentCard(
        commentBO: state.commentsByPost[index],
      ),
    );
  }

  Widget _buildTextInput(CommentsState state) {
    return SafeArea(
      child: Container(
        height: kToolbarHeight,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
              radius: 18,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                  controller: commentEditingController,
                  decoration: InputDecoration(
                    hintText: 'Comment as ',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
