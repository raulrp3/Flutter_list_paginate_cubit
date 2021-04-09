import 'package:rick_morty_cubit/config/Environment.dart';
import 'package:rick_morty_cubit/config/ServiceLocator.dart';

class Config {
  static void setup(BuildVariant buildVariant) {
    Environment.init(buildVariant);
    ServiceLocator.setup(Environment.instance);
  }
}
