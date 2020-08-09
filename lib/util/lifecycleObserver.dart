import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class LifecycleObserver with WidgetsBindingObserver {
  final void Function(AppLifecycleState) onStateChanged;

  LifecycleObserver(this.onStateChanged);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("Changing state to $state");
    onStateChanged(state);
  }
}

Stream<AppLifecycleState> lifecyclesStates() {
  var subject =
      BehaviorSubject<AppLifecycleState>.seeded(AppLifecycleState.resumed);
  var observer = LifecycleObserver((state) => {subject.sink.add(state)});
  return subject.doOnListen(() {
    WidgetsBinding.instance.addObserver(observer);
  }).doOnDone(() {
    WidgetsBinding.instance.removeObserver(observer);
    subject.close();
  });
}