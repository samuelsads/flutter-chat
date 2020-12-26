import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authServices = Provider.of<AuthService>(context, listen: false);
    final socketServices = Provider.of<SocketServices>(context, listen: false);

    final autenticado = await authServices.isLoggedIn();

    socketServices.connect();
    //Navigator.pushReplacementNamed(context, 'usuarios');
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) =>
              (autenticado) ? UsuariosPage() : LoginPage(),
          transitionDuration: Duration(milliseconds: 0),
        ));
  }
}
