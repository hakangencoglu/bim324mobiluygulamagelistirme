
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class H5PopupTextField extends StatefulWidget{
  @override
  H5PTFState createState() => H5PTFState();
}

class H5PTFState extends State<H5PopupTextField>{
  TextEditingController textController = TextEditingController();

  void popupAc(){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert Dialog"),
            content: Column(
              children: [
                Text(
                  textController.text
                ),
              ],
            ) ,
            actions: [
              TextButton(
                  onPressed: (){},
                  child: Text("Text Butonu")
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Kapamak için Tıkla"),
              )
            ],
          );
        }
    );
  }

  @override

  Widget build(BuildContext context){
    return Column(
      children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: "Metin Giriniz",
          ),
        ),
        ElevatedButton(
            onPressed: popupAc,
            child: Text("Popup ı göster"),
        )


      ],
    );
  }
}