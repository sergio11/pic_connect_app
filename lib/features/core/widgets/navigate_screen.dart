import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/domain/models/post.dart';
import 'package:pic_connect/features/core/widgets/fab_bottom_app_bar.dart';
import 'package:pic_connect/features/core/widgets/fab_with_icons.dart';
import 'package:pic_connect/features/core/widgets/anchored_overlay.dart';
import 'package:pic_connect/routes/route_utils.dart';
import 'package:pic_connect/utils/colors.dart';

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
  bool isBottomBarVisible = true;
  bool showOverlay = true;

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
      if (visible) {
        hideNav(keepOverlay: false);
      } else {
        showNav();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification value) {
          if (value.direction == ScrollDirection.forward ||
              value.direction == ScrollDirection.idle) {
            showNav();
          } else {
            hideNav(keepOverlay: false);
          }
          return true;
        },
        child: widget.navigationShell,
      ),
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
              notchedShape: const CircularNotchedRectangle(),
              onTabSelected: (int tappedIndex) {
                widget.navigationShell.goBranch(tappedIndex);
              },
              backgroundColor: bottomBarBackgroundColor,
              items: [
                FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
                FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
                FABBottomAppBarItem(iconData: Icons.live_tv, text: 'Reels TV'),
                FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
              ],
            )
          ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
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
    super.dispose();
  }
}
