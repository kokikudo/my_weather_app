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
        home: MapScreen(),
      ),
    );
  }
}

ThemeData _kAppTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
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
//final ThemeData _kShrineTheme = _buildShrineTheme();
//
// IconThemeData _customIconTheme(IconThemeData original) {
//   return original.copyWith(color: kShrineBrown900);
// }
//
// // テーマをここで一気に定義
// ThemeData _buildShrineTheme() {
//   // ライトテーマをコピーし上書きしたテーマを返す
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//     // colorScheme; マテリアルデザインの仕様に適合したカラーの集まり
//     colorScheme: base.colorScheme.copyWith(
//       primary: kShrinePink100,
//       primaryVariant: kShrineBrown900,
//       onPrimary: kShrineBrown900,
//       secondary: kShrineBrown900,
//       error: kShrineErrorRed,
//     ),
//     // AppBarの子Widgetのテーマの状態を保持しないようにする。
//     // trueにするとデフォルトのAppBarの状態になる。
//     appBarTheme: base.appBarTheme.copyWith(
//       backwardsCompatibility: false,
//     ),
//     // 関数_buildShrineTextThemeにtextThemeを渡してアプリで使うテキストを更新
//     textTheme: _buildShrineTextTheme(base.textTheme),
//     primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
//     textSelectionTheme: TextSelectionThemeData(
//       selectionColor: kShrinePink100,
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       focusedBorder: CutCornersBorder(
//         borderSide: BorderSide(
//           width: 2.0,
//           color: kShrineBrown900,
//         ),
//       ),
//       border: CutCornersBorder(), // デフォルトで用意されてたクラス。四隅の角を直線上に切り取る
//     ),
//   );
// }
//
// //　見出しや本文などを変更
// TextTheme _buildShrineTextTheme(TextTheme base) {
//   return base
//       .copyWith(
//         headline5: base.headline5!.copyWith(
//           fontWeight: FontWeight.w500,
//         ),
//         headline6: base.headline6!.copyWith(fontSize: 18.0),
//         caption: base.caption!.copyWith(
//           fontWeight: FontWeight.w400,
//           fontSize: 14.0,
//         ),
//         bodyText1: base.bodyText1!.copyWith(
//           fontWeight: FontWeight.w500,
//           fontSize: 16.0,
//         ),
//       )
//       // 変更した箇所のみにフォントを適用する
//       .apply(
//         fontFamily: 'Rubik',
//         displayColor: kShrineBrown900, // headline1~4,captionが対象
//         bodyColor: kShrineBrown900, // それ以外のテキストが対象
//       );
// }
