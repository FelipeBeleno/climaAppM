import 'package:clima_app/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListHorizontal extends StatelessWidget {
  const ListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    final hora = DateTime.now();

    return FutureBuilder(
      future: appProvider.getFutureRespose(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dynamic data = snapshot.data;

          return Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.list.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 3000,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: hora.hour < 18
                          ? Colors.amberAccent
                          : Colors.blueAccent,
                    ),
                    child: ColumnContainer(data: data.list[index]));
              },
            ),
          );
        }
        return Text('data');
      },
    );
  }
}

class ColumnContainer extends StatelessWidget {
  const ColumnContainer({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    DateTime fecha = DateTime.fromMillisecondsSinceEpoch(data.dt * 1000);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeInImage(
          height: 50,
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              "https://openweathermap.org/img/wn/${data.weather[0].icon}@2x.png"),
        ),
        Text("${fecha.day}/${fecha.month}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Max\n${data.temp.max}°\nMin\n${data.temp.min}°",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }
}
