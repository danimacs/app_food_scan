import '../data/startup_dao.dart';

class StartupService {
  final StartupDAO startupDAO;

  StartupService(this.startupDAO);

  Future<bool> isFirstLaunch() async {
    return startupDAO.isFirstLaunch();
  }

  Future<void> negateFirstLaunch() async {
    startupDAO.negateFirstLaunch();
  }
}
