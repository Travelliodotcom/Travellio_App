// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/chatroom/chatroom_view.dart';

class chatContainer extends StatelessWidget {
  final String name;
  final String message;
  final String photo;
  final Color color;

  const chatContainer({
    Key? key,
    required this.name,
    required this.message,
    required this.photo,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: GestureDetector(
        onTap: () {
          Get.to(Chatroom());
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: color,
          child: ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              backgroundImage: AssetImage(photo),
              radius: 30,
              backgroundColor: Colors.white,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text("9:32 am"),
              ],
            ),
            subtitle: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset("assets/images/Vector.png"),
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
