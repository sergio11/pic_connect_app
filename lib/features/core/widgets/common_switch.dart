import 'package:flutter/material.dart';
import 'package:pic_connect/utils/colors.dart';

class CommonSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String label;
  final String description;

  const CommonSwitch({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    required this.label,
    required this.description,
  }) : super(key: key);

  @override
  CommonSwitchState createState() => CommonSwitchState();
}

class CommonSwitchState extends State<CommonSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(widget.label,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: accentColor)),
            Transform.scale(
                scale: 1.5,
                child: Switch(
                  value: _value,
                  activeColor: secondaryColor,
                  activeTrackColor: secondaryColor,
                  inactiveTrackColor: accentColor,
                  inactiveThumbColor: accentColor,
                  onChanged: (newValue) {
                    setState(() {
                      _value = newValue;
                    });
                    widget.onChanged(newValue);
                  },
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(widget.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: accentColor)),
        ),
      ],
    );
  }
}
