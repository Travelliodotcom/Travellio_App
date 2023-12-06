import 'content.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:travellio/app/utils/app_colors.dart';

class Matching extends StatefulWidget {
  Matching({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MatchingState createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Red",
    "Blue",
    "Green",
    "Yellow",
    "Orange",
    "Grey",
    "Purple",
    "Pink"
  ];
  final List<String> _imageUrls = [
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://images.indianexpress.com/2016/09/pisa3.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1T7noMiMob7ZM_QImqeIF2C-JtQEaJ_s-Dw&usqp=CAU",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
    "https://as2.ftcdn.net/v2/jpg/02/67/12/89/1000_F_267128921_Sh7Kk8LTpnykKoWM7k1p86X4HzfLK6Pc.jpg",
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.grey,
    Colors.purple,
    Colors.pink
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(
              image: _imageUrls[i], // Use image URL here
              text: _names[i],
              color: _colors[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: const Duration(milliseconds: 200),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: const Duration(milliseconds: 200),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: const Duration(milliseconds: 200),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.pageColor,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColor.pageColor,
          title: Text(widget.title!),
        ),
        body: Stack(children: [
          Container(
            color: Colors.grey[300],
            child: SizedBox(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: SwipeCards(
                onStackFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Stack Finished"),
                    duration: Duration(milliseconds: 500),
                  ));
                },
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              _swipeItems[index].content.image,
                              fit: BoxFit
                                  .cover, // Adjust this property based on your image requirements
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Jane Doe (21)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.location_pin,
                                  color: Color.fromRGBO(144, 202, 249, 1)),
                              Text("Local"),
                              Icon(Icons.public,
                                  color: Color.fromRGBO(144, 202, 249, 1)),
                              Text("32 countries"),
                              Icon(Icons.person,
                                  color: Color.fromRGBO(144, 202, 249, 1)),
                              Text("Male"),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white, // Grey background color
                              border: Border.all(
                                color: Colors.black, // Black border color
                                width: 2.0,
                              ),
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Biography',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold, // Bold title
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(
                                    height: 10), // Space between title and text
                                Text(
                                  'The best adventures come from travelling outside your comfort zone.', // Random text
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },

                // ...rest of your SwipeCards properties
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      _matchEngine!.currentItem?.nope();
                    },
                    child: const Icon(Icons.close)),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      _matchEngine!.currentItem?.superLike();
                    },
                    child: const Icon(Icons.star)),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      _matchEngine!.currentItem?.like();
                    },
                    child: const Icon(Icons.check))
              ],
            ),
          )
        ]));
  }
}
