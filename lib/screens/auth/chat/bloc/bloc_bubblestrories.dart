import 'dart:async';

import 'package:dating_app/screens/auth/chat/models/people.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/base_event.dart';
 class BloCBubble extends Cubit<People>{
  BloCBubble() : super(People());
  StreamController<List<People>> _listBloCBubble = StreamController<List<People>>();

  Stream<List<People>> get listBloCBubble => _listBloCBubble.stream;

  List<People> peopless = [...dataPeoles];
  add(People people){
   _listBloCBubble.sink.add(peopless);
  }

  @override
  void dispose() {

    _listBloCBubble.close();
  }



}