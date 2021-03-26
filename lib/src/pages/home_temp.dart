import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {
  
  final options=['uno','dos','tres','cuatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: ListView(
        children: _createItemShort()
      ),
    );
  }

  List<Widget> _createItems(){

    List<Widget> list=new List<Widget>();

    for (String item in options) {
      final row = ListTile(
        title: Text(item),
      );
      list..add(row)
      ..add(Divider());
      
    }

    return list;
  }

  List<Widget> _createItemShort(){
    return options.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text("test"),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
