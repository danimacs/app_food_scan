import 'package:app_food_scan/service/app_config_service.dart';
import 'package:uuid/uuid.dart';

import '../../enum/app_config_enum.dart';
import '../../service/startup_service.dart';

class StartupController {
  final StartupService startupService;
  final AppConfigService appConfigService;

  StartupController(this.startupService, this.appConfigService);

  Future<void> startup() async {
    if (await startupService.isFirstLaunch()) {
      generateUUID();
      startupService.negateFirstLaunch();
    }
  }

  void generateUUID() {
    const uuid = Uuid();
    final uniqueId = uuid.v4();
    appConfigService.create(AppConfigEnum.idDevice.name, uniqueId);
  }
}
