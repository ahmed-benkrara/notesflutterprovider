import 'package:flutter/material.dart';
import 'package:notesprovider/providers/notesprovider.dart';
import 'package:notesprovider/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorSchemeSeed: Colors.amber[600],
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        home: HomeView(),
      )
    );
  }
}