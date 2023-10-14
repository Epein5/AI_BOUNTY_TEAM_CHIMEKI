import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_bar.dart';
import 'package:flutter_application_1/components/post.dart';
import 'package:flutter_application_1/components/story.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'छिमेकी',
              style: TextStyle(
                  fontFamily: 'Billabong',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          titleSpacing: 3,
          actions: [
            const IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                iconSize: 30,
                onPressed: null),
            const IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
                iconSize: 30,
                onPressed: null),
            IconButton(
                icon: Image.asset(
                  'assets/images/message_icon.png',
                  color: Colors.black,
                ),
                iconSize: 20,
                onPressed: null)
          ],
        ),
        body: Column(
          children: [
            Story(),
            const Divider(
              color: Colors.grey,
            ),
            Expanded(child: Post())
          ],
        ),
        bottomNavigationBar: BottomBar());
  }
}
