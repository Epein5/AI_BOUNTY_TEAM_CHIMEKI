import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post extends StatefulWidget {
  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  getPostApi() async {
    final response =
        await http.get(Uri.parse("http://10.0.2.2:5000/json_data"));

    return response.body;
  }

  List<dynamic> posts = [
    {
      'image': 'assets/images/img1.jpg',
      'username': 'creative 1',
      'post': 'new post 1',
      'likes': 100
    },
    {
      'image': 'assets/images/img2.jpg',
      'username': 'creative 2',
      'post': 'new post 2',
      'likes': 150
    },
    {
      'image': 'assets/images/img3.jpg',
      'username': 'creative 3',
      'post': 'new post 3',
      'likes': 100
    },
    {
      'image': 'assets/images/img4.jpg',
      'username': 'creative 4',
      'post': 'new post 4',
      'likes': 20
    },
    {
      'image': 'assets/images/img5.jpg',
      'username': 'creative 5',
      'post': 'new post 5',
      'likes': 200
    },
    {
      'image': 'assets/images/img6.jpg',
      'username': 'creative 6',
      'post': 'new post 6',
      'likes': 160
    },
    {
      'image': 'assets/images/img7.jpg',
      'username': 'creative 7',
      'post': 'new post 7',
      'likes': 10
    },
    {
      'image': 'assets/images/img8.jpg',
      'username': 'creative 8',
      'post': 'new post 8',
      'likes': 170
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
          future: getPostApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = jsonDecode(snapshot.data.toString());

              List<Map<String, String>> eventList = [];
              data.forEach((eventName, eventData) {
                eventList.add({
                  'name': eventName,
                  'url': eventData['url'],
                  'text': eventData['text'],
                });
              });

              return SizedBox(
                height: 600,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: eventList.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              '${posts[index]["image"]}'),
                                        )),
                                  ),
                                ),
                                title: Text("${posts[index]["username"]}"),
                                trailing: const Icon(Icons.more_vert),
                              ),
                              Container(
                                height: 400,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(posts[index]["image"]))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                leading: Wrap(children: [
                                  const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    'assets/images/comment_icon.png',
                                    width: 20,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    'assets/images/message_icon.png',
                                    width: 30,
                                    height: 25,
                                    color: Colors.black,
                                  ),
                                ]),
                                trailing: const Icon(
                                  Icons.bookmark_border_outlined,
                                  size: 28,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  '${posts[index]["likes"]} Likes',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  softWrap: true, // Enable text wrapping
                                  // overflow: TextOverflow.ellipsis,
                                  eventList[index]['name'].toString() +
                                      "..:" +
                                      eventList[index]['text'].toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'View all 100 comments',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            } else {
              const Center(child: CircularProgressIndicator());
            }
            return Container();
          }),
    );
  }
}
