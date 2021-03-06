import 'package:flutter/material.dart';
import 'package:flutter_proyecto_cicata/src/services/service.dart';
import 'package:flutter_proyecto_cicata/src/widgets/estacion.dart';
import 'package:provider/provider.dart';

class Tab1PageEstacion extends StatefulWidget {
  @override
  _Tab1PageEstacionState createState() => _Tab1PageEstacionState();
}

class _Tab1PageEstacionState extends State<Tab1PageEstacion>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
        body: Column(
      children: <Widget>[
        if (newsService.estacion.length > 0)
          Expanded(child: Estacion(newsService.estacion))
        else if (!newsService.isLoading)
          Expanded(child: Estacion(newsService.estacion)),
        if (newsService.isLoading)
          Expanded(
              child: Center(
            child: CircularProgressIndicator(),
          ))
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
