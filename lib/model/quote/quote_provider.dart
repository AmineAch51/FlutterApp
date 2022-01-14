import 'package:flutter/cupertino.dart';
import 'package:flutterapp/controller/quotes.dart';
import 'package:flutterapp/model/quote/local_quotes.dart';
import 'package:flutterapp/model/quote/quote.dart';

class QuoteProvider extends ChangeNotifier {
  void loadAllQuotes() async { // Load quote api from webservice // { "" : dkdk }
    if(_isFetchingQuoteFromApi) {
      return;
    }
    dynamic list = [];
    try {
      _isFetchingQuoteFromApi=true;
      list=await _quotes.getQuotes(0);
    }catch(err) {
      list=null;
    }
    _isFetchingQuoteFromApi=false;
    if(list==null) {
      _allquotes=[];
      _allQuotesIsLoading=true;
    }else {
      list.shuffle();
      _allquotes = list;
      _allQuotesIsLoading=false;
    }
    notifyListeners();
  }
  void loadFavouriteQuote() async {
    await localQuotes.init();
    List<Quote> list = localQuotes.getFavouriteQuotes();
    _favouritequotes = list;
    _favouriteQuotesIsLoading=false;
    notifyListeners();
  }
  QuoteProvider() {
    loadAllQuotes();
    loadFavouriteQuote();
  }

  void saveQuote(Quote quote) {
    if(localQuotes.containQuote(quote)) {
      return;
    }
    localQuotes.saveQuote(quote);
    _favouritequotes.add(quote);
    notifyListeners();
  }
  void removeQuote(Quote quote) {
    int index=_favouritequotes.indexOf(quote);
    if(index==-1) {
      return;
    }
    localQuotes.removeQuote(quote);
    _favouritequotes.removeAt(index);
    notifyListeners();
  }
  bool contain(Quote quote) {
    return localQuotes.containQuote(quote);
  }

  List<Quote> get getAllQuotes => _allquotes;
  List<Quote> get getFavouriteQuotes => _favouritequotes;
  bool get allQuotesIsLoading => _allQuotesIsLoading;
  bool get favouriteQuotesIsLoading => _favouriteQuotesIsLoading;

  LocalQuotes localQuotes = LocalQuotes();
  final Quotes _quotes = Quotes();

  List<Quote> _allquotes = [];
  bool _allQuotesIsLoading=true;
  List<Quote> _favouritequotes = [];
  bool _favouriteQuotesIsLoading=true;
  bool _isFetchingQuoteFromApi=false;
}