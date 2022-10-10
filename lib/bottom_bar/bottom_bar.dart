import 'package:cosbe_domo/dogam_page/dogam_album_page.dart';
import 'package:cosbe_domo/dogam_page/dogam_do_album_page.dart';
import 'package:cosbe_domo/dogam_page/dogam_si_album_page.dart';
import 'package:cosbe_domo/home_page/home_variable.dart';
import 'package:cosbe_domo/map_page/map_page.dart';
import 'package:cosbe_domo/my_page/my_page.dart';
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
        height: 60,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentTap==0 ?  Color(0xff656CFF) : Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTap==0 ? Colors.white : Colors.grey,
                        ),
                        Text(
                          '홈',
                          style: TextStyle(color: currentTap==0 ? Colors.white : Colors.grey),
                        )
                      ],
                    ),
                  )
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
                      MaterialPageRoute(builder: (context)=>dogam_do_album_page())
                  );
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: currentTap==1?  Color(0xff656CFF) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      color: currentTap==1 ? Colors.white : Colors.grey,
                    ),
                    Text(
                      '도감',
                      style: TextStyle(color: currentTap==1 ? Colors.white : Colors.grey),
                    ),
                  ],
                ),
              ),
            ), //도감
            MaterialButton(
              minWidth: 40,
              onPressed: (){
                setState((){
                  currentTap=2;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>my_page())
                  );
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: currentTap==2?  Color(0xff656CFF) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: currentTap==2 ? Colors.white : Colors.grey,
                    ),
                    Text(
                      '유저',
                      style: TextStyle(color: currentTap==2 ? Colors.white : Colors.grey),
                    ),
                  ],
                ),
              ),
            ), //유저
          ],
        ),
      ),
    );
  }
}
