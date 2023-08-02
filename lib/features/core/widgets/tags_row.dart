
import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class TagsRow extends StatelessWidget {

  final List<String> tags;
  final void Function(String)? onTagDeleted;
  final ScrollController scrollController;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;


  const TagsRow({
    super.key,
    required this.tags,
    this.onTagDeleted,
    required this.scrollController,
    this.margin = const EdgeInsets.symmetric(horizontal: 5.0),
    this.padding = const EdgeInsets.symmetric(
        horizontal: 10.0, vertical: 5.0)
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
          children: tags.map((String tag) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: secondaryColor,
              ),
              margin: margin,
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: onTagDeleted != null ? buildRemovableTag(context, tag)
                    : buildReadOnlyTag(context, tag),
              ),
            );
          }).toList()),
    );
  }

  List<Widget> buildReadOnlyTag(BuildContext context, String tag) {
    return [
      InkWell(
        child: Text(
          '#$tag',
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: primaryColor),
        ),
      ),
    ];
  }

  List<Widget> buildRemovableTag(BuildContext context, String tag) {
    return [
      InkWell(
        child: Text(
          '#$tag',
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: primaryColor),
        ),
      ),
      const SizedBox(width: 4.0),
      InkWell(
        child: const Icon(
          Icons.cancel,
          size: 14.0,
          color: primaryColor,
        ),
        onTap: () {
          onTagDeleted?.call(tag);
        },
      ),
    ];
  }

}