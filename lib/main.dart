import 'package:flutter/material.dart';
import 'package:i9trafego/src/services/user.service.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'src/app/app.dart';

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

  runApp(App());
}
