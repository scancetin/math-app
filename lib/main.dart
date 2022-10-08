import 'package:flutter/material.dart';
import 'package:math_quiz_arch/models/question.dart';
import 'package:math_quiz_arch/screens/game_screen.dart';
import 'package:math_quiz_arch/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSimplePrefs.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Question()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: GameScreen(),
    );
  }
}
