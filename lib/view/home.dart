import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/connection/connection_provider.dart';
import 'package:flutterapp/model/quote/quote.dart';
import 'package:flutterapp/model/quote/quote_provider.dart';
import 'package:flutterapp/model/widgets/Utils.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> _quotes_=[];
  Map<int, String> m = <int, String>{};
  bool isLoading=true;
  bool isConnectedToNetwork=false;
  @override
  void initState() {
    super.initState();
  }
  String getImagePath(int num) {
    num=(num%12);
    switch(num) {
      case 0: return "assets/a.jpg";
      case 1: return "assets/b.jpg";
      case 2: return "assets/c.jpg";
      case 3: return "assets/d.jpg";
      case 4: return "assets/e.jpg";
      case 5: return "assets/f.jpg";
      case 6: return "assets/g.jpg";
      case 8: return "assets/h.jpg";
      case 9: return "assets/i.jpg";
      case 10: return "assets/j.jpg";
      case 11: return "assets/k.jpg";
    }
    return "assets/l.jpg";
  }
  bool isLoadingFunction() {
    if(isLoading) {
      context.select<QuoteProvider, void>((value) => value.loadAllQuotes());
    }
    return isLoading;
  }
  @override
  Widget build(BuildContext context) {
    _quotes_=context.watch<QuoteProvider>().getAllQuotes;
    isLoading=context.watch<QuoteProvider>().allQuotesIsLoading;
    isConnectedToNetwork=context.watch<ConnectionProvider>().isConnectedToNetwork;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
      child: Utils.connectOrNotWidget(
            isConnectedToNetwork,
            isLoadingFunction()?
            const Padding(
                padding: EdgeInsets.only(top: 44.0),
                child: Center(
                    child:
                    CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<
                          Color>(Colors.black45),
                    )
                )
            ):
            ListView.builder(
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
                                width: 250,
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
            )
      )
              //Text("Not connected at network")
    );
  }
}
