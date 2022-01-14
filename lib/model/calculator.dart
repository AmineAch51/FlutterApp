import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget getButton(String text, Color _color, double h, double v) {
    return  ElevatedButton(
      onPressed: () {

      },
      child: Text(
          text,
          style: TextStyle(
            fontSize: 30
          ),
      ),
      style: ElevatedButton.styleFrom(
          primary: _color,
          elevation: 3, //elevation of button
          shape: RoundedRectangleBorder( //to set border radius to button
              borderRadius: BorderRadius.circular(50)
          ),
          padding: EdgeInsets.symmetric(horizontal: h, vertical: v)//content padding inside button
      )
    );
    // return Button(
    //   color: _color,
    //   child: Center(
    //     child: Text(text),
    //   ),
    //   decoration: Decoration(
    //
    //   ),
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 150),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textDirection: TextDirection.rtl,
                    decoration: const InputDecoration.collapsed(
                        hintText: "0000000",
                        border: InputBorder.none,
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                          fontSize: 60.0,
                          color: Colors.white,
                        )
                    ),
                    style: const TextStyle(
                        fontSize: 60.0,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(width: 40)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    children: [
                      getButton(
                          "AC",
                          Colors.white12,
                          20,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "+/-",
                          Colors.white12,
                          20,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "%",
                          Colors.white12,
                          28,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "/",
                          Colors.orange,
                          32,
                          20
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      getButton(
                          "7",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "8",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "9",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "x",
                          Colors.orange,
                          30,
                          22
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      getButton(
                          "4",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "5",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "6",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "-",
                          Colors.orange,
                          33,
                          22
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      getButton(
                          "3",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "2",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "1",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "+",
                          Colors.orange,
                          30,
                          22
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      getButton(
                          "0",
                          Colors.white12,
                          80,
                          18
                      ),
                      SizedBox(width: 10),
                      getButton(
                          ",",
                          Colors.white12,
                          30,
                          22
                      ),
                      SizedBox(width: 10),
                      getButton(
                          "=",
                          Colors.orange,
                          30,
                          22
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      )
    );
  }
}
