import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyblocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(change.toString());
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    log('bloc: ${bloc.runtimeType}, close: $bloc');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log('bloc: ${bloc.runtimeType}, create: $bloc');
  }
}
