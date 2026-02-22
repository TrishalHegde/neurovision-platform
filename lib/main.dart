import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'platform_core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yzvpgccdvbilwajyrmdm.supabase.coL',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl6dnBnY2NkdmJpbHdhanlybWRtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzAxOTY5NjUsImV4cCI6MjA4NTc3Mjk2NX0.dJ4Obc-7X0UU4rDj78c2jNKVQr4JAKosBUTkWLb2H7E',
  );

  runApp(const NeuroVisionApp());
}
