import 'package:flutter/material.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var timer = context.watch<TimerViewModel>().timerDto.timer;
    textEditingController.text = timer.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "설정",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: const Icon(Icons.home)),
      ),
      body: SettingsList(sections: [
        SettingsSection(
          title: const Text("타이머 설정"),
          tiles: [
            SettingsTile(
              title: TextField(
                onChanged: (value) {
                  context.read<TimerViewModel>().setTimer(int.parse(value));
                  FocusScope.of(context).unfocus();
                },
                controller: textEditingController,
                decoration: const InputDecoration(labelText: "타이머 시작값"),
              ),
              leading: const Icon(Icons.timer_outlined),
            ),
            SettingsTile(
              title: const TextField(
                decoration: InputDecoration(labelText: "타이머 휴식값"),
              ),
              leading: const Icon(Icons.timer_off_outlined),
            ),
          ],
        ),
        SettingsSection(
          title: const Text("테마 설정"),
          tiles: [
            SettingsTile(
              title: const Text("타이머"),
            ),
            SettingsTile(
              title: const Text("타이머"),
            ),
          ],
        )
      ]),
    );
  }
}
