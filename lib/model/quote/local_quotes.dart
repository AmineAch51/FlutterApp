import 'package:flutterapp/model/quote/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalQuotes {
  SharedPreferences ?_prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  String _generateKey(Quote quote) {
    return quote.text+"___|||___"+quote.author;
  }
  bool containQuote(Quote quote) {
    return _prefs!.containsKey(_generateKey(quote));
  }
  void saveQuote(Quote quote) {
    _prefs!.setString(_generateKey(quote), _generateKey(quote));
  }
  void removeQuote(Quote quote) {
    _prefs!.remove(_generateKey(quote));
  }
  List<Quote> getFavouriteQuotes() {
    List<Quote> result=[];
    for(var key in _prefs!.getKeys()) {
      List<String> lstr=key.split("___|||___");
      result.add(
          Quote(text: lstr[0], author: lstr[1])
      );
    }
    return result;
  }

}