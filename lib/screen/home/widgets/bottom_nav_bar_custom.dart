import 'package:flutter/material.dart';

class BottomNavBarCustom extends StatefulWidget {
  @override
  _BottomNavBarCustomState createState() => _BottomNavBarCustomState();
}

class _BottomNavBarCustomState extends State<BottomNavBarCustom> {
  int _selectedIndex = 0;

  List _icons = [
    Icons.home_filled,
    Icons.search_sharp,
    Icons.bookmark_border_outlined,
    Icons.person_outline
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8.0,
          top: 5.0
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _icons.map((icon) {
            int index = _icons.indexOf(icon);
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Icon(
                icon,
                color: index == _selectedIndex ? Colors.redAccent : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
