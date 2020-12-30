import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wenos dias'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaitmes(snapshot.data, context),
        );
      },
    );

    /* return ListView(
      children: _listaitmes(),
    ); */
  }

  List<Widget> _listaitmes(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    
    data.forEach((opt) {
      final widgetTemp = ListTile( 
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());
     });
     return opciones;
  }
}
