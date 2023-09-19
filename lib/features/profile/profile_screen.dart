import 'package:autoscale_tabbarview/autoscale_tabbarview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/features/core/widgets/lifecycle_watcher_state.dart';
import 'package:pic_connect/features/core/widgets/moment_story_track.dart';
import 'package:pic_connect/features/core/widgets/video_thumbnail_widget.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/utils/calculate_age_from_birthdate.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatefulWidget {
  final Function(String userUid) onGoToPictures;
  final Function(String userUid) onGoToReels;
  final Function(String userUid) onGoToBookmarks;
  final Function(String userUid) onGoToFollowersScreen;
  final Function(String userUid) onGoToFollowingScreen;
  final Function(String userUid) onGoToEditProfileScreen;

  const ProfileScreen(
      {Key? key,
      required this.onGoToPictures,
      required this.onGoToReels,
      required this.onGoToBookmarks,
      required this.onGoToFollowersScreen,
      required this.onGoToFollowingScreen,
      required this.onGoToEditProfileScreen})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends LifecycleWatcherState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  ProfileTab _currentProfileTabSelected = ProfileTab.pictures;
  late AppLocalizations _l10n;

  final bodyGlobalKey = GlobalKey();
  late TabController _tabController;
  late ScrollController _scrollController;

  void onLogout() {
    showAlertDialog(
        context: context,
        title: _l10n.sessionClosedDialogTitle,
        description: _l10n.sessionClosedDialogDescription,
        onAcceptPressed: () =>
            context.read<AppBloc>().add(const OnVerifySession()));
  }

  void _onShareProfile(ProfileState state) {
    Share.share(_l10n.shareProfileText.replaceAll("%s", state.username));
  }

  void _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void onResumed() {
    context.read<ProfileBloc>().add(const OnRefreshEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (context.mounted) {
        if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        } else if (state.isLogout) {
          onLogout();
        }
      }
    }, builder: (context, state) {
      return state.isLoading
          ? _buildProgressIndicator()
          : _buildScreenContent(state);
    });
  }

  Widget _buildScreenContent(ProfileState state) {
    return Scaffold(
        appBar: _buildAppBar(state),
        body: RefreshIndicator(
          backgroundColor: secondaryColor,
          color: accentColor,
          onRefresh: () => Future.delayed(
            const Duration(seconds: 1),
            () => context.read<ProfileBloc>().add(const OnRefreshEvent()),
          ),
          child: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(child: _buildProfileDetail(state)),
                SliverToBoxAdapter(child: _buildTabBar(state))
              ];
            },
            body: Container(
                color: primaryColor,
                child: TabBarView(controller: _tabController, children: [
                  _buildPostsGrid(state.picturesList,
                      state.isPictureGridLoading, "No pictures found"),
                  _buildPostsGrid(state.reelsList, state.isReelsGridLoading,
                      "No Reels found"),
                  _buildPostsGrid(state.bookmarkPostList,
                      state.isBookmarkPostGridLoading, "No Bookmarks saved")
                ])),
          ),
        ));
  }

  PreferredSizeWidget _buildAppBar(ProfileState state) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: accentColor, //change your color here
      ),
      actions: [
        IconButton(
          icon: const ImageIcon(
            AssetImage("assets/sign_out.png"),
            color: accentColor,
          ),
          onPressed: () {
            showConfirmDialog(
                context: context,
                title: _l10n.signOffDialogTitle,
                description: _l10n.signOffDialogDescription,
                onAcceptPressed: () =>
                    context.read<ProfileBloc>().add(const OnSignOutEvent()));
          },
        ),
      ],
      backgroundColor: appBarBackgroundColor,
      title: Text(state.username,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: accentColor)),
      centerTitle: false,
    );
  }

  Widget _buildTabBar(ProfileState state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: TabBar(
          controller: _tabController,
          padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: accentColor,
          indicatorColor: accentColor,
          labelColor: primaryColor,
          indicator: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: blackColor, offset: Offset(0, 0), blurRadius: 8.0),
              ],
              border: Border.all(color: primaryColor, width: 3),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [secondaryColor, secondaryColorExtraLight],
              ),
              borderRadius: BorderRadius.circular(50)),
          onTap: (tabIdx) => {
                setState(() {
                  _currentProfileTabSelected = state.profileTabs[tabIdx];
                })
              },
          tabs: state.profileTabs
              .map((tab) => Tab(
                    height: 45,
                    icon: _buildTabIcon(tab),
                  ))
              .toList()),
    );
  }

  Widget _buildProfileDetail(ProfileState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          boxShadow: const [
            BoxShadow(color: blackColor, blurRadius: 8),
          ],
        ),
        child: Column(
          children: [
            _buildProfileHeader(state),
            _buildUserNameRow(state),
            _buildUserAgeAndCountry(state),
            _buildUserBioRow(state),
            _buildProfileActions(state),
            _buildMomentsStoryTrack(state),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildProfileHeader(ProfileState state) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: buildCircleAvatar(imageUrl: state.photoUrl),
            onTap: () => showImage(context, state.photoUrl),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn(state.postLen, _l10n.profilePostStats,
                        () => widget.onGoToPictures(state.userUid)),
                    _buildStatColumn(
                        state.followers,
                        _l10n.profileFollowerStats,
                        () => widget.onGoToFollowersScreen(state.userUid)),
                    _buildStatColumn(
                        state.following,
                        _l10n.profileFollowingStats,
                        () => widget.onGoToFollowingScreen(state.userUid)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileActions(ProfileState state) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          state.isAuthUser
              ? _buildEditProfileButton(state)
              : state.isFollowing
                  ? _buildUnFollowButton(state)
                  : _buildFollowButton(state),
          _buildShareProfileButton(state)
        ],
      ),
    );
  }

  Widget _buildShareProfileButton(ProfileState state) {
    return CommonButton(
      text: _l10n.shareProfileButtonText,
      backgroundColor: accentColor,
      textColor: primaryColor,
      borderColor: accentColor,
      reverseStyle: true,
      onPressed: () => _onShareProfile(state),
      sizeType: CommonButtonSizeType.tiny,
    );
  }

  Widget _buildEditProfileButton(ProfileState state) {
    return CommonButton(
      text: _l10n.editProfileButtonText,
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: () => widget.onGoToEditProfileScreen(state.userUid),
      sizeType: CommonButtonSizeType.tiny,
    );
  }

  Widget _buildUnFollowButton(ProfileState state) {
    return CommonButton(
      text: _l10n.unFollowButtonText,
      backgroundColor: accentColor,
      textColor: primaryColor,
      borderColor: accentColor,
      onPressed: () =>
          context.read<ProfileBloc>().add(OnUnFollowUserEvent(state.userUid)),
      sizeType: CommonButtonSizeType.tiny,
    );
  }

  Widget _buildFollowButton(ProfileState state) {
    return CommonButton(
      text: _l10n.followButtonText,
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: () =>
          context.read<ProfileBloc>().add(OnFollowUserEvent(state.userUid)),
      sizeType: CommonButtonSizeType.tiny,
    );
  }

  Widget _buildUserNameRow(ProfileState state) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 15, left: 15),
      child: Text(
        state.username,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: accentColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildUserBioRow(ProfileState state) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 3, left: 15),
      child: Text(state.bio,
          maxLines: 5,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: accentColor, fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildUserAgeAndCountry(ProfileState state) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (state.birthDate.isNotEmpty)
            const Icon(Icons.cake, color: accentColor),
          const SizedBox(width: 6),
          Text(
            "${state.birthDate.calculateAgeFromBirthDate()} años",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: accentColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 6),
          if (state.country.isNotEmpty)
            Text(
              state.country,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: accentColor, fontWeight: FontWeight.w600),
            )
        ],
      ),
    );
  }

  Widget _buildMomentsStoryTrack(ProfileState state) {
    return state.momentsByDate.isNotEmpty
        ? MomentStoryTrack(
            momentStoryDataList: state.momentsByDate,
            backgroundColor: Colors.transparent,
            margin: const EdgeInsets.only(top: 10, bottom: 5),
          )
        : Container();
  }

  Widget _buildTabIcon(ProfileTab tab) {
    final IconData iconData;
    switch (tab) {
      case ProfileTab.pictures:
        iconData = tab == _currentProfileTabSelected
            ? Icons.photo_camera_outlined
            : Icons.photo_camera;
      case ProfileTab.reels:
        iconData = tab == _currentProfileTabSelected
            ? Icons.live_tv
            : Icons.live_tv_outlined;
      case ProfileTab.bookmark:
        iconData = tab == _currentProfileTabSelected
            ? Icons.bookmark_border
            : Icons.bookmark;
    }
    return Icon(iconData, size: tab == _currentProfileTabSelected ? 35 : 30);
  }

  Widget _buildStatColumn(int num, String label, Function()? onTag) {
    return GestureDetector(
      onTap: onTag,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            num.toString(),
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: accentColor, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: accentColor, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid(
      List<PostBO> data, bool isLoading, String noDataMessage) {
    return data.isNotEmpty
        ? GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 2),
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return _buildPostItem(data[index]);
            },
          )
        : isLoading
            ? _buildProgressIndicator()
            : Expanded(child: EmptyStateWidget(
        message: noDataMessage, iconData: Icons.mood_bad));
  }

  Widget _buildPostItem(PostBO post) {
    return GestureDetector(
      child: Container(
        color: primaryColor,
        padding: const EdgeInsets.all(1),
        child: SizedBox(
          child: post.postType == PostTypeEnum.picture
              ? buildNetworkImage(post.postUrl)
              : VideoThumbnailWidget(
                  videoUrl: post.postUrl,
                ),
        ),
      ),
      onLongPress: () => {
        if (post.postType == PostTypeEnum.picture)
          {showImage(context, post.postUrl)}
        else
          {showReelPreviewDialog(context, post)}
      },
      onDoubleTap: () => {
        if (post.postType == PostTypeEnum.picture)
          {showImage(context, post.postUrl)}
        else
          {showReelPreviewDialog(context, post)}
      },
      onTap: () => widget.onGoToPictures(post.postAuthorUid),
    );
  }
}
