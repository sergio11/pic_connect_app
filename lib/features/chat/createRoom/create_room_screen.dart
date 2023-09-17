import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pic_connect/features/chat/createRoom/create_room_bloc.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';

class CreateRoomScreen extends StatefulWidget {
  final Function(String roomId) onRoomCreated;

  const CreateRoomScreen({super.key, required this.onRoomCreated});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  late AppLocalizations _l10n;

  void _onRefresh(CreateRoomState state) {
    context.read<CreateRoomBloc>().add(OnLoadUsersEvent(state.authUserUuid));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateRoomBloc, CreateRoomState>(listener: (context, state) {
      if (context.mounted) {
        if (state.errorMessage != null) {
          showErrorSnackBar(context: context, message: state.errorMessage!);
        }
      }
      if(state.roomCreatedId.isNotEmpty) {
        widget.onRoomCreated(state.roomCreatedId);
      }
    }, builder: (context, state) {
      return state.isLoading
          ? _buildProgressIndicator()
          : _buildScreenContent(state);
    });
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildScreenContent(CreateRoomState state) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: accentColor, //change your color here
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        backgroundColor: appBarBackgroundColor,
        title: Text("Users",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: accentColor)),
      ),
      body: _buildUsersListView(state),
    );
  }

  Widget _buildUsersListView(CreateRoomState state) {
    return RefreshIndicator(
        backgroundColor: secondaryColor,
        color: accentColor,
        onRefresh: () => Future.delayed(
              const Duration(seconds: 1),
              () => _onRefresh(state),
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
                    final user = state.users[index];
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 4),
                        color: primaryColor,
                        child: InkWell(
                          onTap: () => _onCreateRoom(user.uid),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                buildCircleAvatar(imageUrl: user.photoUrl),
                                Text(
                                  user.username,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: accentColor,
                                          fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                )
              : EmptyStateWidget(
                  message: "No users found",
                  iconData: Icons.mood_bad,
                  onRetry: () => _onRefresh(state),
                ),
        ));
  }

  void _onCreateRoom(String userUuid) async {
    context.read<CreateRoomBloc>().add(OnCreateRoomEvent(userUuid));
  }
}
