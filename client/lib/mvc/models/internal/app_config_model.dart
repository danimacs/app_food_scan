class AppConfigModel {
  final Map<String, dynamic> _config;

  static const tableName = 'APP_CONFIG';

  static const keyColumn = 'KEY';
  static const valueColumn = 'VALUE';

  AppConfigModel(this._config);

  dynamic getValue(String key) {
    return _config[key];
  }

  @override
  String toString() {
    return 'AppConfigModel{_config: $_config}';
  }
}
