import 'supabase_client.dart';

class SupabaseService {
  static Future<void> updateProgress({
    required String userId,
    required String module,
    required int completionPercent,
  }) async {
    await supabase.from('progress').upsert({
      'user_id': userId,
      'module': module,
      'completion_percent': completionPercent,
      'updated_at': DateTime.now().toIso8601String(),
    });
  }
}