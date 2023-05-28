import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'config/routes.dart';
import 'config/theme.dart';
import 'data/product_dao.dart';
import 'enum/app_route.dart';
import 'mvc/controllers/product_controller.dart';
import 'providers/database_provider.dart';
import 'service/product_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await DatabaseProvider.setupDatabase();

  // DatabaseProvider
  GetIt.I.registerLazySingleton<DatabaseProvider>(() => DatabaseProvider(database));
  // DAOs
  GetIt.I.registerLazySingleton<ProductDAO>(() => ProductDAO(GetIt.I<DatabaseProvider>()));
  // Services
  GetIt.I.registerLazySingleton<ProductService>(() => ProductService(GetIt.I<ProductDAO>()));
  // ProductController
  GetIt.I.registerLazySingleton<ProductController>(() => ProductController(GetIt.I<ProductService>()));

  runApp(ChangeNotifierProvider(
    create: (context) => GetIt.I<ProductController>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      routes: myRoutes,
      initialRoute: AppRoute.home.name,
    );
  }
}
