import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/core/widgets/fab_bottom_app_bar.dart';
import 'package:pic_connect/features/core/widgets/fab_with_icons.dart';
import 'package:pic_connect/features/core/widgets/anchored_overlay.dart';
import 'package:pic_connect/provider/event_controller.dart';
import 'package:pic_connect/routes/route_utils.dart';
import 'package:pic_connect/utils/colors.dart';
import 'package:pic_connect/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'lifecycle_watcher_state.dart';

class NavigateScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const NavigateScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('NavigateScreen'));

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends LifecycleWatcherState<NavigateScreen> {
  late StreamSubscription<bool> keyboardSubscription;
  late StreamSubscription<AbstractEvent> eventControllerSubscription;
  late AppLocalizations _l10n;
  bool isBottomBarVisible = true;
  bool showOverlay = true;
  int selectedIndex = 0;
  bool freezeBottomBar = false;

  void onTapSelected(int indexTapped) {
    widget.navigationShell.goBranch(indexTapped);
    setState(() {
      selectedIndex = indexTapped;
    });
  }

  void hideNav({bool keepOverlay = true}) {
    setState(() {
      isBottomBarVisible = false;
      showOverlay = keepOverlay;
    });
  }

  void showNav() {
    setState(() {
      isBottomBarVisible = true;
    });
    if (!showOverlay) {
      Timer(const Duration(milliseconds: 400), () async {
        setState(() {
          showOverlay = true;
        });
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _l10n = AppLocalizations.of(context);
  }

  @override
  void onResumed() {
    showNav();
  }

  @override
  void onPaused() {
    hideNav();
  }

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (!freezeBottomBar) {
        if (visible) {
          hideNav(keepOverlay: false);
        } else {
          showNav();
        }
      }
    });
    eventControllerSubscription =
        context.read<EventController>().eventStream.listen((event) {
      if (event is ShowBottomBarEvent) {
        freezeBottomBar = false;
        showNav();
      } else if (event is HideBottomBarEvent) {
        freezeBottomBar = true;
        hideNav(keepOverlay: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: SafeArea(
          bottom: true,
          top: false,
          left: false,
          right: false,
          child: Scaffold(
            body: NotificationListener<UserScrollNotification>(
                onNotification: (UserScrollNotification value) {
                  if (!freezeBottomBar) {
                    if (value.direction == ScrollDirection.forward ||
                        value.direction == ScrollDirection.idle) {
                      showNav();
                    } else {
                      hideNav(keepOverlay: false);
                    }
                  }
                  return true;
                },
                child: widget.navigationShell),
            extendBody: true,
            bottomNavigationBar: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: isBottomBarVisible ? kBottomNavigationBarHeight : 0,
                child: Wrap(children: [
                  FABBottomAppBar(
                    centerItemText: '',
                    color: accentColor,
                    selectedColor: secondaryColor,
                    selectedIndex: selectedIndex,
                    notchedShape: const CircularNotchedRectangle(),
                    onTabSelected: onTapSelected,
                    backgroundColor: bottomBarBackgroundColor,
                    items: [
                      FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
                      FABBottomAppBarItem(
                          iconData: Icons.search, text: 'Search'),
                      FABBottomAppBarItem(
                          iconData: Icons.live_tv, text: 'Reels TV'),
                      FABBottomAppBarItem(
                          iconData: Icons.person, text: 'Profile'),
                    ],
                  )
                ])),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: _buildFab(context),
          )),
    );
  }

  Future<bool> _onWillPop() async {
    if (isBottomBarVisible) {
      if (widget.navigationShell.currentIndex ==
          BottomNavigationBarIndex.home) {
        showConfirmDialog(
            context: context,
            title: _l10n.exitAppDialogTitle,
            description: _l10n.exitAppDialogDescription,
            onAcceptPressed: () {
              SystemNavigator.pop();
            });
      } else {
        onTapSelected(BottomNavigationBarIndex.home);
      }
    } else {
      showNav();
    }
    return false;
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.emergency_recording, Icons.camera, Icons.file_open];
    return AnchoredOverlay(
        showOverlay: showOverlay,
        overlayBuilder: (context, offset) {
          return CenterAbout(
            position: Offset(offset.dx, offset.dy - icons.length * 35.0),
            child: FabWithIcons(
              icons: icons,
              onIconTapped: (int tappedIndex) {
                context.go(AppRoutesEnum.add.screenPath,
                    extra: AddPostScreenArgs(
                        imageSource: icons[tappedIndex] == Icons.file_open
                            ? ImageSource.gallery
                            : ImageSource.camera,
                        type: icons[tappedIndex] == Icons.emergency_recording
                            ? PostTypeEnum.reel
                            : PostTypeEnum.picture));
              },
            ),
          );
        },
        child: Opacity(
          opacity: 0.0,
          child: FloatingActionButton(
            onPressed: () {
              context.go(AppRoutesEnum.add.screenPath,
                  extra: ImageSource.camera);
            },
            elevation: 2.0,
            backgroundColor: secondaryColor,
            foregroundColor: accentColor,
            child: const Icon(Icons.add),
          ),
        ));
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    eventControllerSubscription.cancel();
    super.dispose();
  }
}

class BottomNavigationBarIndex {
  static const int home = 0;
  static const int search = 1;
  static const int reels = 2;
  static const int profile = 3;
}
