import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/domain/models/room.dart';
import 'package:pic_connect/features/chat/rooms/rooms_bloc.dart';
import 'package:pic_connect/features/core/helpers.dart';
import 'package:pic_connect/features/core/widgets/common_button.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pic_connect/utils/utils.dart';

class RoomsScreen extends StatefulWidget {
  final Function() onCreateNewRoom;
  final Function(RoomBO room) onOpenRoom;

  const RoomsScreen(
      {super.key, required this.onCreateNewRoom, required this.onOpenRoom});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late AppLocalizations _l10n;

  void _onRefresh(RoomsState state) {
    context.read<RoomsBloc>().add(OnLoadUserRoomsEvent(state.authUserUuid));
  }

  void _onDeleteRoom(String roomId) {
    showAlertDialog(
        context: context,
        title: _l10n.deleteRoomDialogTitle,
        description: _l10n.deleteRoomDialogDescription,
        onAcceptPressed: () => context.read<RoomsBloc>().add(OnDeleteRoomEvent(roomId)));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoomsBloc, RoomsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.isLoading
              ? _buildProgressIndicator()
              : _buildScreenContent(state);
        });
  }

  Widget _buildProgressIndicator() {
    return const CommonScreenProgressIndicator();
  }

  Widget _buildScreenContent(RoomsState state) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: accentColor, //change your color here
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: widget.onCreateNewRoom,
          ),
        ],
        backgroundColor: appBarBackgroundColor,
        title: Text(_l10n.roomsMainTitleText,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: accentColor)),
      ),
      body: _buildRoomsListView(state),
    );
  }

  Widget _buildRoomsListView(RoomsState state) {
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
          child: state.rooms.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.rooms.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (context, index) {
                    final room = state.rooms[index];
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 4),
                        color: primaryColor,
                        child: InkWell(
                          onTap: () => widget.onOpenRoom(room),
                          child: _buildRoomItem(room),
                        ));
                  },
                )
              : EmptyStateWidget(
                  message: _l10n.noRoomsFoundText,
                  iconData: Icons.mood_bad,
                  onRetry: () => _onRefresh(state),
                ),
        ));
  }

  Widget _buildRoomItem(RoomBO room) {
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: buildCircleAvatar(imageUrl: room.imageUrl ?? '', radius: 22),
      ),
      title: Text(
        room.name ?? '',
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: accentColor, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(room.subtitle ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: accentColor)),
      trailing: CommonButton(
        text: _l10n.deleteRoomButtonText,
        textColor: primaryColor,
        borderColor: primaryColor,
        styleType: CommonButtonStyleType.danger,
        onPressed: () => _onDeleteRoom(room.uid),
        sizeType: CommonButtonSizeType.tiny,
      ),
    );
  }
}
