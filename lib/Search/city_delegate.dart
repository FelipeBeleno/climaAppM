import 'package:flutter/material.dart';

class CitySeachDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [Text('data')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw Text('data');
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw Text('data');
  }
}
