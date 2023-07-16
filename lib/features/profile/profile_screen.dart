import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/app/app_bloc.dart';
import 'package:pic_connect/features/core/widgets/follow_button.dart';
import 'package:pic_connect/features/profile/profile_bloc.dart';
import 'package:pic_connect/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if(state.isLogout) {
            context.read<AppBloc>()
                .add(const OnVerifySession());
          }
        },
        builder: (context, state) {
          return state.isLoading ? _buildProgressIndicator()
              : _buildScreenContent(context, state);
        });
  }

  Widget _buildScreenContent(BuildContext context, ProfileState state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Text(state.username != null ? state.username! : "Empty"),
          centerTitle: false,
        ),
        body: ListView(children: [
          Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                _buildProfileHeader(state),
                _buildUserNameRow(state),
                _buildUserBioRow(state),
                const Divider(),
                _buildPostsGrid(state)
              ])
          )
        ]));
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildProfileHeader(ProfileState state) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(state.photoUrl != null ? state.photoUrl! : 'https://i.stack.imgur.com/l60Hf.png'),
          radius: 40,
        ),
        Expanded(
          flex: 1,
          child: Column(
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
      ],
    );
  }

  Widget _buildSignOutButton() {
    return FollowButton(
      text: 'Sign Out',
      backgroundColor: mobileBackgroundColor,
      textColor: primaryColor,
      borderColor: Colors.grey,
      onPressed: () async {
        context.read<ProfileBloc>().add(const OnSignOutEvent());
      },
    );
  }

  Widget _buildUnFollowButton(ProfileState state) {
    return FollowButton(
      text: 'Unfollow',
      backgroundColor: Colors.white,
      textColor: Colors.black,
      borderColor: Colors.grey,
      onPressed: () async {
        context.read<ProfileBloc>().add(OnUnFollowUserEvent(state.userUid!));
      },
    );
  }

  Widget _buildFollowButton(ProfileState state) {
    return FollowButton(
      text: 'Follow',
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      borderColor: Colors.blue,
      onPressed: () async {
        context.read<ProfileBloc>().add(OnFollowUserEvent(state.userUid!));
      },
    );
  }

  Widget _buildUserNameRow(ProfileState state) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Text(
        state.username != null ? state.username! : "Empty",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildUserBioRow(ProfileState state) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(
        top: 1,
      ),
      child: Text(
        state.bio != null ? state.bio! : "Empty",
      ),
    );
  }

  Widget _buildPostsGrid(ProfileState state) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: state.postList.length,
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 1.5,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return state.isPostGridLoading ?
            _buildProgressIndicator() : SizedBox(
          child: Image(
            image: NetworkImage(state.postList[index].postUrl),
            fit: BoxFit.cover,
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
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}