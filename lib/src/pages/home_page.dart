import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // print(menuProvider.options);
    //  menuProvider.cargarData()

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _createListItem(snapshot.data,context),
        );
      },
    );
  }

  List<Widget> _createListItem(List<dynamic> data,BuildContext context) {
    final List<Widget> list = [];

    if(data==null){return [];}

    data.forEach((opt) {
      final widget = ListTile(
        title: Text(opt["texto"]),
        leading: getIcon(opt["icon"]),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
        ),
        onTap: () {
          Navigator.pushNamed(context, opt["ruta"]);
        },
      );

      list..add(widget)..add(Divider());
    });

    return list;
  }
}
