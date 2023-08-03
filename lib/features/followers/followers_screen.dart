import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/tags_row.dart';
import 'package:pic_connect/features/followers/followers_bloc.dart';
import 'package:pic_connect/features/search/search_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pic_connect/utils/utils.dart';

class FollowersScreen extends StatefulWidget {
  final Function(String userUid) onShowUserProfile;

  const FollowersScreen({Key? key, required this.onShowUserProfile})
      : super(key: key);

  @override
  State<FollowersScreen> createState() => _FollowersScreen();
}

class _FollowersScreen extends State<FollowersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FollowersBloc, FollowersState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.isLoading
              ? _buildProgressIndicator()
              : _buildScreenContent(state);
        });
  }

  Widget _buildScreenContent(FollowersState state) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: accentColor, //change your color here
            ),
            backgroundColor: appBarBackgroundColor),
        body: _buildUsersListView(state));
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildUsersListView(FollowersState state) {
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
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    state.users[index].photoUrl,
                  ),
                  radius: 16,
                ),
                title: Text(
                  state.users[index].username,
                ),
              ),
            ));
      },
    );
  }
}
