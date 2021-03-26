import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100;
  bool _bloquearcheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Container(
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _createCheckBox(),
              _createSwitch(),
              Expanded(child: _crearImage())
            ],
          ),
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la image',
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: _bloquearcheck
          ? null
          : (value) {
              _valorSlider = value;
              setState(() {});
            },
    );
  }

  Widget _crearImage() {
    return Image(
      image: NetworkImage(
          "https://upload.wikimedia.org/wikipedia/en/1/19/Batman_%28circa_2016%29.png"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //     value: _bloquearcheck,
    //     onChanged: (valor) {
    //       _bloquearcheck = valor;
    //       setState(() {});
    //     });

    return CheckboxListTile(
        title: Text("Bloquear slider"),
        value: _bloquearcheck,
        onChanged: (valor) {
          _bloquearcheck = valor;
          setState(() {});
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text("Bloquear slider"),
        value: _bloquearcheck,
        onChanged: (valor) {
          _bloquearcheck = valor;
          setState(() {});
        });
  }
}
