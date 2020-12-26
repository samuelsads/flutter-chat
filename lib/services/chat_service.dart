import 'package:chat/global/environment.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class ChatService with ChangeNotifier{
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioId) async{
    final resp = await http.get('${ Environment.apiUrl}/mensajes/$usuarioId',
    headers: {
      'Content-type':'application/json',
      'x-token': await AuthService.getToken()
    });

    final mensajesResp = mensajesResponseFromJson(resp.body);
    return mensajesResp.mensajes;
  }
}