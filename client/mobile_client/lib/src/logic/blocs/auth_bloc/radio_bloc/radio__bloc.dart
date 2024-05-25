import 'dart:async';

import 'package:flutter_amazon_clone_bloc/src/logic/blocs/auth_bloc/radio_bloc/radio_bloc.dart';

class RadioBloc_ {
  // ignore: prefer_typing_uninitialized_variables
  var state;

  // tạo 2 controller
  // 1 cái quản lý event, đảm nhận nhiệm vụ nhận event từ UI
  final eventController = StreamController<RadioEvent>();

  // 1 cái quản lý state, đảm nhận nhiệm vụ truyền state đến UI
  final stateController = StreamController<RadioState>();

  RadioBloc_() {
    // lắng nghe khi eventController push event mới
    eventController.stream.listen((RadioEvent event) {
      if (event is RadioChangedEvent) {
        if (event.auth == Auth.signIn) {
          state = const RadioSignInState(auth: Auth.signIn);
        } else {
          state = const RadioSignUpState(auth: Auth.signUp);
        }
      }
      // emit state: add state mới vào stateController để bên UI nhận được
      stateController.sink.add(state);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
