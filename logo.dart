import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String titulo;

  const Logo({Key? key, required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Container(
          child:Column(
            children: [
              Container(
                width: 240,
                child:
                  Image(image: AssetImage('assets/tag-logo1.png'))
              ),
              Text(this.titulo,style: TextStyle(fontSize: 30),)


            ],
          ) ,
        ),
      ),
    );
  }
}