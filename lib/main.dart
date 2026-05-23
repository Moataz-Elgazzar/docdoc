import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(routerConfig: Routes.route, debugShowCheckedModeBanner: false, theme: AppThemes.lightTheme),
    );
  }
}
