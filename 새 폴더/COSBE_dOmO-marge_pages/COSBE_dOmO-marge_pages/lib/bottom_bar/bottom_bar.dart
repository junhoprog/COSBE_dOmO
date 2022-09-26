import 'package:cosbe_domo/dogam_page/dogam_album_page.dart';
import 'package:cosbe_domo/dogam_page/dogam_do_album_page.dart';
import 'package:cosbe_domo/dogam_page/dogam_si_album_page.dart';
import 'package:cosbe_domo/home_page/home_variable.dart';
import 'package:cosbe_domo/map_page/map_page.dart';
import 'package:flutter/material.dart';
import '../home_page/home_page.dart';
import 'bottom_bar_variable.dart';

class bottom_bar extends StatefulWidget {

  const bottom_bar({Key? key}) : super(key: key);

  @override
  State<bottom_bar> createState() => _bottom_barState();
}

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
            ), //홈
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=1;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>map_page())
                  );
                });
              },
              child: Column(
                children: [
                  Icon(
                    Icons.pin_drop,
                    color: currentTap==1 ? Colors.black : Colors.grey,
                  ),
                  Text(
                    '내 위치',
                    style: TextStyle(color: currentTap==1 ? Colors.black : Colors.grey),
                  ),
                ],
              ),
            ), //검색
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=2;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>dogam_do_album_page())
                  );
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
            ), //도감
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
            ), //찜
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
            ), //유저
          ],
        ),
      ),
    );
  }
}
