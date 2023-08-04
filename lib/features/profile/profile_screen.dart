import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/lifecycle_watcher_state.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  final Function(String userUid) onGoToPublications;
  final Function(String userUid) onGoToFollowersScreen;
  final Function(String userUid) onGoToFollowingScreen;
  final Function(String userUid) onGoToEditProfileScreen;

  const ProfileScreen(
      {Key? key,
      required this.onGoToPublications,
      required this.onGoToFollowersScreen,
      required this.onGoToFollowingScreen,
      required this.onGoToEditProfileScreen})
      : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends LifecycleWatcherState<ProfileScreen> {
  ProfileTab _currentProfileTabSelected = ProfileTab.pictures;

  void onLogout(AppLocalizations l10n) {
    showAlertDialog(
        context: context,
        title: l10n.sessionClosedDialogTitle,
        description: l10n.sessionClosedDialogDescription,
        onAcceptPressed: () =>
            context.read<AppBloc>().add(const OnVerifySession()));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state.isLogout) {
        onLogout(l10n);
      }
    }, builder: (context, state) {
      return state.isLoading
          ? _buildProgressIndicator()
          : _buildScreenContent(state, l10n);
    });
  }

  @override
  void onResumed() {
    context.read<ProfileBloc>().add(const OnRefreshEvent());
  }

  Widget _buildScreenContent(ProfileState state, AppLocalizations l10n) {
    return Scaffold(
      appBar: AppBar(
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
                  title: l10n.signOffDialogTitle,
                  description: l10n.signOffDialogDescription,
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
      ),
      body: RefreshIndicator(
          backgroundColor: secondaryColor,
          color: accentColor,
          onRefresh: () => Future.delayed(
                const Duration(seconds: 1),
                () => context.read<ProfileBloc>().add(const OnRefreshEvent()),
              ),
          child: ListView(children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
                          _buildProfileHeader(state, l10n),
                          _buildUserNameRow(state),
                          _buildUserBioRow(state)
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                  ),
                  _buildTabController(state)
                ])
          ])),
    );
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildProfileHeader(ProfileState state, AppLocalizations l10n) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: CircleAvatar(
            backgroundColor: accentColor,
            backgroundImage: NetworkImage(state.photoUrl),
            radius: 40,
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn(state.postLen, l10n.profilePostStats,
                        () => widget.onGoToPublications(state.userUid)),
                    _buildStatColumn(state.followers, l10n.profileFollowerStats,
                        () => widget.onGoToFollowersScreen(state.userUid)),
                    _buildStatColumn(
                        state.following,
                        l10n.profileFollowingStats,
                        () => widget.onGoToFollowingScreen(state.userUid)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    state.isAuthUser
                        ? _buildEditProfileButton(state, l10n)
                        : state.isFollowing
                            ? _buildUnFollowButton(state, l10n)
                            : _buildFollowButton(state, l10n)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditProfileButton(ProfileState state, AppLocalizations l10n) {
    return CommonButton(
      text: l10n.editProfileButtonText,
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: () => widget.onGoToEditProfileScreen(state.userUid),
      sizeType: CommonButtonSizeType.small,
    );
  }

  Widget _buildUnFollowButton(ProfileState state, AppLocalizations l10n) {
    return CommonButton(
      text: l10n.unFollowButtonText,
      backgroundColor: accentColor,
      textColor: primaryColor,
      borderColor: accentColor,
      onPressed: () => context.read<ProfileBloc>().add(OnUnFollowUserEvent(state.userUid)),
      sizeType: CommonButtonSizeType.small,
    );
  }

  Widget _buildFollowButton(ProfileState state, AppLocalizations l10n) {
    return CommonButton(
      text: l10n.followButtonText,
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: () => context.read<ProfileBloc>().add(OnFollowUserEvent(state.userUid)),
      sizeType: CommonButtonSizeType.small,
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
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: accentColor, fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildTabController(ProfileState state) {
    return DefaultTabController(
      length: state.profileTabs.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
              padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: accentColor,
              indicatorColor: accentColor,
              labelColor: primaryColor,
              indicator: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: blackColor,
                        offset: Offset(0, 0),
                        blurRadius: 8.0),
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
          Container(
            height: MediaQuery.of(context).size.height,
            color: primaryColor,
            child: TabBarView(children: [
              _buildPostsGrid(state.postList, state.isPostGridLoading),
              _buildPostsGrid(
                  state.favoritePostList, state.isFavoritePostGridLoading),
              _buildPostsGrid(
                  state.bookmarkPostList, state.isBookmarkPostGridLoading)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid(List<PostBO> data, bool isLoading) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 2),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return isLoading
            ? _buildProgressIndicator()
            : _buildPostItem(data[index]);
      },
    );
  }

  Widget _buildPostItem(PostBO post) {
    return GestureDetector(
      child: Container(
        color: primaryColor,
        padding: const EdgeInsets.all(1),
        child: SizedBox(
          child: buildNetworkImage(post.postUrl),
        ),
      ),
      onLongPress: () => showImage(context, post.postUrl),
      onDoubleTap: () => showImage(context, post.postUrl),
      onTap: () => widget.onGoToPublications(post.postAuthorUid),
    );
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

  Widget _buildTabIcon(ProfileTab tab) {
    final IconData iconData;
    switch (tab) {
      case ProfileTab.pictures:
        iconData = tab == _currentProfileTabSelected
            ? Icons.photo_camera_outlined
            : Icons.photo_camera;
      case ProfileTab.favorites:
        iconData = tab == _currentProfileTabSelected
            ? Icons.favorite_border
            : Icons.favorite;
      case ProfileTab.bookmark:
        iconData = tab == _currentProfileTabSelected
            ? Icons.bookmark_border
            : Icons.bookmark;
    }
    return Icon(iconData, size: tab == _currentProfileTabSelected ? 35 : 30);
  }
}
