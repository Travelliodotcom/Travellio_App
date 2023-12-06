import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:travellio/app/screens/chatroom/chatroom_controller.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';
import 'package:travellio/app/widgets/bottomNavBar.dart';

class Chatroom extends GetView {
  Chatroom({Key? key}) : super(key: key);
  final Chatroomcontroller chatroomcontroller = Get.put(Chatroomcontroller());

  @override
  Widget build(BuildContext context) {
    var currentUser = chatroomcontroller.auth.currentUser;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      //bottomNavigationBar: bottomNavBar(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.toNamed("/chat");
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: AppColor.pageColor,
        title: Text(
          "Redfish Lake",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      backgroundColor: AppColor.pageColor,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: chatroomcontroller.storeInstance
                  .collection("chatroom")
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  // Handle error
                  return Text('Error: ${snapshot.error}');
                }

                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   // Display a loading indicator
                //   return Center(
                //       child: Container(
                //           height: 100,
                //           width: 100,
                //           child: CircularProgressIndicator()));
                // }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  // No data available
                  return Text('No chat rooms available.');
                }

                final messages = snapshot.data!.docs.toList();
                return ListView.builder(
                  padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: messages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == messages.length) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Thursday 9th November",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(
                            height: 15,
                          ),
                          Container(height: 250,child: Image.asset("assets/images/profile_pic_placeholder.png")),
                          SizedBox(
                            height: 15,
                          ),
                          Text("You matched with Jane",style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      );
                    } else {
                      final messageData =
                          messages[index].data() as Map<String, dynamic>;
                      final sender = messageData['sender'];

                      final text = messageData['text'];
                      final timestamp = messageData['timestamp'];
                      final dateTime;

                      if(timestamp!=null && timestamp is Timestamp){
                       dateTime = (timestamp as Timestamp).toDate();

// Extract the time components
                      int hours = dateTime.hour;
                      int minutes = dateTime.minute;

// Format the time as a string (e.g., "HH:MM:SS")
                      String timeString =
                          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';

                      final isCurrentUserMessage =
                          (sender == currentUser!.email.toString());

                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 0, top: 5),
                        child: Align(
                          alignment: isCurrentUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: isCurrentUserMessage
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              !isCurrentUserMessage
                                  ? Text(
                                      sender, // Display the sender's name
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 108, 107, 107)),
                                    )
                                  : SizedBox(
                                      height: 3,
                                    ),
                              IntrinsicHeight(
                                child: IntrinsicWidth(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.4,
                                          color: AppColor.accentGrey),
                                      borderRadius: BorderRadius.circular(22),
                                      color: isCurrentUserMessage
                                          ? AppColor.weirdBlue
                                          : Colors.white,
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      child: Text(
                                        text,
                                        style: TextStyle(
                                            color: isCurrentUserMessage
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 15),
                                      ),
                                    )),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  timeString, // Display the sender's name
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(255, 108, 107, 107)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );}
                    }
                  },
                );
              },
            ),
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: screenWidth * 0.93,
                child: TextField(
                  
                  controller: chatroomcontroller.messagec,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                       if (chatroomcontroller.messagec.text.isNotEmpty) {
                          chatroomcontroller.messageValue =
                              chatroomcontroller.messagec.text.toString();
                          chatroomcontroller.messagec.clear();
                          chatroomcontroller.addChatToARoom(
                              chatroomcontroller.messageValue,
                              currentUser!.email.toString());
                        }
                    }, icon: Icon(Icons.send,size: 35,color: AppColor.weirdBlue,)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.accentGrey),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColor.accentGrey),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Type Something...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
