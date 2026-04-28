import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/hall_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<HallModel>> getHalls({String? region, String? category});
  Future<List<HallModel>> getFeaturedHalls();
  Future<HallModel?> getHighestRatedHall();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient _supabaseClient;

  HomeRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<HallModel>> getHalls({String? region, String? category}) async {
    var query = _supabaseClient.from('halls').select('''
      *,
      images:hall_images(*)
    ''');

    if (region != null) {
      query = query.eq('region', region);
    }

    // category could be a filter on amenities or a specific column if added later
    // For now, let's just get all active halls
    final response = await query.eq('is_active', true).order('created_at');

    return (response as List).map((json) => HallModel.fromJson(json)).toList();
  }

  @override
  Future<List<HallModel>> getFeaturedHalls() async {
    final response = await _supabaseClient
        .from('halls')
        .select('''
          *,
          images:hall_images(*)
        ''')
        .eq('is_active', true)
        .order('avg_rating', ascending: false)
        .limit(5);

    return (response as List).map((json) => HallModel.fromJson(json)).toList();
  }

  @override
  Future<HallModel?> getHighestRatedHall() async {
    final response = await _supabaseClient
        .from('halls')
        .select('''
          *,
          images:hall_images(*)
        ''')
        .eq('is_active', true)
        .order('avg_rating', ascending: false)
        .limit(1);

    if ((response as List).isEmpty) return null;
    return HallModel.fromJson(response.first);
  }
}
