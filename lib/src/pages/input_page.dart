import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = "", _email = "", _fecha = "",_optionSeleted='voloar';
  List<String> _poderes = ["valor","rayox x","super aliento"];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          counter: Text("Letras ${_name.length}"),
          hintText: "Nombre de la persona",
          labelText: "Nombre",
          helperText: "Solo es el nombre",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (text) {
        _name = text;
        setState(() {});
        print(_name);
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Mi nombre es ${_name}"),
      subtitle: Text("Mi correo es ${_email}"),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      // autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Email",
          labelText: "Email",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (text) {
        _email = text;
        setState(() {});
        print(_email);
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      // autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Password",
          labelText: "Password",
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (text) {
        _email = text;
        setState(() {});
        print(_email);
      },
    );
  }

  Widget _crearFecha(context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      // autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Fecha de nacimiento",
          labelText: "Fecha de nacimiento",
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picket = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale("es", 'ES'));

    if (picket != null) {
      setState(() {
        _fecha = picket.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptions(){
    List<DropdownMenuItem<String>> list = new List();

    _poderes.forEach((pod){

      list.add(DropdownMenuItem(
        child: Text(pod),
        value: pod,
      ));
    });

    return list;
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30,),
        DropdownButton(
          value: _optionSeleted,
          items: getOptions(), onChanged: (opt){
          print(opt);

          setState(() {
            _optionSeleted = opt;
          });

        }),
      ],
    );
  }
}
