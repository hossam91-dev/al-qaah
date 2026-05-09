import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/hall_model.dart';

abstract class HallsRemoteDataSource {
  Future<List<HallModel>> getAllHalls({String? region, String? searchQuery});
  Future<HallModel> getHallById(String id);
}

@LazySingleton(as: HallsRemoteDataSource)
class HallsRemoteDataSourceImpl implements HallsRemoteDataSource {
  final SupabaseClient _supabaseClient;

  HallsRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<HallModel>> getAllHalls({String? region, String? searchQuery}) async {
    var query = _supabaseClient.from('halls').select('''
      *,
      images:hall_images(*)
    ''');

    if (region != null) {
      query = query.eq('region', region);
    }
    
    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query.ilike('name', '%$searchQuery%');
    }

    final response = await query.eq('is_active', true).order('created_at');

    return (response as List).map((json) => HallModel.fromJson(json)).toList();
  }

  @override
  Future<HallModel> getHallById(String id) async {
    final response = await _supabaseClient.from('halls').select('''
          *,
          images:hall_images(*)
        ''').eq('id', id).single();

    return HallModel.fromJson(response);
  }
}
