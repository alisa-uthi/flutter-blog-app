import 'package:blog_flutter/model/blog.dart';
import 'package:flutter/material.dart';

class ImageWithNavBar extends StatefulWidget {
  Blog blog;

  ImageWithNavBar({this.blog});
  @override
  _ImageWithNavBarState createState() => _ImageWithNavBarState();
}

class _ImageWithNavBarState extends State<ImageWithNavBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height / 2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.blog.imageUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.dstATop
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.blog.isBookMark = ! widget.blog.isBookMark;
                      });
                    },
                    child: Icon(
                      widget.blog.isBookMark ? Icons.bookmark_outlined : Icons.bookmark_border,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
