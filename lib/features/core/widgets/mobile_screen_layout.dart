import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pic_connect/features/core/widgets/fab_bottom_app_bar.dart';
import 'package:pic_connect/features/core/widgets/fab_with_icons.dart';
import 'package:pic_connect/features/core/widgets/layout.dart';
import 'package:pic_connect/routes/route_utils.dart';
import 'package:pic_connect/utils/colors.dart';

class MobileScreenLayout extends StatelessWidget {

  final StatefulNavigationShell navigationShell;

  const MobileScreenLayout({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('MobileScreenLayout'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: '',
        color: accentColor,
        selectedColor: secondaryColor,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: (int tappedIndex) {
          navigationShell.goBranch(tappedIndex);
        },
        backgroundColor: bottomBarBackgroundColor,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
          FABBottomAppBarItem(iconData: Icons.favorite, text: 'Favorites'),
          FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(context),
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.camera, Icons.file_open ];
    return AnchoredOverlay(
      showOverlay: false,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: (int tappedIndex) {
              final imageSource = icons[tappedIndex] == Icons.camera ? ImageSource.camera : ImageSource.gallery;
              context.go(AppRoutesEnum.add.screenPath, extra: imageSource);
            },
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Add Post',
        elevation: 2.0,
        backgroundColor: secondaryColor,
        foregroundColor: accentColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}