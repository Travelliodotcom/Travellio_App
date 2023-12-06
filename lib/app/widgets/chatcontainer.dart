import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:travellio/app/screens/chatroom/chatroom_view.dart';

class chatContainer extends StatelessWidget {
  final String name;
  final String message;
  final String photo;
  final Color color;
  const chatContainer(
      {super.key,
      required this.name,
      required this.message,
      required this.photo,required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Get.to(Chatroom());
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(photo),
                  radius: 40,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 170),
                        child: Text(
                          name,
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text("9:32 am")
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: 20,
                          width: 20,
                          child: Image.asset("assets/images/Vector.png")),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
