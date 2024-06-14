import 'package:flutter/material.dart';

import 'appRouter.dart';

void main() {
  runApp( Hospital(app_router: App_Router(),));
}

class Hospital extends StatelessWidget {
  const Hospital({super.key, required this.app_router});
  final App_Router app_router;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: app_router.generateRoute,

    );
  }
}