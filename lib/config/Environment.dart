enum BuildVariant { main }

class Environment {
  Environment._internal(BuildVariant buildVariant) {
    _buildVariant = buildVariant;
    switch (_buildVariant) {
      case BuildVariant.main:
        baseApiUrl = 'https://rickandmortyapi.com/api';
        break;
    }
  }

  factory Environment.init(BuildVariant buildVariant) {
    _instance = Environment._internal(buildVariant);
    return _instance!;
  }

  static Environment? _instance;
  static Environment get instance {
    if (_instance == null)
      throw Exception('You should init Environment before get instance');
    return _instance!;
  }

  late final BuildVariant _buildVariant;
  BuildVariant get buildVariant => _buildVariant;

  late final String baseApiUrl;
}
