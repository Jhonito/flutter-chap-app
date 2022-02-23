import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
   RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(uid: '1', nombre: 'Jhonito', email: 'jhonito@gmail.com', online: true, ),
    Usuario(uid: '2', nombre: 'Jhony', email: 'jhony@gmail.com', online: true, ),
    Usuario(uid: '3', nombre: 'Jonhaz', email: 'jonhaz@gmail.com', online: true, ),
    Usuario(uid: '4', nombre: 'Jhonatan', email: 'jhonatan@gmail.com', online: false, ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios',style: TextStyle(color: Colors.black54),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app,color: Colors.black54,),
          onPressed: (){}, 
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle, color:  Colors.blue[400],),
            // child: Icon(Icons.offline_bolt, color:  Colors.red[400],),
            
          )
        ],
          


      ),
      body: SmartRefresher(
        onRefresh: _cargarUsuarios,
        controller: _refreshController,
        child: _listViewUsuarios(),
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check,color: Colors.teal),
          waterDropColor: Colors.teal,
        ),
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuarios.length, 
      itemBuilder: (BuildContext context, int index) => _usuarioListTile(usuarios[index]),
      separatorBuilder: (BuildContext context, int index) =>
        Divider(),

      
      
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
        title: Text(usuario.nombre),
        subtitle: Text(usuario.email),
        leading: CircleAvatar(
          child: Text(usuario.nombre.substring(0,2)),
        ),
        trailing: Container(
          width: 10 ,
          height: 10,
          decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );
  }

  _cargarUsuarios() async{

    
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  


  }
}