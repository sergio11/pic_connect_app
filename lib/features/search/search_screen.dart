import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/features/core/widgets/user_list_tile.dart';
import 'package:pic_connect/features/core/widgets/video_thumbnail_widget.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  final Function(String userUid) onShowUserProfile;

  const SearchScreen({Key? key, required this.onShowUserProfile})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  late AppLocalizations _l10n;

  void _onFollowUser(String userUid) {
    context.read<SearchBloc>().add(OnFollowUserEvent(userUid));
  }

  void _onUnFollowUser(String userUid) {
    context.read<SearchBloc>().add(OnUnFollowUserEvent(userUid));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (context.mounted) {
            if (state.errorMessage != null) {
              showErrorSnackBar(context: context, message: state.errorMessage!);
            }
          }
        },
        builder: (context, state) {
          return state.isLoading
              ? _buildProgressIndicator()
              : _buildScreenContent(state);
        });
  }

  Widget _buildScreenContent(SearchState state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          title: Form(
            child: _buildTextSearchView(),
          ),
        ),
        body: state.isShowUsers
            ? _buildUsersGridView(state)
            : _buildPostsGridView(state));
  }

  Widget _buildTextSearchView() {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
          labelText: _l10n.searchMainLabelText,
          labelStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: accentColor),
          prefixIcon: const Icon(
            Icons.search,
            color: accentColor,
          ),
          prefixIconColor: accentColor,
          filled: true,
          fillColor: whiteColor,
          suffixIcon: IconButton(
            onPressed: () {
              searchController.clear();
              context.read<SearchBloc>().add(const OnSearchUsersEvent(""));
            },
            icon: const Icon(Icons.clear, color: accentColor),
          )),
      onFieldSubmitted: (String term) {
        context.read<SearchBloc>().add(OnSearchUsersEvent(term));
      },
    );
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildUsersGridView(SearchState state) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.users.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            color: primaryColor,
            child: InkWell(
              onTap: () => widget.onShowUserProfile(state.users[index].uid),
              child: UserListTile(
                  userBO: state.users[index],
                  onFollowPressed: () => _onFollowUser(state.users[index].uid),
                  onUnFollowPressed: () =>
                      _onUnFollowUser(state.users[index].uid),
                  isFollowedByAuthUser:
                      state.users[index].followers.contains(state.authUserUuid),
                  isAuthUser: state.users[index].uid == state.authUserUuid,
                  isDisabled: !state.allowUserInput),
            ));
      },
    );
  }

  Widget _buildPostsGridView(SearchState state) {
    return Container(
      color: primaryColor,
      child: MasonryGridView.count(
        crossAxisCount: 3,
        itemCount: state.posts.length,
        itemBuilder: (context, index) => GestureDetector(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              state.posts[index].postType == PostTypeEnum.picture
                  ? buildNetworkImage(state.posts[index].postUrl)
                  : VideoThumbnailWidget(
                      videoUrl: state.posts[index].postUrl,
                    ),
              if (state.posts[index].tags.isNotEmpty)
                TagsRow(tags: [state.posts[index].tags.first])
            ],
          ),
          onTap: () {
            final post = state.posts[index];
            if (post.postType == PostTypeEnum.picture) {
              showImage(context, post.postUrl);
            } else {
              showReelPreviewDialog(context, post);
            }
          },
        ),
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
    );
  }
}
