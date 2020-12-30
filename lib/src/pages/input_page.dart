import 'package:flutter/material.dart';
import 'package:flutter/src/material/dropdown.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '', _email = '', _fecha = '', _opcionSelected = 'marcela';
  List<String> _prost = ['marcela', 'sheyli', 'alexa', 'beatriz', 'dayla'];
  TextEditingController _inputdatecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas macho'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'escriba su nombre malparido',
        labelText: 'Nombre',
        helperText: 'no escriba apellido',
        suffixIcon: Icon(
          Icons.star,
          color: Colors.deepPurple,
        ),
        icon: Icon(
          Icons.accessible_forward,
          color: Colors.green[500],
        ),
      ),
      onChanged: (valor) {
        _nombre = valor;
        setState(() {
          print(_nombre);
        });
      },
    );
  }

  _crearPersona() {
    return ListTile(
      title: Text('el nombre del weon es $_nombre'),
      subtitle: Text('el correo es: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Email',
          labelText: 'dele',
          suffixIcon: Icon(
            Icons.alternate_email,
            color: Colors.deepPurple,
          ),
          icon: Icon(
            Icons.email,
            color: Colors.green[500],
          ),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
              print(_email);
            }));
  }

  Widget _crearPass() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Contra',
          labelText: 'Password',
          suffixIcon: Icon(
            Icons.lock,
            color: Colors.deepPurple,
          ),
          icon: Icon(
            Icons.lock_open,
            color: Colors.green[500],
          ),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
              print(_email);
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputdatecontroller,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha',
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Colors.deepPurple,
        ),
        icon: Icon(
          Icons.perm_contact_calendar,
          color: Colors.green[500],
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputdatecontroller.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptDrop() {
    List<DropdownMenuItem<String>> lista = new List(); 
    _prost.forEach((pro) {
      lista.add(DropdownMenuItem(
        child: Text(pro),
        value: pro,
      ));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return DropdownButton(
      value: _opcionSelected,
      items: getOptDrop(),
      onChanged: (opt) {
        setState(() {
          _opcionSelected = opt;
        });
      },
    );
  }
}
