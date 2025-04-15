import 'package:bim324mobiluygulamagelistirme/AppDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SayfaIki.dart';

class SayfaBir extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasyon Örneği"),
      ) ,
      drawer: const AppDrawer(),
          /*
      Drawer(
        child:
        ListView(
          children: [
            DrawerHeader(
              child: Text('Sayfalar'),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Birinci Sayfa'),
              onTap: ()=>{
                Navigator.pushNamed(
                    context, '/'
                ),
              },
            ),
            ListTile(
              title: Text('İkinci Sayfa'),
              onTap: ()=>{
                Navigator.pushNamed(
                    context, '/iki'
                ),
              },
            ),
          ],
        ),
      ),
      */


      body:
      Container(
        child: ElevatedButton(
          onPressed: () => {
            Navigator.pushNamed(context,
                '/iki'),
            /*Navigator.push(context, '/iki'
              MaterialPageRoute(
              builder: (context)
               => SayfaIki()
                ),
               ),*/
          },
          child: Text("İkinci Sayfaya Geç"),
        ),
      ),



    );
  }
}