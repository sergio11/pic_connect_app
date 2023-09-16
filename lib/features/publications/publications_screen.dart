import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/di/service_locator.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/features/postcard/post_card.dart';
import 'package:pic_connect/features/postcard/post_card_bloc.dart';
import 'package:pic_connect/features/publications/publications_bloc.dart';
import 'package:pic_connect/utils/colors.dart';

class PublicationsScreen extends StatefulWidget {
  final Function(String postId) onShowCommentsByPost;
  final Function(String userUid) onShowUserProfile;

  const PublicationsScreen(
      {Key? key,
      required this.onShowUserProfile,
      required this.onShowCommentsByPost})
      : super(key: key);

  @override
  State<PublicationsScreen> createState() => _PublicationsScreenState();
}

class _PublicationsScreenState extends State<PublicationsScreen> {
  void onRefresh(PublicationsState state) async {
    context
        .read<PublicationsBloc>()
        .add(OnLoadPublicationsEvent(state.authorUserUid, state.type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PublicationsBloc, PublicationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return _buildScreenContent(context, state);
        });
  }

  Widget _buildScreenContent(BuildContext context, PublicationsState state) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: accentColor, //change your color here
        ),
        backgroundColor: appBarBackgroundColor,
        title: Text("Publications (${state.postLen})",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: accentColor)),
        centerTitle: false,
      ),
      body: RefreshIndicator(
          backgroundColor: secondaryColor,
          color: accentColor,
          onRefresh: () {
            return Future.delayed(
              const Duration(seconds: 1),
              () => onRefresh(state),
            );
          },
          child: state.isLoading
              ? _buildProgressIndicator()
              : _buildPostsList(state)),
    );
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildPostsList(PublicationsState state) {
    return state.postLen == 0
        ? EmptyStateWidget(
            message: 'No publications found! please try again',
            iconData: Icons.mood_bad,
            onRetry: () => onRefresh(state),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: state.postLen,
            separatorBuilder: (context, index) => const SizedBox(
              height: 4,
            ),
            itemBuilder: (ctx, index) => Container(
              margin: const EdgeInsets.all(0),
              child: BlocProvider(
                  create: (context) => serviceLocator<PostCardBloc>()
                    ..add(OnShowPostEvent(state.postList[index],
                        state.postList[index].postAuthorUid)),
                  child: PostCard(
                    onShowCommentsByPost: (String postId) =>
                        widget.onShowCommentsByPost(postId),
                    onPostDeleted: () => onRefresh(state),
                    onShowUserProfile: (String userUid) =>
                        widget.onShowUserProfile(userUid), onEditPost: (String postId) {  },
                  )),
            ),
          );
  }
}
