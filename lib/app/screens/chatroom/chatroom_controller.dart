
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
class Chatroomcontroller extends GetxController{
  TextEditingController messagec=TextEditingController();
  var messageValue;
  FirebaseFirestore storeInstance=FirebaseFirestore.instance;
  var radius = Radius.circular(30);
  var timestamp="";
  //var constant=MediaQuery.of(context as BuildContext).size.width;
  FirebaseAuth auth=FirebaseAuth.instance;

  Future checkTimestamp()async{
    if (timestamp != null && timestamp is Timestamp) {
                       
                        final timestampDateTime =
                            (timestamp as Timestamp).toDate();
  }}

  Future addChatToARoom( String text, String sender) async {

  await storeInstance.collection('chatroom').add({
    'text': text,
    
    'sender': auth.currentUser?.email,
    'timestamp':FieldValue.serverTimestamp(),
  });
 
}
}