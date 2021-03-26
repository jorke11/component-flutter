import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar apge"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://media.metrolatam.com/2019/07/24/stanlee-81c12a5bdc6a425c462a011af6d51267-1200x600.jpg"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage("assets/original.gif"),
            image: NetworkImage(
                "https://media.metrolatam.com/2019/07/24/stanlee-81c12a5bdc6a425c462a011af6d51267-1200x600.jpg"),
                fadeInDuration: Duration(milliseconds: 100),),
      ),
    );
  }
}
