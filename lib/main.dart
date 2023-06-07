import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/shared/binding/auth_binding.dart';
import 'src/utils/constants/route_name_constants.dart';
import 'src/utils/language/language.dart';
import 'src/utils/language/language_storage.dart';
import 'src/utils/routes/app_routes.dart';
import 'src/utils/themes/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String l1 = StorageData.getLanguageCode1(key: languageCode1Key);
    String l2 = StorageData.getLanguageCode1(key: languageCode2Key);

    return GetMaterialApp(
      title: 'Food Donate App',
      debugShowCheckedModeBanner: false,
      translations: LanguageTranslation(),
      locale: Locale(l1, l2),
      fallbackLocale: Locale(l1, l2),
      theme: AppTheme().light,
      initialRoute: AppRouteName.kPageSplash,
      initialBinding: AuthBinding(),
      getPages: AppRoutes.routes(),
    );
  }
}