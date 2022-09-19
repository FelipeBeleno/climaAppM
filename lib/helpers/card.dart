import 'package:clima_app/models/current_response.dart';
import 'package:clima_app/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appProvider = Provider.of<AppProvider>(context);

    return FutureBuilder(
      future: appProvider.getCityCurrent(),
      builder: (_, AsyncSnapshot<CurrentResponse> snapshot) {
        if (!snapshot.hasData) {
          return Text('data');
        }
        final CurrentResponse current = snapshot.data!;

        return ContentCard(size: size, data: current);
      },
    );
  }
}

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key, required this.size, required this.data})
      : super(key: key);

  final CurrentResponse data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    final now = DateTime.now();

    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Stack(
        //      fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: now.hour > 18 ? Colors.blueGrey[400] : Colors.amber,
              height: size.height * 0.5,
              width: size.width * 0.7,
            ),
          ),
          Positioned(
            left: -40,
            top: -40,
            child: Container(
                height: 100,
                width: 100,
                // color: Colors.amber,
                child: FadeInImage(
                  height: 200,
                  width: 200,
                  image: NetworkImage(appProvider.urlIcon),
                  placeholder: const AssetImage('assets/loading.gif'),
                )),
          ),
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  data.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Actual \n${data.main.temp}°",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Actual \n${data.main.tempMax}°",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Minima \n${data.main.tempMin}°",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Humedad \n${data.main.humidity}%",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
