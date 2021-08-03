import 'package:flutter/material.dart';
import 'package:ui_trace803/test.dart';

void main() {
  runApp(
    MaterialApp(
      home: SecondRoute(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  var _itemSelectedIndex = 0;
  //final _pageController = PageController();
  Widget pageDot(int page) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _itemSelectedIndex = page;
        }
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: page == _itemSelectedIndex ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }

  Widget usualButtonView(String text, Color color, textColor){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: (){},
          child: Container(
            height: 50,
            child: Center(
              child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(IconData iconData, String label){
    return BottomNavigationBarItem(icon: Icon(iconData), label: label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Cash Card", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.account_circle_outlined, size: 30,),
              )
            ],
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height /2,
            child: PageView(
              controller: PageController(),
              onPageChanged: (index) {
                setState(() {
                  _itemSelectedIndex = index;
                });
              },
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.green,
                ),
                Column(children: [
                  Image.asset("assets/apple.jpg", scale: 2,),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Bank With It", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Text("Access banking features like direct\ndeposit, ATM withdrawals, and more",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  Expanded(child: Container()),
                ],),
              ],
            ),
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pageDot(0),
              pageDot(1),
              pageDot(2),
              pageDot(3)
            ],
          ),
          Spacer(),
          usualButtonView("Get Free Cash Card", Colors.green, Colors.white),
        ],
      ),
    );
  }
}