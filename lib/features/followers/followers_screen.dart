import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/features/core/widgets/user_list_tile.dart';
import 'package:pic_connect/features/followers/followers_bloc.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FollowersScreen extends StatefulWidget {
  final Function(String userUid) onShowUserProfile;

  const FollowersScreen({Key? key, required this.onShowUserProfile})
      : super(key: key);

  @override
  State<FollowersScreen> createState() => _FollowersScreen();
}

class _FollowersScreen extends State<FollowersScreen> {
  void _onFollowUser(String userUid) {
    context.read<FollowersBloc>().add(OnFollowUserEvent(userUid));
  }

  void _onUnFollowUser(String userUid) {
    context.read<FollowersBloc>().add(OnUnFollowUserEvent(userUid));
  }

  void _onRefresh() async {
    context.read<FollowersBloc>().add(const OnRefreshDataEvent());
  }

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
    final l10n = AppLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: accentColor, //change your color here
          ),
          backgroundColor: appBarBackgroundColor,
          title: Text(
              state.contentType == ContentTypeEnum.followers
                  ? l10n.followersScreenTitle
                  : l10n.followingScreenTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: accentColor)),
          centerTitle: false,
        ),
        body: _buildUsersListView(state));
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildUsersListView(FollowersState state) {
    return RefreshIndicator(
        backgroundColor: secondaryColor,
        color: accentColor,
        onRefresh: () => Future.delayed(
              const Duration(seconds: 1),
              () => _onRefresh(),
            ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: state.users.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.users.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 4),
                        color: primaryColor,
                        child: InkWell(
                          onTap: () =>
                              widget.onShowUserProfile(state.users[index].uid),
                          child: UserListTile(
                            userBO: state.users[index],
                            onFollowPressed: () =>
                                _onFollowUser(state.users[index].uid),
                            onUnFollowPressed: () =>
                                _onUnFollowUser(state.users[index].uid),
                            isFollowedByAuthUser: state.users[index].followers
                                .contains(state.authUserUid),
                            isAuthUser:
                                state.users[index].uid == state.authUserUid,
                            isDisabled: !state.allowUserInput,
                          ),
                        ));
                  },
                )
              : EmptyStateWidget(
                  message: "You don't have followers",
                  iconData: Icons.mood_bad,
                  onRetry: () => _onRefresh(),
                ),
        ));
  }
}
