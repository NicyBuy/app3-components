import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider=100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
              )
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Estructura',
      //divisions: 20,
      value: _valorSlider, 
      min: 10.0,
      max: 400.0,
      onChanged: (!_bloquearCheck) ? null : (valor){
        setState(() {
          _valorSlider = valor;
          
        });
      }
      );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://i.ytimg.com/vi/sFbt7Icd9RI/maxresdefault.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
      );
  }

  Widget _checkBox() {
    //return Checkbox(  ----- Esta forma no llevria el title, solo es la cajita sin mas
    return CheckboxListTile(
      title: Text('Slider activado'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
      );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Slider activado'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
      );
  }
}