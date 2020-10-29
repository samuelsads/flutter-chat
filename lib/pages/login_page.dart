import 'package:chat/widgets/blue_botton.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/custom_logo.dart';
import 'package:chat/widgets/label.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height *0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomLogo(
                    image: AssetImage('assets/tag-logo.png'),
                    text: 'Messenger'),
                _FormState(),
                Label(
                  path: 'register',
                  question: '¿No tienes cuenta?',
                  pathText: 'Crea una cuenta ahora!',
                ),
                Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FormState extends StatefulWidget {
  @override
  __FormStateState createState() => __FormStateState();
}

class __FormStateState extends State<_FormState> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.mail_outline,
          placeHolder: 'Email',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),
        CustomInput(
          icon: Icons.lock_outline,
          placeHolder: 'Password',
          textController: passCtrl,
          isPassword: true,
        ),
        //TODO: CREAR BOTON
        BlueBotton(
          text: 'Ingrese',
          onPressed: () {
            print(emailCtrl.text);
            print(passCtrl.text);
          },
        ),
      ]),
    );
  }
}
