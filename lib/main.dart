import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import './widget/drawer.dart';
import './screens/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), routes: {
      About.routeName: (context) => About(),
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  List<String> title = [];

  // void _submitData() {
  //   final String enteredTitle = _titleController.text;
  // }

  // Future<void> addTitle() async {
  //   var url =
  //       Uri.https('own-todolist-default-rtdb.firebaseio.com/title/$title.json?auth=1013878182379');
  //   final response = await http.post(
  //     url,
  //     body: json.encode(
  //       {'title': title},
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do List')),
      drawer: MyDrawer(),
      body: title.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Start Adding Your ToDo things...',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 18),
                  FaIcon(FontAwesomeIcons.addressBook, size: 40)
                ],
              ),
            )
          : ListView.builder(
              itemCount: title.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.blue,

                  //  shadowColor: Colors.white,
                  elevation: 5,
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.rocket),
                    title: Text(
                      title[index].toUpperCase(),
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white70,
                      ),
                    ),
                    subtitle: Text(
                      DateTime.now().toString(),
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    // trailing: IconButton(icon: Icon(Icons.delete), onPressed:() => setState(() {
                    //   title.removeAt(title[index]);
                    // }) )
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.pen),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Card(
                elevation: 100,
                borderOnForeground: true,
                // color: Colors.blue,
                child: Container(
                  height: 350,
                  color: Colors.blue[200],
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            decoration: InputDecoration(labelText: 'Title'),
                            controller: _titleController,
                            // onSubmitted: (_) => _submitData()
                          ),
                        ),
                        SizedBox(height: 50),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.thumbsUp, size: 50),
                          onPressed: () {
                            setState(
                              () {
                                title.add(_titleController.text);
                              },
                            );
                            // addTitle();
                            _titleController.clear();
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
