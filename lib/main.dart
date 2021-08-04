import 'package:flutter/material.dart';
import 'map_screen.dart';
import 'constraints.dart';
import 'package:provider/provider.dart';
import 'weather_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherBrain(),
      child: MaterialApp(
        theme: _kAppTheme,
        home: const MapScreen(),
        //home: Test(),
      ),
    );
  }
}

ThemeData _kAppTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kcOrange,
      onPrimary: Colors.white,
    ),
    cardTheme: _buildCardTheme(base.cardTheme),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buildEleButtonStyle(),
    ),
    iconTheme: _buildIconTheme(base.iconTheme),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}

ButtonStyle _buildEleButtonStyle() {
  return ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: kcOrange,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
  );
}

CardTheme _buildCardTheme(CardTheme base) {
  return base.copyWith(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
  );
}

IconThemeData _buildIconTheme(IconThemeData base) {
  return base.copyWith(color: kcOrange);
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline4: base.headline4!.copyWith(fontWeight: FontWeight.w500),
        // History
        headline5: base.headline5!.copyWith(fontWeight: FontWeight.w500),
        // 気温の単位、地名
        headline6: base.headline6!.copyWith(fontWeight: FontWeight.w500),
        // 各値
        subtitle1: base.subtitle1!.copyWith(color: kcSmallText), // 項目の名前、補足事項
        subtitle2: base.subtitle2!.copyWith(color: kcOrange), // 項目の名前、補足事項
        bodyText1: base.bodyText1!.copyWith(color: kcLargeText),
        bodyText2: base.bodyText2!.copyWith(color: kcSmallText),
      )
      .apply(displayColor: kcLargeText);
}
