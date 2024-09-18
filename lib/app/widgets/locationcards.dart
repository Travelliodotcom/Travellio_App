import 'package:flutter/material.dart';

class LocationCards extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/lakeimagetemp.png',
      'title': 'RedFish Lake',
      'location': 'Idaho',
      'rating': 4.5,
      'reviews': 40,
      'author': 'Trimulka Gupta',
      'profileImage': 'assets/images/profile_pic_placeholder.png',
      'description': 'Redfish Lake is the final stop on the longest Pacific salmon run in North America, which requires long-distance swimmers...',
    },
    {
      'image': 'assets/images/lakeimagetemp.png',
      'title': 'RedFish Lake',
      'location': 'Idaho',
      'rating': 4.5,
      'reviews': 40,
      'author': 'Trimulka Gupta',
      'profileImage': 'assets/images/profile_pic_placeholder.png',
      'description': 'Redfish Lake is the final stop on the longest Pacific salmon run in North America, which requires long-distance swimmers...',
    },
    {
      'image': 'assets/images/lakeimagetemp.png',
      'title': 'RedFish Lake',
      'location': 'Idaho',
      'rating': 4.5,
      'reviews': 40,
      'author': 'Trimulka Gupta',
      'profileImage': 'assets/images/profile_pic_placeholder.png',
      'description': 'Redfish Lake is the final stop on the longest Pacific salmon run in North America, which requires long-distance swimmers...',
    },
    // just to simulate the api here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0, right: 5, left: 5),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    item['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                '${item['reviews']}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyan),
                              ),
                              const Icon(Icons.group, color: Colors.cyan, size: 20),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.cyan, size: 20),
                          const SizedBox(width: 5),
                          Text(item['location']),
                          const SizedBox(width: 10),
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          Text('${item['rating']}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(item['profileImage']),
                            radius: 15,
                          ),
                          const SizedBox(width: 10),
                          Text(item['author']),
                          const Spacer(),
                          const Icon(Icons.favorite_border),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['description'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
