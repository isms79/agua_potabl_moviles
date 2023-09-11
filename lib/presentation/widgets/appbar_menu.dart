import 'package:flutter/material.dart';
import 'package:agua_potable2/main.dart';
import 'package:agua_potable2/presentation/styles/color_scheme.dart';

class AppbarMenu extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const AppbarMenu({super.key, required this.title});

  @override
  State<AppbarMenu> createState() => _AppbarMenuState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _AppbarMenuState extends State<AppbarMenu> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 7, 26, 239),
      actions: [
        IconButton(
          onPressed: () {
            final myapp = MyApp.of(context);
            if (myapp != null) {
              myapp.changeTheme();
            }
          },
          icon: Theme.of(context).brightness == Brightness.light
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode),
        ),
      ],
    );
  }
}
