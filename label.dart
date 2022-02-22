import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({Key? key, required this.ruta, required this.text, required this.subtext}) : super(key: key);
final String text;
final String subtext;
final String ruta;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.subtext,style: TextStyle(color: Colors.black54,fontSize: 15,fontWeight: FontWeight.w400),),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context,this.ruta);
            },
            child: Text(this.text,style: TextStyle(color: Colors.blue,fontSize: 18),)),
          SizedBox(height: 10,),
         
        ],
      ),
    );
  }
}