import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void onLogout() {
    showAlertDialog(
        context: context,
        title: "You have logged out",
        description: "see you soon!",
        onAcceptPressed: () =>
            {context.read<AppBloc>().add(const OnVerifySession())});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state.isLogout) {
        onLogout();
      }
    }, builder: (context, state) {
      return state.isLoading
          ? _buildProgressIndicator()
          : _buildScreenContent(context, state);
    });
  }

  Widget _buildScreenContent(BuildContext context, ProfileState state) {
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
                  title: "Sign off?",
                  description: "Are you sure to sign out?",
                  onAcceptPressed: () => {
                        context.read<ProfileBloc>().add(const OnSignOutEvent())
                      });
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
          onRefresh: () {
            return Future.delayed(
              const Duration(seconds: 1),
              () {
                //context.read<ProfileBloc>().add(const OnLoadProfileEvent());
              },
            );
          },
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
                          _buildProfileHeader(state),
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
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildProfileHeader(ProfileState state) {
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
                    _buildStatColumn(state.postLen, "posts"),
                    _buildStatColumn(state.followers, "followers"),
                    _buildStatColumn(state.following, "following"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    state.isAuthUser
                        ? _buildSignOutButton()
                        : state.isFollowing
                            ? _buildUnFollowButton(state)
                            : _buildFollowButton(state)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignOutButton() {
    return CommonButton(
      text: 'Edit Profile',
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: () async {},
      sizeType: CommonButtonSizeType.small,
    );
  }

  Widget _buildUnFollowButton(ProfileState state) {
    return CommonButton(
      text: 'Unfollow',
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: () async {
        context.read<ProfileBloc>().add(OnUnFollowUserEvent(state.userUid));
      },
      sizeType: CommonButtonSizeType.small,
    );
  }

  Widget _buildFollowButton(ProfileState state) {
    return CommonButton(
      text: 'Follow',
      backgroundColor: secondaryColor,
      textColor: primaryColor,
      borderColor: secondaryColor,
      onPressed: () async {
        context.read<ProfileBloc>().add(OnFollowUserEvent(state.userUid));
      },
      sizeType: CommonButtonSizeType.small,
    );
  }

  Widget _buildUserNameRow(ProfileState state) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        top: 15, left: 15
      ),
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
      padding: const EdgeInsets.only(
        top: 3, left: 15
      ),
      child: Text(state.bio,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: accentColor, fontWeight: FontWeight.w400)),
    );
  }

  Widget _buildTabController(ProfileState state) {
    final tabs = [
      "tab_publications.png",
      "tab_favorites.png",
      "tab_collections.png"
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
              padding: const EdgeInsets.only(bottom: 8, left: 10, right: 10),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: accentColor,
              indicatorColor: primaryColor,
              labelColor: primaryColor,
              indicator: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: secondaryColorLight, blurRadius: 8),
                  ],
                  gradient: const LinearGradient(colors: [
                    secondaryColor,
                    secondaryColorMediumLight,
                    secondaryColorLight,
                    secondaryColorExtraLight
                  ]),
                  borderRadius: BorderRadius.circular(50)),
              tabs: tabs
                  .map((tab) => Tab(
                        height: 50,
                        icon: ImageIcon(
                          AssetImage("assets/$tab"),
                          size: 30,
                        ),
                      ))
                  .toList()),
          Container(
            height: MediaQuery.of(context).size.height,
            color: primaryColor,
            child: TabBarView(children: [
              _buildPostsGrid(state),
              const Text("Favorites"),
              const Text("Collections"),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsGrid(ProfileState state) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 2),
      itemCount: state.postList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return state.isPostGridLoading
            ? _buildProgressIndicator()
            : Container(
                color: primaryColor,
                padding: const EdgeInsets.all(1),
                child: SizedBox(
                  child: Image(
                    image: NetworkImage(state.postList[index].postUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
      },
    );
  }

  Column _buildStatColumn(int num, String label) {
    return Column(
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
    );
  }
}
