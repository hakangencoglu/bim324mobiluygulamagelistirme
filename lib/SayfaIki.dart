import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SayfaIki extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasyon Örneği"),
      ),
      body: Container(
        child: ElevatedButton(
            onPressed: ()=>{
              Navigator.pop(context),
            },
            child: Text("Geri Dön!!")
        ),
      ),
    );
  }
}