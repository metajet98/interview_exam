import 'package:flutter/material.dart';
import 'package:interview_exam/app.dart';
import 'package:interview_exam/repositories/auth_repository.dart';
import 'package:interview_exam/repositories/local_storage_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_exam/repositories/post_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupDI();
  // need await to setup core element (read files, setup local storage)
  await Future.wait([
    GetIt.I<LocalStorageRepository>().initialize(),
    GetIt.I<AuthRepository>().readDataFromAsset(),
    GetIt.I<PostRepository>().readDataFromAsset(),
  ]);
  runApp(const App());
}

void _setupDI() {
  final getIt = GetIt.instance;
  getIt.registerSingleton(LocalStorageRepository());
  getIt.registerSingleton(AuthRepository());
  getIt.registerSingleton(PostRepository());
}
