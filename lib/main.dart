import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'src/app/app.dart';
import 'src/app/app_module.dart';

void main() async {
  // ###################  PARSE SERVER FUNCTIONS ##############################

  WidgetsFlutterBinding.ensureInitialized();

  final keyApplicationId = '0Gi3NSxdGbl32WhRCVTErJCjnXYYeTwH40AJjIXc';
  final keyClientKey = 'ZVzkDOCQ8eaPUtfQRIjqMTuqGTej9KXL58777Q7r';
  final keyParseServerUrl = 'https://parseapi.back4app.com/parse/';

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    debug: true,
  );

  // #################### END PARSE SERVER FUNCTIONS #########################

  runApp(ModularApp(module: AppModule(), child: App()));
}
