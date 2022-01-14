import 'dart:math';

import 'package:flutterapp/model/quote/quote.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Quotes {
  Future<dynamic> _getQuotes() async {
    var url = Uri.parse('https://type.fit/api/quotes');
    http.Response response=await http.get(url);
    return convert.jsonDecode(response.body);
  }
  Future<List<Quote>> getQuotes(int n) async {
    n=max(n, 0);
    var jsonResponse = await _getQuotes();
    List<Quote> result=[];
    for(var _quote in jsonResponse) {
      try {
        Quote quote = Quote.fromJson(_quote); //
        result.add(quote);
      }catch(_) {}
    }
    print(result.length);
    return result;
  }
  Future<List<String>> getAuthorsNames() async {
    var jsonResponse = await _getQuotes();
    List<String> result=[];
    Map<String, bool> m=<String, bool>{};
    for(var _quote in jsonResponse) {
      try {
        String author=_quote["author"];
        if(m.containsKey(author)) {
          continue;
        }
        m[author];
        result.add(author);
      }catch(_) {}
    }
    return result;
  }
}