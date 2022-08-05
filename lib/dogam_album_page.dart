import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: dogam_album()));
}

Map<String,bool> Imagemap_cheongju = {
  "assets/suamgol.jpg":false,
  "assets/cheongju_museum.jpg":false,
  "assets/sangdang3.jpg":false,
  "assets/cheongju_zoo.jpg":false,
  "assets/cheongju_yonghwasa.jpg":false,
  "assets/cheongjuland.jpg":false,
  "assets/cheongju_garosu.jpg":false,
  "assets/cheongju_sungangil.jpg":false,
  "assets/cheongju_goinswae.jpg":false,
  "assets/cheongju_jungangpark.jpg":false,
  "assets/cheongju_cheongnamdae.jpg":false,
  "assets/cheongju_jungbukdong.jpg":false,
  "assets/cheongju_myeongam.jpg":false,
  "assets/cheongju_samilpark.jpg":false,
};
Map<String,String> Imagemap_cheongju_title ={
  "수암골":"#벽화마을#전망대",
  "국립청주박물관":"#문화유산#국보",
  "상당산성":"#백제#둘레길",
  "청주동물원":"#청주랜드#동물원",
  "용화사":"#사찰#템플스테이",
  "청주랜드":"#어린이#놀이공원",
  "청주가로수길":"#가로수길#숲터널",
  "성안길":"#시내#상권중심",
  "청주고인쇄박물관":"#박물관#금속활자",
  "청주중앙공원":"#역사공원#망선루",
  "청남대":"#대통령별장#드라이브",
  "정북동 토성":"#인생사진#성곽",
  "명암유원지":"#유원지#저수지",
  "삼일공원":"#3.1운동#독립공원",


};

class dogam_album extends StatefulWidget {
  const dogam_album({Key? key}) : super(key: key);

  @override
  State<dogam_album> createState() => _dogam_albumState();
}

class _dogam_albumState extends State<dogam_album> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width/3*2,
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset("assets/sangdang2.jpg",fit: BoxFit.fitWidth,),
                  ),
                  Positioned(
                      top: 20,
                      child: IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.keyboard_arrow_left,size: 50,color: Colors.white,))
                  ),
                  Positioned(
                    top:145,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("청주",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color:Colors.white),),
                        Text("성장과 나눔의 도시 청주",style: TextStyle(fontSize:20,color:Colors.white),),
                      ],
                    ),
                  )
                ]
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/15,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4*2,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.6),
                scrollDirection: Axis.horizontal,
                itemCount: Imagemap_cheongju.length,
                itemBuilder: (context, index) {
                  return Align(
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){},
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ColorFiltered(
                                  colorFilter: ColorFilter.mode(Imagemap_cheongju.values.elementAt(index)==false ? Colors.grey : Colors.transparent, BlendMode.saturation),
                                  child: Image.asset(
                                    "${Imagemap_cheongju.keys.elementAt(index)}",
                                    fit: BoxFit.fitHeight,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height/5*2,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.add_a_photo_outlined,size: 40,),
                                )
                              ],
                            ),
                            Text("${Imagemap_cheongju_title.keys.elementAt(index)}",style: TextStyle(fontSize: 20),),
                            Text("${Imagemap_cheongju_title.values.elementAt(index)}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
