import 'package:app_food_scan/mvc/controllers/product_allergen_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'config/routes.dart';
import 'config/theme.dart';
import 'data/app_config_dao.dart';
import 'data/product_dao.dart';
import 'data/startup_dao.dart';
import 'enum/app_route_enum.dart';
import 'mvc/controllers/allergen_controller.dart';
import 'mvc/controllers/app_config_controller.dart';
import 'mvc/controllers/product_controller.dart';
import 'mvc/controllers/report_controller.dart';
import 'mvc/controllers/startup_controller.dart';
import 'providers/database_provider.dart';
import 'service/allergen_service.dart';
import 'service/app_config_service.dart';
import 'service/product_allergen_type_service.dart';
import 'service/product_service.dart';
import 'service/report_service.dart';
import 'service/startup_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await DatabaseProvider.setupDatabase();
  setupDependencies(database);
  GetIt.I<StartupController>().startup();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductController>(
          create: (_) => GetIt.I<ProductController>(),
        ),
        ChangeNotifierProvider<ReportController>(
          create: (_) => GetIt.I<ReportController>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      routes: myRoutes,
      initialRoute: AppRouteEnum.home.name,
    );
  }
}

void setupDependencies(Database database) {
  // DatabaseProvider
  GetIt.I.registerLazySingleton<DatabaseProvider>(() => DatabaseProvider(database));
  // DAOs
  GetIt.I.registerLazySingleton<AppConfigDAO>(() => AppConfigDAO(GetIt.I<DatabaseProvider>()));
  GetIt.I.registerLazySingleton<StartupDAO>(() => StartupDAO(GetIt.I<DatabaseProvider>()));
  GetIt.I.registerLazySingleton<ProductDAO>(() => ProductDAO(GetIt.I<DatabaseProvider>()));
  // Services
  GetIt.I.registerLazySingleton<AppConfigService>(() => AppConfigService(GetIt.I<AppConfigDAO>()));
  GetIt.I.registerLazySingleton<StartupService>(() => StartupService(GetIt.I<StartupDAO>()));
  GetIt.I.registerLazySingleton<ProductService>(() => ProductService(GetIt.I<ProductDAO>()));
  GetIt.I.registerLazySingleton<AllergenService>(() => AllergenService());
  GetIt.I.registerLazySingleton<ProductAllergenTypeService>(() => ProductAllergenTypeService());
  GetIt.I.registerLazySingleton<ReportService>(() => ReportService());
  // ProductController
  GetIt.I.registerLazySingleton<AppConfigController>(() => AppConfigController(GetIt.I<AppConfigService>()));
  GetIt.I.registerLazySingleton<StartupController>(() => StartupController(GetIt.I<StartupService>(), GetIt.I<AppConfigService>()));
  GetIt.I.registerLazySingleton<ProductController>(() => ProductController(GetIt.I<ProductService>()));
  GetIt.I.registerLazySingleton<AllergenController>(() => AllergenController(GetIt.I<AllergenService>()));
  GetIt.I.registerLazySingleton<ProductAllergenTypeController>(() => ProductAllergenTypeController(GetIt.I<ProductAllergenTypeService>()));
  GetIt.I.registerLazySingleton<ReportController>(() => ReportController(GetIt.I<ReportService>(), GetIt.I<AppConfigService>()));
}
