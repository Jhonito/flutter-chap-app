import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController =  TextEditingController();
  final _focusNode =  FocusNode();
  bool _estaEscribiendo = false;
  List<ChatMessage> _messages = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              maxRadius: 12,
              child: const Text('Te', style: TextStyle(fontSize: 12,color: Colors.white),),
              backgroundColor: Colors.blue[900],
            ),
            const SizedBox(height: 3,),
            const Text('Jonathan Flores', style: const TextStyle(color: Colors.black87,fontSize: 12),)
        ],),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (context ,index) => _messages[index],
                reverse: true,
                )),
            const Divider(height: 1,),
            Container(
              child:_inputChat(), 
              color: Colors.white,
            )

        ],)
      ),
    );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,

                
                onChanged: (String texto){
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                    
                    
                    ;
                  });

                },
                decoration: const InputDecoration.collapsed(
                  hintText: 'Enviar Mensaje'
                ),
                focusNode: _focusNode ,
              )
            ),
            //Boton de enviar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: !Platform.isIOS
                ? CupertinoButton(
                  child: const Text('Enviar'), 
                  onPressed:  _estaEscribiendo 
                         ? () => _handleSubmit(_textController.text.trim()) 
                         : null,
                  ) 
                  : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconTheme(
                      data: IconThemeData(color: Colors.blue[400]),
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: const Icon(Icons.send,),
                        onPressed:
                         _estaEscribiendo 
                         ? () => _handleSubmit(_textController.text.trim()) 
                         : null,
                      ),
                    ),
                  ) ,
            )

          ],
        ),
      )
    );


  }

  _handleSubmit(String texto) {
    if(texto.length == 0 ) return;
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();
   

    final newMesage = new ChatMessage(
      texto: texto, 
      uid: '1233', 
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 400)),);
    _messages.insert(0,newMesage);
    newMesage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });

   
  }
  @override
  void dispose() {
    // TODO: off del socket
    for(ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}