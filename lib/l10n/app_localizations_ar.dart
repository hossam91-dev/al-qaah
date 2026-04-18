// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get login_title => 'تسجيل الدخول';

  @override
  String get login_subtitle => 'مرحباً بك مجدداً في لفاف، عالم الفخامة';

  @override
  String get phone_number => 'رقم الهاتف';

  @override
  String get phone_hint => '012 XXXX XXXX';

  @override
  String get password => 'كلمة المرور';

  @override
  String get password_hint => '••••••••';

  @override
  String get login_button => 'دخول';

  @override
  String get create_account => 'إنشاء حساب جديد';

  @override
  String get dont_have_account => 'ليس لديك حساب؟';
}
