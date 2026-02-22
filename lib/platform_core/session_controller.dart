import 'package:flutter/material.dart';
import '../shared/supabase/supabase_client.dart';

enum AccessibilityMode { adhd, tactile }

class SessionController extends ChangeNotifier {
  String? userId;

  AccessibilityMode accessibilityMode = AccessibilityMode.adhd;
  double fontScale = 1.0;
  bool vibrationEnabled = false;

  bool initialized = false;

  Future<void> initializeSession() async {
    final session = supabase.auth.currentSession;

    if (session == null) {
      final response = await supabase.auth.signInAnonymously();
      userId = response.user?.id;
    } else {
      userId = session.user.id;
    }

    await _loadUserProfile();
    await _loadAccessibilityPrefs();

    initialized = true;
    notifyListeners();
  }

  Future<void> _loadUserProfile() async {
    final data = await supabase
        .from('users')
        .select()
        .eq('id', userId!)
        .maybeSingle();

    if (data == null) {
      await supabase.from('users').insert({
        'id': userId,
        'name': 'Guest User',
      });
    }
  }

  Future<void> _loadAccessibilityPrefs() async {
    final data = await supabase
        .from('accessibility_preferences')
        .select()
        .eq('user_id', userId!)
        .maybeSingle();

    if (data == null) {
      await supabase.from('accessibility_preferences').insert({
        'user_id': userId,
        'mode': 'adhd',
        'font_scale': 1.0,
        'vibration_enabled': false,
      });
    } else {
      accessibilityMode =
          data['mode'] == 'tactile' ? AccessibilityMode.tactile : AccessibilityMode.adhd;
      fontScale = (data['font_scale'] as num).toDouble();
      vibrationEnabled = data['vibration_enabled'];
    }
  }

  bool get isADHD => accessibilityMode == AccessibilityMode.adhd;
  bool get isTactile => accessibilityMode == AccessibilityMode.tactile;
}