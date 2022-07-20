import 'package:flutter/material.dart';

import '../home/home_page.dart';

class bottom_bar extends StatefulWidget {

  const bottom_bar({Key? key}) : super(key: key);

  @override
  State<bottom_bar> createState() => _bottom_barState();
}
int currentTap=0;
class _bottom_barState extends State<bottom_bar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=0;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>home_page())
                  );
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.home,
                    color: currentTap==0 ? Colors.black : Colors.grey,
                  ),
                  Text(
                    '홈',
                    style: TextStyle(color: currentTap==0 ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=1;

                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: currentTap==1 ? Colors.black : Colors.grey,
                  ),
                  Text(
                    '검색',
                    style: TextStyle(color: currentTap==1 ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=2;

                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.map_outlined,
                    color: currentTap==2 ? Colors.black : Colors.grey,
                  ),
                  Text(
                    '도감',
                    style: TextStyle(color: currentTap==2 ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=3;

                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: currentTap==3 ? Colors.black : Colors.grey,
                  ),
                  Text(
                    '찜',
                    style: TextStyle(color: currentTap==3 ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=4;

                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: currentTap==4 ? Colors.black : Colors.grey,
                  ),
                  Text(
                    '유저',
                    style: TextStyle(color: currentTap==4 ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
