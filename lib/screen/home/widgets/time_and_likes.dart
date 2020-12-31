import 'package:blog_flutter/model/blog.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeAndLikes extends StatelessWidget {
  Blog blog;

  TimeAndLikes({this.blog});

  final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.watch_later_outlined,
          size: 13,
          color: Colors.grey,
        ),
        SizedBox(width: 3,),
        Text(
          timeago.format(fifteenAgo),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
        SizedBox(width: 30,),
        Icon(
          Icons.thumb_up_alt_outlined,
          size: 13,
          color: Colors.grey,
        ),
        SizedBox(width: 3,),
        Text(
          "${blog.numberOfLike}",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
