import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travellio/app/screens/chatpage/chatpage_controller.dart';
import 'package:travellio/app/utils/app_colors.dart';
import 'package:travellio/app/widgets/chatcontainer.dart';

class Chatpage extends GetView {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    var tabController = Get.put(Chatpagecontroller());

    return Scaffold(
      backgroundColor: AppColor.pageColor,
      appBar: AppBar(
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.create, color: Colors.black),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(onTap: (){},child: Image.asset("assets/images/newchaticon.png")),
          )
        ],
        centerTitle: true,
        
        elevation: 0,
        backgroundColor: AppColor.pageColor,
        title: const Text(
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
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
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
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    indicator: ShapeDecoration(

                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.only(
                          topLeft: tabController.tabIndex.value == 0
                              ? const Radius.circular(10)
                              : Radius.zero,
                          topRight: tabController.tabIndex.value == 1
                              ? const Radius.circular(10)
                              : Radius.zero,
                        ),
                      ),
                      color: AppColor.weirdBlue,
                    ),
                    tabs: const [
                      Tab(text: "Private"),
                      Tab(text: "Group"),
                    ],
                  ),
                ),
              )),

          Expanded(
            child: TabBarView(
              controller: tabController.controller,
              children: [
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const chatContainer(
                        name: "Jane",
                        message: "Chingchong",
                        photo: "assets/images/profile_pic_placeholder.png",color: Colors.white,),
                    const chatContainer(name: "Nego", message: "Meet me in prison", photo: "assets/images/Ellipse 6.png",color: Colors.white,),
                    chatContainer(name: "Woman", message: "Bj vs Hj?", photo: "assets/images/negow.png",color: AppColor.chatGreen,),
                    const chatContainer(name: "Tommy", message: "moye moye", photo: "assets/images/tommy.png", color: Colors.white),
                    const chatContainer(name: "Alibhoi", message: "khuda hafeez", photo: "assets/images/ali.png", color: Colors.white),
                    const chatContainer(name: "Eshu", message: "Singer-Guitarist", photo: "assets/images/meta.png", color: Colors.white)
                  ],
                ),
                const Center(child: Text("NO GROUPS CREATED YET CUZ UR A LONER")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
