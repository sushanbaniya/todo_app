import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/drawer.dart';

class About extends StatelessWidget {
  static const routeName = '/about';
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      drawer: MyDrawer(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(child: Text('Created by SUSHAN BANIYA', style: TextStyle(fontSize: 18)),),
          SizedBox(height: 15),
          FaIcon(FontAwesomeIcons.user)
        ],
      )
    );
  }
}