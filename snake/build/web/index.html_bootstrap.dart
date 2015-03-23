library app_bootstrap;

import 'package:polymer/polymer.dart';

import 'main.dart' as i0;
import 'package:polymer/src/build/log_injector.dart';
import 'package:smoke/smoke.dart' show Declaration, PROPERTY, METHOD;
import 'package:smoke/static.dart' show useGeneratedCode, StaticConfiguration;

void main() {
  useGeneratedCode(new StaticConfiguration(
      checkedMode: false));
  new LogInjector().injectLogsFromUrl('index.html._buildLogs');
  configureForDeployment([]);
  i0.main();
}
