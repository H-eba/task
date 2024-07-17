import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/config/them/them.dart';
import 'package:task/core/utils/routes_manager.dart';
import 'package:task/presentation/products_Screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesManager.ProductsRouteName,

        routes: {
          RoutesManager.ProductsRouteName: (_) => ProductsScreen(),

        },
    theme: MyThem.lightTheme,
      ),
    );
  }
}
