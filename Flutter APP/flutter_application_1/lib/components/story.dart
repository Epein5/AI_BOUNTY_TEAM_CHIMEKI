import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  List<dynamic>stories=[
    {'image':'assets/images/img2.jpg','username':'creative 1'},
    {'image':'assets/images/img3.jpg','username':'creative 2'},
    {'image':'assets/images/img4.jpg','username':'creative 3'},
    {'image':'assets/images/img5.jpg','username':'creative 4'},
    {'image':'assets/images/img2.jpg','username':'creative 5'},
    {'image':'assets/images/img3.jpg','username':'creative 6'},
    {'image':'assets/images/img4.jpg','username':'creative 7'},
    {'image':'assets/images/img5.jpg','username':'creative 8'}
  ];

  @override
  Widget build(BuildContext context) {



    return Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:List.generate(stories.length, (index)  {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child:Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: EdgeInsets.all(3),

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff982282),
                                  Color(0xffeea863)
                                ]
                            )
                        ),

                        child: Container(
                          width: 60,
                          height: 60,
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),

                          child: Container(
                            padding: const EdgeInsets.all(4),
                            width: 80,
                            height: 67,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: Colors.grey,
                                      spreadRadius: 1
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,

                                    image: AssetImage("${stories[index]["image"]}")
                                )
                            ),
                          ),
                        ),


                      ),
                      SizedBox(height: 5,),
                      
                      Text("${stories[index]["username"]}")
                    ],
                  ),


                  
                );

              })),
            ),
          ),


        ],
      );


  }
}
