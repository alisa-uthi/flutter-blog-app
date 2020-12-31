import 'package:blog_flutter/model/blog.dart';
import 'package:blog_flutter/screen/detail/detail_screen.dart';
import 'package:blog_flutter/screen/home/widgets/rectangle_image.dart';
import 'package:blog_flutter/screen/home/widgets/time_and_likes.dart';
import 'package:flutter/material.dart';


class PopularList extends StatelessWidget {
  Blog blog;

  PopularList({this.blog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(blog: blog,),
          ),
        );
      },
      child: Row(
        children: [
          RectangleImage(
            image: blog.imageUrl,
            size: 120,
          ),
          SizedBox(width: 8,),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.category.toUpperCase(),
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 12,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 3,),
                Text(
                  blog.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 3,),
                TimeAndLikes(blog: blog),
              ],
            ),
          )
        ],
      ),
    );
  }
}
