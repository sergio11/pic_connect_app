import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/chat/rooms/rooms_bloc.dart';
import 'package:pic_connect/features/core/widgets/common_screen_progress_indicator.dart';
import 'package:pic_connect/features/core/widgets/empty_state_widget.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  late AppLocalizations _l10n;

  void _onRefresh(RoomsState state) {
    context.read<RoomsBloc>().add(OnLoadUserRoomsEvent(state.authUserUuid));
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
            onPressed: () {},
          ),
        ],
        backgroundColor: appBarBackgroundColor,
        title: Text("Rooms",
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
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 4),
                        color: primaryColor,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                //_buildAvatar(room),
                                Text(
                                  'Room Text',
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
                  message: "You don't have any room created",
                  iconData: Icons.mood_bad,
                  onRetry: () => _onRefresh(state),
                ),
        ));
  }
}
