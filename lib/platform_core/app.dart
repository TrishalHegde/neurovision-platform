import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart';
import 'session_controller.dart';
import '../shared/accessibility/accessibility_theme.dart';

class NeuroVisionApp extends StatelessWidget {
  const NeuroVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionController>(
      builder: (context, session, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AccessibilityTheme.build(
            fontScale: session.fontScale,
          ),
          home: const AppRouter(),
        );
      },
    );
  }
}