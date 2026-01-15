import 'package:first_project/core/route/Genaral_Controler/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

import 'core/route/defiency_injection/defiency_injection.dart';
import 'core/route/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserLocationController());
  DependencyInjection.bindings();
  runApp(DevicePreview(enabled: true, builder: (context) => Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoute.slashscreen,
          getPages: AppRoute.mypage,
        );
      },
    );
  }
}
