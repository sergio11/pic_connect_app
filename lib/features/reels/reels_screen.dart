import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_connect/features/reels/reels_bloc.dart';
import 'package:pic_connect/features/reels/widgets/reels_viewer_widget.dart';

import '../../utils/mock_story_data.dart';

class ReelsViewerScreen extends StatefulWidget {
  const ReelsViewerScreen({Key? key}) : super(key: key);

  @override
  State<ReelsViewerScreen> createState() => _ReelsViewerScreenState();
}

class _ReelsViewerScreenState extends State<ReelsViewerScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReelsBloc, ReelsState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return ReelsViewer(reelsList: reelsList);
        });
  }
}
