import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/quote/quote.dart';
import 'package:flutterapp/model/quote/quote_provider.dart';
import 'package:provider/src/provider.dart';

class Favourite extends StatefulWidget {
  static _FavouriteState ?favouriteState;
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Quote> _quotes_=[];
  Map<int, String> m = <int, String>{};
  @override
  void initState() {
    super.initState();
  }
  String getImagePath(int num) {
    num=(num%8);
    switch(num) {
      case 0: return "assets/a.jpg";
      case 1: return "assets/b.jpg";
      case 2: return "assets/c.jpg";
      case 3: return "assets/d.jpg";
      case 4: return "assets/e.jpg";
      case 5: return "assets/f.jpg";
      case 6: return "assets/g.jpg";
    }
    return "assets/h.jpg";
  }
  @override
  Widget build(BuildContext context) {
    _quotes_=context.watch<QuoteProvider>().getFavouriteQuotes;
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: ListView.builder(
        itemCount: _quotes_.length,
        itemBuilder: (context, index) {
          Quote val=_quotes_[index];
          return Card(
            child: Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(getImagePath(index)),
                      radius: 30,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250 ,
                          child: FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown,
                            child: Text(
                              val.author,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 250,
                          child: Text(
                            val.text,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            if(context.read<QuoteProvider>().contain(val)) {
                              context.read<QuoteProvider>().removeQuote(val);
                            }else {
                              context.read<QuoteProvider>().saveQuote(val);
                            }
                          },
                          child: Icon(
                            context.read<QuoteProvider>().contain(val)?
                            CupertinoIcons.heart_solid:
                            CupertinoIcons.heart,
                            size: 25,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                )
            ),
          );
        },
      ),
    );
  }
}
