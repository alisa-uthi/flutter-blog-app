import 'package:blog_flutter/model/blog.dart';
import 'package:blog_flutter/screen/home/widgets/popular_list.dart';
import 'package:blog_flutter/screen/home/widgets/bottom_nav_bar_custom.dart';
import 'package:blog_flutter/screen/home/widgets/carousel_card.dart';
import 'package:blog_flutter/screen/home/widgets/rectangle_image.dart';
import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String timeNow =  DateFormat.MMMMEEEEd().format(DateTime.now());
  final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));

   List<Blog> blogs = [
    Blog(
        title: "Why The Freelance Life May Get Easier",
        author: "Teal Milano",
        category: "Freelance",
        description: lipsum.createParagraph(),
        createdAt: DateFormat.MMMMEEEEd().format(DateTime.now()),
        imageUrl: "assets/images/blog1.jpg",
        numberOfLike: 555,
        isBookMark: false
    ),
    Blog(
        title: "Most Awaited - Figma Launches Plugin",
        author: "Teal Milano",
        category: "Design",
        description: lipsum.createParagraph(),
        createdAt: DateFormat.MMMMEEEEd().format(DateTime.now()),
        imageUrl: "assets/images/blog2.jpg",
        numberOfLike: 786,
        isBookMark: false
    ),
    Blog(
        title: "Netflix Tests Using Activity Data",
        author: "Teal Milano",
        category: "Tech",
        description: lipsum.createParagraph(),
        createdAt: DateFormat.MMMMEEEEd().format(DateTime.now()),
        imageUrl: "assets/images/blog3.jpg",
        numberOfLike: 120,
        isBookMark: false
    ),
     Blog(
         title: "Facebook Tests Using Activity Of User",
         author: "Teal Milano",
         category: "Fintech",
         description: lipsum.createParagraph(),
         createdAt: DateFormat.MMMMEEEEd().format(DateTime.now()),
         imageUrl: "assets/images/blog4.jpg",
         numberOfLike: 385,
         isBookMark: false
     ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarCustom(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timeNow,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text(
                    "Blog",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  RectangleImage(
                    image: "assets/images/avartar.jpg",
                    size: 50,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: blogs.map((blog){
                    return CarouselCard(
                      blog: blog,
                      postAt: fifteenAgo
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: blogs.map((blog){
                      return PopularList(
                          blog: blog,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
