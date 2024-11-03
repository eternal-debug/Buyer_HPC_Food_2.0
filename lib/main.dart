import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter/services.dart';
import 'package:hpc_food/constants/constants.dart';
import 'package:hpc_food/views/entrypoint.dart';

Widget defaultHome = MainScreen();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HPC Food',
          theme: ThemeData(
            scaffoldBackgroundColor: cOffWhite,
            iconTheme: const IconThemeData(color: cDark),
            primaryColor: Colors.grey,
            appBarTheme: const AppBarTheme(centerTitle: true),
          ),
          home: defaultHome,
        );
      },
    );
  }
}
