import 'package:chat_app_supabase/auth/login_screen.dart';
import 'package:chat_app_supabase/config/theme/theme_change.dart';
import 'package:chat_app_supabase/provider/auth/auth_provider.dart';
import 'package:chat_app_supabase/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/constants/colors.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://ytmpzxfyepvadjufuxes.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl0bXB6eGZ5ZXB2YWRqdWZ1eGVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE4MDc0NjksImV4cCI6MjA0NzM4MzQ2OX0.VJbrDfDGzhUs-REPv_kmHp7nMH4zYenVRnbGuXqw4Ss',
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeChange(ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor: bgColor,
                primarySwatch: Colors.blue,
                textTheme: const TextTheme(
                    bodyMedium: TextStyle(color: Colors.black54)),
                fontFamily: "Gordita"))),
        ChangeNotifierProvider(create: (_) {
          AuthProvider();
        })
      ],
      child: const ThemeWrapaper(),
    );
  }
}

class ThemeWrapaper extends StatelessWidget {
  const ThemeWrapaper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatApp(),
    );
  }
}
