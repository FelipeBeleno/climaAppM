import 'dart:convert';

import 'package:clima_app/models/current_response.dart';
import 'package:clima_app/models/future_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AppProvider extends ChangeNotifier {
  final cityActual = 'bogota';
  final apiKey = 'ae84ccab5d1b43a7bc72b33ce2cc7f32';
  final metrics = 'metric';
  final url = 'api.openweathermap.org';
  final urlFuture = 'pro.openweathermap.org';
  String urlIcon = '';
  final iconData = '';
  final List<double> latLong = [];
  dynamic currentData = [];

  AppProvider() {
    getStarter();
  }

  getStarter() {}

  Future<FutureResponse> getFutureRespose() async {
//final d = new DateTime(1663002000);
    //print(d);

    // llamado api
    final dataURLFuture = Uri.http(urlFuture, 'data/2.5/forecast/climate', {
      'lat': latLong[0].toString(),
      'lon': latLong[1].toString(),
      'appid': apiKey,
      'units': 'metric'
    });

    final responseFuture = await http.get(dataURLFuture);

    final toJson = jsonDecode(responseFuture.body);

    FutureResponse map = FutureResponse.fromJson(toJson);
    return map;
  }

  Future<CurrentResponse> getCityCurrent() async {
    final dataURL = Uri.http(url, 'data/2.5/weather', {
      'q': cityActual,
      'appid': apiKey,
      'units': 'metric',
    });

    final response = await http.get(dataURL);

    final body = CurrentResponse.fromJson(response.body);

    urlIcon =
        'https://openweathermap.org/img/wn/${body.weather[0].icon}@2x.png';

    latLong.add(body.coord.lat);
    latLong.add(body.coord.lon);

    return body;
  }
}
