import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'failures.dart';
import 'logging_service.dart';

class ErrorHandler {
  static Failure handle(dynamic error, [StackTrace? stackTrace]) {
    LoggingService.logError(error, stackTrace);

    if (error is supabase.AuthException) {
      return AuthFailure(_mapAuthErrorMessage(error), code: error.statusCode);
    } else if (error is supabase.PostgrestException) {
      return ServerFailure(_mapPostgrestErrorMessage(error), code: error.code);
    } else if (error is supabase.StorageException) {
      return ServerFailure(_mapStorageErrorMessage(error));
    } else if (error is SocketException) {
      return const NetworkFailure(
        'لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة',
      );
    } else if (error is Failure) {
      return error;
    }

    return ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقاً');
  }

  static String _mapAuthErrorMessage(supabase.AuthException error) {
    final message = error.message.toLowerCase();
    if (message.contains('invalid login credentials')) {
      return 'بيانات الدخول غير صحيحة، يرجى التأكد من البريد وكلمة المرور';
    } else if (message.contains('user already exists')) {
      return 'هذا البريد الإلكتروني مسجل بالفعل';
    } else if (message.contains('email not confirmed')) {
      return 'يرجى تأكيد بريدك الإلكتروني من خلال الرابط المرسل إليك';
    } else if (message.contains('too many requests')) {
      return 'محاولات كثيرة جداً، يرجى المحاولة مرة أخرى بعد قليل';
    }
    return error.message;
  }

  static String _mapPostgrestErrorMessage(supabase.PostgrestException error) {
    switch (error.code) {
      case '23505':
        return 'هذه البيانات مسجلة بالفعل في النظام';
      case '23503':
        return 'عذراً، لا يمكن إتمام العملية لوجود بيانات مرتبطة بها';
      case '42P01':
        return 'خطأ في الوصول لقاعدة البيانات، يرجى التواصل مع الدعم';
      default:
        return error.message;
    }
  }

  static String _mapStorageErrorMessage(supabase.StorageException error) {
    if (error.message.contains('Object not found')) {
      return 'الملف غير موجود';
    } else if (error.message.contains('Payload too large')) {
      return 'حجم الملف كبير جداً';
    }
    return error.message;
  }
}
