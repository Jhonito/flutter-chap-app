import 'package:chat/widgets/boton_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/label.dart';
import 'package:chat/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(titulo: 'Inicio',),
              _Form(),
              Labels(ruta: 'register', text: 'Crea una ahora!', subtext: 'no tienes cuenta?',),
              Text('Términos y Condiciones')
            
            
            ],
          ),
        ),
      )
    
    );
  }
}



class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline, 
            keyboardType: TextInputType.emailAddress, 
            placeholder: 'correo', 
            textController: emailCtrl ,
          ),
          CustomInput(
            icon: Icons.lock_outline_rounded, 
            keyboardType: TextInputType.visiblePassword, 
            placeholder: 'Contraseña', 
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
            text: 'Ingrese',
            onPressed: (){
              print(emailCtrl.text);
              print(passCtrl.text);
            }, 
          ),
         
        ],
      ),
    );
  }
}

