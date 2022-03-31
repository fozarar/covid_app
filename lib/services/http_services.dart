import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/response_model.dart';

class HttpServices {
  Future<Global?> getGlobalData() async {
    final url = Uri.parse('https://api.covid19api.com/summary#');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final extractedData = json.decode(response.body);

        Global globalModel = Global.fromJson(extractedData);
        return globalModel;
      } else {
        throw Exception('hata');
      }
    } catch (e) {
      e.toString();
      return null;
    }
  }

  Future<List<Countries>?> getCountryData() async {
    final url = Uri.parse('https://api.covid19api.com/summary#');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final extractedData = json.decode(response.body);
        List<Countries> countries = [];
        for (var i in extractedData['Countries']) {
          countries.add(Countries.fromJson(i));
        }

        return countries;
      } else {
        throw Exception('hata');
      }
    } catch (e) {
      e.toString();
      return null;
    }
  }
}
