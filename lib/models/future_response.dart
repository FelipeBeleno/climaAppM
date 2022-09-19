// To parse this JSON data, do
//
//     final futureResponse = futureResponseFromMap(jsonString);

import 'dart:convert';

class FutureResponse {
  FutureResponse({
    required this.city,
    required this.code,
    required this.message,
    required this.cnt,
    required this.list,
  });

  City city;
  String code;
  double message;
  int cnt;
  List<ListElement> list;

  factory FutureResponse.fromJson(String str) =>
      FutureResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FutureResponse.fromMap(Map<String, dynamic> json) => FutureResponse(
        city: City.fromMap(json["city"]),
        code: json["code"],
        message: json["message"].toDouble(),
        cnt: json["cnt"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "city": city.toMap(),
        "code": code,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toMap())),
      };
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromMap(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "coord": coord.toMap(),
        "country": country,
        "population": population,
        "timezone": timezone,
      };
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(String str) => Coord.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lon": lon,
        "lat": lat,
      };
}

class ListElement {
  ListElement({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.clouds,
    required this.rain,
  });

  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  List<Weather> weather;
  double speed;
  int deg;
  int clouds;
  double rain;

  factory ListElement.fromJson(String str) =>
      ListElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: Temp.fromMap(json["temp"]),
        feelsLike: FeelsLike.fromMap(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
        speed: json["speed"].toDouble(),
        deg: json["deg"],
        clouds: json["clouds"],
        rain: json["rain"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp.toMap(),
        "feels_like": feelsLike.toMap(),
        "pressure": pressure,
        "humidity": humidity,
        "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
        "speed": speed,
        "deg": deg,
        "clouds": clouds,
        "rain": rain,
      };
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double night;
  double eve;
  double morn;

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"].toDouble(),
        min: json["min"].toDouble(),
        max: json["max"].toDouble(),
        night: json["night"].toDouble(),
        eve: json["eve"].toDouble(),
        morn: json["morn"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  Main main;
  Description description;
  Icon icon;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

enum Description { LIGHT_RAIN, MODERATE_RAIN }

final descriptionValues = {
  "light rain": Description.LIGHT_RAIN,
  "moderate rain": Description.MODERATE_RAIN
};

enum Icon { THE_10_D }

final iconValues = {"10d": Icon.THE_10_D};

enum Main { RAIN }

final mainValues = {"Rain": Main.RAIN};
