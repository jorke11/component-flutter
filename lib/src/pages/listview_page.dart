import 'dart:async';

import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  ListviewPage({Key key}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumero = new List();
  int _ultimoItem = 0;
  bool _isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });

    _agregar10();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listas")),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumero.length,
          itemBuilder: (_, index) {
            final imagen = _listaNumero[index];
            return FadeInImage(
                placeholder: AssetImage("assets/original.gif"),
                image: NetworkImage(
                    "https://i.picsum.photos/id/$imagen/500/400.jpg"));
          }),
    );
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumero.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isloading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);

    new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isloading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isloading) {
      return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()],
            ),
            SizedBox(
              height: 15,
            )
          ]);
    } else {
      return Container();
    }
  }

  Future<Null> obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumero.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}
