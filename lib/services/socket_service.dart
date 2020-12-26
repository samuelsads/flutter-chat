import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting
}

class SocketServices with ChangeNotifier{
  IO.Socket _socket;
  ServerStatus _serverStatus = ServerStatus.Connecting;

  ServerStatus get serverStatus  => this._serverStatus;
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;



  void connect() async{
    // Dart client
    /** 
     this._socket = IO.io('http://192.168.1.77:3000/',{
      'transports':['websocket'],
      'autoConnect': true
    });
    */
    
  final token  = await AuthService.getToken();
  this._socket = IO.io('http://192.168.1.77:3000/',{
      'transports':['websocket'],
      'autoConnect': true,
      'forceNew':true,
      'extraHeaders':{
        'x-token':token
      }
    });

    this._socket.on('connect', (_) {
     this._serverStatus  = ServerStatus.Online;
     notifyListeners();
    });
    _socket.on('disconnect', (_) {
      this._serverStatus  = ServerStatus.Offline;
      notifyListeners();
    });

    this._socket.on('nuevo-mensaje',( payload ){
      print('nuevo-mensaje');
      print('Nombre:'+ payload['nombre']);
      print('Mensaje: '+ payload['mensaje']);
      print(payload.containsKey('mensaje2')?payload['mensaje2']:'no hay');
    });
  }

  void disconnect(){
    this.socket.disconnect();
  }

}