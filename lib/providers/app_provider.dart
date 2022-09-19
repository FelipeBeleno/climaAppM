import 'package:clima_app/models/current_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class AppProvider extends ChangeNotifier {
  final cityActual = 'bogota';
  final apiKey = 'ae84ccab5d1b43a7bc72b33ce2cc7f32';
  final metrics = 'metric';
  final url = 'api.openweathermap.org';
  String urlIcon = '';
  final iconData = '';
  final List<double> latLong = [];

  final List<CurrentResponse> currentData = [];

  AppProvider() {
    getStarter();
  }

  getStarter() {
    print('hola');
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

    //final d = new DateTime(1663002000);
    //print(d);
    return body;
  }
}
