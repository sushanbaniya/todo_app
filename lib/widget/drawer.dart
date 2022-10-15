import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/about.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blue[300],
        child: ListView(
          children: [
            const SizedBox(height: 50),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.pen),
              title: const Text('TODO LIST'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.addressBook),
              title: const Text('ABOUT'),
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(About.routeName),
            ),
          ],
        ));
  }
}
