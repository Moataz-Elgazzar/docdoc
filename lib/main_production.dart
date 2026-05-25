import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/extension/extention.dart';
import 'package:docdoc/core/helper/shared_preferences_helper.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  final isLoggedInUser = await checkUserInLogin();
  runApp(MainApp(isLoggedInUser: isLoggedInUser));
}

class MainApp extends StatelessWidget {
  final bool isLoggedInUser;
  const MainApp({super.key, required this.isLoggedInUser});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(routerConfig: Routes.route(isLoggedInUser), debugShowCheckedModeBanner: false, theme: AppThemes.lightTheme),
    );
  }
}

Future<bool> checkUserInLogin() async {
  final String? userToken = SharedPreferencesHelper.getData<String>(SharedPrefKeys.kUserToken);
  return !userToken.isNullOrEmptyty();
}
