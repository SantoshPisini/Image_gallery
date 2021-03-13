import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool isFavourite;

  const HomeScreen({@required this.isFavourite});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Post {
  String id;
  String path;
  int likesCount;
  String attribution;

  Post(this.id, this.path, this.likesCount, this.attribution);
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> baseItems;
  List<String> likedItems;

  @override
  void initState() {
    baseItems = <Post>[
      new Post("100", "assets/images/100.jpg", 1170,
          "Photo by Kaique Rocha from Pexels"),
      new Post("101", "assets/images/101.jpg", 4590,
          "Photo by eberhard grossgasteiger from Pexels"),
      new Post("102", "assets/images/102.jpg", 1960,
          "Photo by Lisa Fotios from Pexels"),
      new Post("103", "assets/images/103.jpg", 1010,
          "Photo by eberhard grossgasteiger from Pexels"),
      new Post("104", "assets/images/104.jpg", 1630,
          "Photo by Rifqi Ramadhan from Pexels"),
      new Post("105", "assets/images/105.jpg", 1880,
          "Photo by Aron Visuals from Pexels"),
      new Post("106", "assets/images/106.jpg", 3200,
          "Photo by Sunyu Kim from Pexels"),
      new Post("108", "assets/images/landing.jpg", 1960,
          "Photo by Lisa Fotios from Pexels"),
      new Post("107", "assets/images/107.jpg", 855,
          "Photo by Jacob Colvin from Pexels"),
    ];
    likedItems = <String>["100", "102", "105", "106"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Post> items;
    if (widget.isFavourite) {
      items = baseItems
          .where((value) => likedItems.indexOf(value.id) != -1)
          .toList();
    } else {
      items = baseItems;
    }
    return Container(
      child: ListView.builder(
        cacheExtent: 10000,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () => {},
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    item.path,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          widget.isFavourite ||
                                  likedItems.indexOf(item.id) != -1
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          item.attribution,
                          style: TextStyle(color: Colors.white30),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(8),
          );
        },
      ),
    );
  }
}
