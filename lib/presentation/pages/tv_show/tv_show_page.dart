import 'package:flutter/material.dart';

class TvShowPage extends StatelessWidget {
  static const ROUTE_NAME = '/tv-show';

  const TvShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tv Show'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
