import 'package:blog_flutter/model/blog.dart';
import 'package:blog_flutter/screen/detail/detail_screen.dart';
import 'package:blog_flutter/screen/home/widgets/rectangle_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CarouselCard extends StatefulWidget {
  final Blog blog;
  final DateTime postAt;

  CarouselCard({this.blog, this.postAt});

  @override
  _CarouselCardState createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  bool _isBookMark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(blog: widget.blog,),
            ),
          );
        },
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  widget.blog.imageUrl
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 15,
                top: 15,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.blog.isBookMark = !widget.blog.isBookMark;
                    });
                  },
                  child: Icon(
                    widget.blog.isBookMark ? Icons.bookmark_outlined : Icons.bookmark_border,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 15,
                child: Container(
                  width: 250,
                  child: Text(
                    widget.blog.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 15,
                child: Row(
                  children: [
                    RectangleImage(
                      image: "assets/images/avartar.jpg",
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.blog.author,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            timeago.format(widget.postAt),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
