import 'package:apiexample/model/storeapimodel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Storeapi with ChangeNotifier {
  List<Storeapimodel>? _imagedata;
  List<Storeapimodel>? get imagedata => _imagedata;
  bool _isloading = false;
  bool get isloading => _isloading;

  String baseurl = "https://fakestoreapi.com/products";

  Future<void> fetchdata() async {
    _isloading = true;
    notifyListeners();
    if (kDebugMode) {
      print("hi");
    }
    var response = await http.get(Uri.parse(baseurl));

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      _imagedata = storeapimodelFromJson(response.body);
      _isloading = false;
      notifyListeners();
    } else {
      if (kDebugMode) {
        print("error");
      }
    }
  }
}
