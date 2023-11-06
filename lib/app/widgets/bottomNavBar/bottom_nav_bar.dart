// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travellio/app/utils/app_colors.dart';
// import 'bottom_nav_bar_controller.dart';

// class BottomNavigationView extends GetView<BottomNavigationController> {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(BottomNavigationController());
//     return Obx(() {
//       return BottomNavigationBar(
//         currentIndex: controller.selectedIndex.value,
//         onTap: (index) {
//           controller.changePage(index);
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: AppColor.botomNavBarItem,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.location_on, color: AppColor.botomNavBarItem),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.chat_bubble_rounded,
//                   color: AppColor.botomNavBarItem),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite, color: AppColor.botomNavBarItem),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person, color: AppColor.botomNavBarItem),
//               label: ''),
//         ],
//       );
//     });
//   }
// }
