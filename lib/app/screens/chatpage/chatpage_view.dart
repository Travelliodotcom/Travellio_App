import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/chatpage/chatpage_controller.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/utils/buildLayout/buildLayout_controller.dart';
import 'package:travellio/app/widgets/bottomNavBar.dart';
import 'package:travellio/app/widgets/chatcontainer.dart';

class Chatpage extends GetView {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    var tabController = Get.put(Chatpagecontroller());

    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      backgroundColor: AppColor.pageColor,
      appBar: AppBar(
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.create, color: Colors.black),
          // ),
          GestureDetector(onTap: (){},child: Image.asset("assets/images/newchaticon.png"))
        ],
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.toNamed("/home");
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: AppColor.pageColor,
        title: Text(
          "Messages",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                child: TextField(
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.botomNavBarItem.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(30)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.botomNavBarItem.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColor.botomNavBarItem.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(30)),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none
                          )
                          ),
                ),
              ),
            ),
          ),

          Obx(() => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 2, color: AppColor.weirdBlue))),
                  child: TabBar(
                    unselectedLabelColor: AppColor.weirdBlue,
                    controller: tabController.controller,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: tabController.tabIndex.value == 0
                              ? Radius.circular(10)
                              : Radius.zero,
                          topRight: tabController.tabIndex.value == 1
                              ? Radius.circular(10)
                              : Radius.zero,
                        ),
                      ),
                      color: AppColor.weirdBlue,
                    ),
                    tabs: [
                      Tab(text: "Private"),
                      Tab(text: "Group"),
                    ],
                  ),
                ),
              )),
// Container(
//             height: 2.0,
//             color: AppColor.weirdBlue,
//           ),
          Expanded(
            child: TabBarView(
              controller: tabController.controller,
              children: [
                ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    chatContainer(
                        name: "Jane",
                        message: "Chingchong",
                        photo: "assets/images/profile_pic_placeholder.png",color: Colors.white,),
                    chatContainer(name: "Nego", message: "Meet me in prison", photo: "assets/images/Ellipse 6.png",color: Colors.white,),
                    chatContainer(name: "Woman", message: "Bj vs Hj?", photo: "assets/images/negow.png",color: AppColor.chatGreen,),
                    chatContainer(name: "Tommy", message: "moye moye", photo: "assets/images/tommy.png", color: Colors.white),
                    chatContainer(name: "Alibhoi", message: "khuda hafeez", photo: "assets/images/ali.png", color: AppColor.chatGreen),
                    chatContainer(name: "Eshu", message: "Singer-Guitarist", photo: "assets/images/meta.png", color: Colors.white)
                  ],
                ),
                Center(child: Text("NO GROUPS CREATED YET CUZ UR A LONER")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
