import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NetworkState { initial, connected, disconnected }

class InternetConnectionCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();

  StreamSubscription? connectionSubscription;
  InternetConnectionCubit() : super(NetworkState.initial) {
    connectionSubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(NetworkState.connected);
      } else {
        emit(NetworkState.disconnected);
      }
    });
  }

  @override
  Future<void> close() {
    connectionSubscription?.cancel();
    return super.close();
  }
}
