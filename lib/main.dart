import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapets/ui/pages/welcome.dart';
import 'package:snapets/ui/themes/theme.dart';
import 'package:snapets/helpers/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'SnapPet',
        theme: AppTheme.apptheme.copyWith(
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.route(),
        onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
        onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
        initialRoute: "SplashPage",
      
    );
  }
}
