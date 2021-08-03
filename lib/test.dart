import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key key}) : super(key: key);
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  int i=0;
  var _checkBox1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.black.withOpacity(0)),
            ),
            Center(
                child: switchButtonView(Colors.orange, Colors.green, "a", "b"),
            ),
          ]
      ),
    );
  }
  Widget switchButtonView(Color color1, color2, String text1, text2){
    return Center(
        child: Column(children: [
          Column(
              children:[
                (() {
                  if (i == 0){
                    return Column(
                        children: [
                          Row(children: [
                            Expanded(
                              child: InkWell(
                                  onTap: (){},
                                  child: Container(height: 50,
                                    color: color1,
                                    child: Align(alignment: Alignment.center,child: Text(text1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),)),
                                  )
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                  onTap: (){setState(() {
                                    i=1;
                                  });},
                                  child: Container(height: 50,
                                    color: color2,
                                    child: Align(alignment: Alignment.center,child: Text(text2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0))),
                                  )
                              ),
                            ),
                          ],
                          ),
                        ]
                    );
                  } else {
                    return Column(
                      children: [
                        Row(children: [
                          Expanded(
                            child: InkWell(
                                onTap: (){setState(() {
                                  i=0;
                                });},
                                child: Container(height: 50,
                                  color: color2,
                                  child: Align(alignment: Alignment.center,child: Text(text1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),)),
                                )
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                                onTap: (){},
                                child: Container(height: 50,
                                  color: color1,
                                  child: Align(alignment: Alignment.center,child: Text(text2,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.0),)),
                                )
                            ),
                          ),
                        ],
                        ),
                      ],
                    );
                  }})()
              ]
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 4.0),
            child: Row(
              children: [
                Checkbox(
                  value: _checkBox1,
                  onChanged: (bool value){
                    setState((){
                      _checkBox1 = value;
                    });
                  },
                  activeColor: Colors.green,
                  checkColor: Colors.black,
                ),
              ],
            ),
          ),
          Expanded(child:Container()),
        ],)
    );
  }
}
