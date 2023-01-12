import 'dart:async';

import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';

class SplashState {
  String navigateTo;
}

class StreamSplashPresenter implements SplashPresenter {
  final LoadCurrentAccount loadCurrentAccount;

  var _controller = StreamController<SplashState>.broadcast();
  var _state = SplashState();

  Stream<String> get navigateToStream =>
      _controller?.stream?.map((state) => state.navigateTo)?.distinct();

  StreamSplashPresenter({@required this.loadCurrentAccount});

  Future<void> checkAccount({int durationInSeconds = 2}) async {
    await Future.delayed(Duration(seconds: durationInSeconds));

    try {
      final account = await loadCurrentAccount.load();
      _state.navigateTo = account.isNull ? '/login' : '/surveys';
    } catch (error) {
      _state.navigateTo = '/login';
    }
  }

  void dispose() {
    _controller?.close();
    _controller = null;
  }
}
