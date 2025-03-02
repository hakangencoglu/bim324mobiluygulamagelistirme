
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class H4StatefulWidget extends StatefulWidget{
  @override
  H4SWState createState() => H4SWState();
}

class H4SWState extends State<H4StatefulWidget>{
  int a=0;
  void artirmaFonksionu(){
    setState(() {
      a++;
    });
  }
  @override
  Widget build(BuildContext con){
    return Scaffold(
      appBar: AppBar(
        title: Text("Statfull Widget Örneği"),
      ),
      body: Container(
        child: Row(
          children:<Widget>[
            Column(
              children: [
              Text("Mwtin Yazılan Kısım $a"),
              ElevatedButton(
                onPressed: artirmaFonksionu,
                child: Text("Buttonun Adı"),
              ),
        ],
            ),
            Column(
                children: [
                  Text("Metin Yazılan kısım 2"),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Button2 nin Adı"),
                  ),
                ]
            ),

          ],
        ),
      ),

    );
  }
}
