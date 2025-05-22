import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/theme_view_model.dart';

import '../widgets/nav_bar.dart';
import '../widgets/color_picker.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(context, 'Settings'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ThemeViewModel>(
          builder: (context, themeViewModel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pick a main color:'),
                const SizedBox(height: 16.0),
                ColorPicker(
                  selectedColor: themeViewModel.mainColor,
                  onColorSelected: (color) {
                    themeViewModel.mainColor = color;
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}