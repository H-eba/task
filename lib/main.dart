import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/my_app.dart';

import 'core/DI/di.dart';
import 'core/api_manager/api_manager.dart';
import 'core/my_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ApiManager.init();
  configureDependencies();
  runApp(

    MyApp()
  );
}


