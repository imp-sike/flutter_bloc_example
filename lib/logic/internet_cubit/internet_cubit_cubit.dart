import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/constants/enums.dart';

part 'internet_cubit_state.dart';

class InternetCubitCubit extends Cubit<InternetCubitState> {
  late StreamSubscription subscription;

  InternetCubitCubit() : super(InternetLoading()) {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (result == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      } else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) {
    emit(InternetConnected(connectionType: connectionType));
  }

  void emitInternetDisconnected() {
    emit(InternetDissconnected());
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }

}
