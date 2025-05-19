import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHandler {
  final SupabaseClient supabase;

  SupabaseHandler(this.supabase);

  // Profil ekleme veya güncelleme (upsert)
  Future<bool> upsertProfile({
    required String id,
    required String firstName,
    required String lastName,
    String? profileUrl,
  }) async {
    final response = await supabase.from('profiles').upsert({
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'profile_url': profileUrl,
    });

    if (response.error != null) {
      print('Supabase upsertProfile error: ${response.error!.message}');
      return false;
    }
    return true;
  }

  // Profil verisini çekme
  Future<Map<String, dynamic>?> getProfile(String id) async {
    final response = await supabase
        .from('profiles')
        .select()
        .eq('id', id)
        .single();

    if (response.error != null) {
      print('Supabase getProfile error: ${response.error!.message}');
      return null;
    }

    return response.data as Map<String, dynamic>?;
  }
}
