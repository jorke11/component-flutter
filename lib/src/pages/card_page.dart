import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text("Titulo de tarjeta"),
          subtitle: Text(
              "Titulo de tarjeta asd a dasd asd asd asd asd asdas sad asd sad sadsad sad sad sad sad a"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(onPressed: () {}, child: Text("Cancelar")),
            FlatButton(onPressed: () {}, child: Text("Ok"))
          ],
        )
      ],
    ));
  }

  Widget _cardTipo2() {
    return Card(
      elevation: 9,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage("assets/original.gif"),
            image: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300,
            fit:BoxFit.cover
          ),

          // Image(
          //   image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/3/35/Neckertal_20150527-6384.jpg"),
          // ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("asda ad asd"),
          )
        ],
      ),
    );
  }
}
