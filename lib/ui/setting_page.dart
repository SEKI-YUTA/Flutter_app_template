import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Container(
        child: Column(
          children: [
            SettingItem(
              settingText: "Sample Item1",
            ),
            SettingItem(
              settingText: "Sample Item2",
            ),
            SettingItem(
              settingText: "Sample Item3",
            ),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatefulWidget {
  const SettingItem({Key? key, required this.settingText}) : super(key: key);
  final String settingText;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  late bool _active;
  @override
  void initState() {
    super.initState();
    _active = false;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        value: _active,
        title: Text('${widget.settingText}'),
        onChanged: (bool newVal) {
          // change setting action
          setState(() {
            _active = !_active;
          });
        });
  }
}
