import 'package:blog_flutter/model/blog.dart';
import 'package:blog_flutter/screen/detail/widgets/image_with_nav_bar.dart';
import 'package:blog_flutter/screen/home/widgets/rectangle_image.dart';
import 'package:blog_flutter/screen/home/widgets/time_and_likes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatefulWidget {
  Blog blog;

  DetailScreen({this.blog});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            ImageWithNavBar(blog: widget.blog),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.blog.category.toUpperCase(),
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        widget.blog.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      TimeAndLikes(blog: widget.blog),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          RectangleImage(
                            image: "assets/images/avartar.jpg",
                            size: 40,
                          ),
                          SizedBox(width: 5,),
                          Text(
                            widget.blog.author,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: ReadMoreText(
                            widget.blog.description,
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                            ),
                            trimLines: 3,
                            colorClickableText: Colors.redAccent,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read More',
                            trimExpandedText: 'Less',
                            moreStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
