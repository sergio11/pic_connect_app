import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/feed/feed_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/postcard/post_card.dart';
import 'package:pic_connect/features/postcard/post_card_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/global_variable.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildScreenContent(state);
        });
  }

  Widget _buildScreenContent(FeedState state) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
        appBar: width > webScreenSize ? null : _buildAppBar(),
        body: state.isLoading ? _buildProgressIndicator() : _buildPostsList(state)
    );
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      centerTitle: false,
      title: SvgPicture.asset(
        'assets/pic_connect_logo.svg',
        color: accentColor,
        height: 32,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.messenger_outline,
            color: secondaryColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPostsList(FeedState state) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: state.posts.length,
      itemBuilder: (ctx, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
        child: BlocProvider(
            create: (context) => serviceLocator<PostCardBloc>()
              ..add(OnShowPostEvent(state.posts[index])),
            child: const PostCard()
        ),
      ),
    );
  }

}
