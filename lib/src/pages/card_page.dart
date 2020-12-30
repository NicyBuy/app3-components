import 'dart:ffi';

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page')
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_return),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.red),
            title: Text('soy el marica titulo de la tarjeta'),
            subtitle: Text('mambru se fue a la guerra ay que dolor que dolor que pena'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      /* clipBehavior: Clip.antiAlias,  ------ SI FUNCIONA ESTA MANERA -------
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), */
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://assets.website-files.com/5d315dd990eed30aa7ca5f8f/5d3d843acb7dfd63bcf37e29_tree-and-woodland-company-landscape.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 200.0,
            fit: BoxFit.cover
          ),
          /* Image(
            image: NetworkImage('https://assets.website-files.com/5d315dd990eed30aa7ca5f8f/5d3d843acb7dfd63bcf37e29_tree-and-woodland-company-landscape.jpg'),
          ), */
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('cualquier babosada')
            )
        ],
      ),
    );
    return Container( // ESTA FORMA ES MAS LARGA PERO AYUDO COMO PRACTICA DE NUEVOS CONOCIMIENTOS
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      )
    );
  }
}