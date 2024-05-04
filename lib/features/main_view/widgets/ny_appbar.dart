import 'package:flutter/material.dart';
import 'package:task3/features/main_view/widgets/drawer_icon_button.dart';
import 'package:task3/features/main_view/widgets/search_icon_button.dart';

import 'more_options_icon.dart';

class NyAppBar {
  final BuildContext context;
  NyAppBar(this.context);
  AppBar createBaseAppbar(String title) {
    return AppBar(
      // elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.greenAccent.shade200,
      leading: const DrawerIconButton(),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w400),),
       actions:const [
          SearchIconButton(),
          MoreOptionIconButton()
       ],
    );
  }
}