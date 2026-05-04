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
  String get login_subtitle => 'مرحباً بك مجدداً في القاعة، عالم الفخامة';

  @override
  String get phone_number => 'رقم الهاتف';

  @override
  String get phone_hint => '012 XXXX XXXX';

  @override
  String get email => 'البريد الإلكتروني';

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

  @override
  String get register_title => 'إنشاء حساب جديد';

  @override
  String get register_subtitle => 'انضم إلى القاعة وابدأ رحلتك';

  @override
  String get full_name => 'الاسم بالكامل';

  @override
  String get full_name_hint => 'الاسم الثلاثي';

  @override
  String get confirm_password => 'تأكيد كلمة المرور';

  @override
  String get confirm_password_hint => '••••••••';

  @override
  String get register_button => 'إنشاء الحساب';

  @override
  String get already_have_account => 'لديك حساب بالفعل؟';

  @override
  String get login_now => 'تسجيل الدخول';

  @override
  String get terms_and_conditions =>
      'بالتسجيل أنت توافق المضي على الشروط والأحكام';

  @override
  String get forgot_password => 'نسيت كلمة المرور؟';

  @override
  String get forgot_password_title => 'استعادة كلمة المرور';

  @override
  String get forgot_password_subtitle =>
      'أدخل بريدك الإلكتروني لتلقي رمز التحقق';

  @override
  String get send_code_button => 'إرسال الرمز';

  @override
  String get otp_title => 'رمز التحقق';

  @override
  String get otp_subtitle => 'أدخل الرمز المكون من 6 أرقام المرسل إليك';

  @override
  String get verify_button => 'تحقق';

  @override
  String get resend_code => 'إعادة إرسال الرمز';

  @override
  String get invalid_code_error => 'رمز التحقق غير صحيح، حاول مرة أخرى';

  @override
  String get reset_password_title => 'تعيين كلمة المرور';

  @override
  String get reset_password_subtitle => 'قم بتعيين كلمة مرور جديدة قوية';

  @override
  String get new_password => 'كلمة المرور الجديدة';

  @override
  String get new_password_hint => '••••••••';

  @override
  String get update_password_button => 'تحديث كلمة المرور';

  @override
  String get password_updated_success => 'تم تحديث كلمة المرور بنجاح';

  @override
  String get nav_home => 'الرئيسية';

  @override
  String get nav_search => 'البحث';

  @override
  String get nav_bookings => 'حجوزاتي';

  @override
  String get nav_profile => 'الملف الشخصي';

  @override
  String welcome_back(String name) {
    return 'مرحباً بك، $name';
  }

  @override
  String get discover_perfect_hall => 'اكتشف قاعتك المثالية';

  @override
  String get featured_halls => 'قاعات مميزة';

  @override
  String get all_halls => 'كل القاعات';

  @override
  String get see_all => 'عرض الكل';

  @override
  String capacity_person(int count) {
    return '$count فرد';
  }

  @override
  String get currency_egp => 'ج.م';

  @override
  String get hero_title => 'ابدئي رحلة ليلة العمر';

  @override
  String get hero_subtitle =>
      'نحن هنا لنجعل من زفافكِ لوحة فنية خالدة في أرقى قاعات مصر.';

  @override
  String get browse_halls => 'تصفح القاعات';

  @override
  String get browse_halls_desc =>
      'استكشفي تشكيلتنا المختارة من أفخم دور المناسبات';

  @override
  String get we_choose_for_you => 'احنا نختارلك';

  @override
  String get we_choose_desc =>
      'دعي منسقينا المحترفين يجدون لك القاعة المثالية بناءً على ذوقك وميزانيتك';

  @override
  String get magazine_title => 'مجلة القاعة الرقمية';

  @override
  String get magazine_desc =>
      'احصلي على نصائح حصرية من كبار منسقي الأفراح وتوجهات الموضة لهذا الموسم مباشرة في بريدك.';

  @override
  String get app_name => 'القاعة';

  @override
  String get greeting => 'أهلاً بك';

  @override
  String get explore_now => 'استكشف الآن';

  @override
  String get start_smart_experience => 'ابدئي التجربة الذكية';

  @override
  String get email_hint => 'بريدك الإلكتروني';

  @override
  String get subscribe_now => 'اشتركي الآن';

  @override
  String up_to_capacity(int count) {
    return 'حتى $count فرد';
  }

  @override
  String get search_title => 'قاعات النخبة';

  @override
  String get search_hint => 'ابحث عن القاعة المثالية...';

  @override
  String get booking_status_title => 'تتبع حالة طلب الحجز';

  @override
  String get booking_accepted_msg =>
      'تم قبول طلبك من قبل إدارة القاعة. نحن الآن بانتظار إتمام عملية الدفع النهائية لتأكيد حجزك بشكل رسمي.';

  @override
  String get cancellation_policy_title => 'سياسة الإلغاء';

  @override
  String get cancellation_policy_desc =>
      'يمكنك استرداد كامل المبلغ في حال تم الإلغاء قبل الموعد بـ 30 يوماً على الأقل. تطبق الشروط والأحكام.';

  @override
  String get pay_now => 'إتمام الدفع';

  @override
  String get profile_title => 'الملف الشخصي';

  @override
  String get account_settings => 'الحساب';

  @override
  String get my_bookings_menu => 'حجوزاتي';

  @override
  String get support => 'الدعم';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get edit_personal_data => 'تعديل البيانات الشخصية';

  @override
  String get change_mobile_number => 'تغيير رقم الموبايل';

  @override
  String get change_password => 'تغيير كلمة المرور';

  @override
  String get current_bookings => 'حجوزاتي الحالية';

  @override
  String get bookings_history => 'سجل الحجوزات';

  @override
  String get saved_halls => 'القاعات المحفوظة';

  @override
  String get contact_us => 'تواصل معنا';

  @override
  String get app_rating => 'تقييم التطبيق';

  @override
  String get terms_and_privacy => 'الشروط والخصوصية';

  @override
  String get account_section => 'الحساب';

  @override
  String get my_bookings_section => 'حجوزاتي';

  @override
  String get support_section => 'الدعم';

  @override
  String get bookings_count => 'الحجوزات';

  @override
  String get saved_halls_count => 'القاعات المحفوظة';

  @override
  String get reviews_count => 'التقييمات';

  @override
  String get welcome_user => 'مرحباً';

  @override
  String get search_results => 'نتائج البحث';

  @override
  String get halls_elite => 'قاعات النخبة';

  @override
  String halls_available(int count) {
    return '$count قاعة متاحة';
  }

  @override
  String get filter_region => 'المنطقة';

  @override
  String get filter_price => 'السعر';

  @override
  String get filter_capacity => 'السعة';

  @override
  String get search_halls_hint => 'ابحث عن قاعة أحلامك...';

  @override
  String get booking_details_royal => 'تفاصيل حجزك الملكي';

  @override
  String get booking_status_tracking => 'تتبع حالة\nطلب الحجز';

  @override
  String get status_pending => 'معلق';

  @override
  String get status_accepted => 'مقبول';

  @override
  String get status_confirmed => 'تم التأكيد';

  @override
  String get total_cost => 'إجمالي التكلفة';

  @override
  String get contact_hall => 'تواصل مع القاعة';

  @override
  String get reference_number => 'رقم المرجع';

  @override
  String cancellation_policy_label(String policy) {
    return 'سياسة الإلغاء: $policy';
  }

  @override
  String get cancellation_policy_full_text =>
      'يمكنك استرداد كامل المبلغ في حال تم الإلغاء قبل الموعد بـ 30 يوماً على الأقل. تطبق الشروط والأحكام.';

  @override
  String guests_count(String count) {
    return '$count ضيف';
  }

  @override
  String get error_no_internet =>
      'لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة';

  @override
  String get error_unexpected => 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً';

  @override
  String get error_invalid_credentials =>
      'بيانات الدخول غير صحيحة، يرجى التأكد من البريد وكلمة المرور';

  @override
  String get error_email_exists => 'هذا البريد الإلكتروني مسجل بالفعل';

  @override
  String get error_confirm_email =>
      'يرجى تأكيد بريدك الإلكتروني من خلال الرابط المرسل إليك';

  @override
  String get error_too_many_attempts =>
      'محاولات كثيرة جداً، يرجى المحاولة مرة أخرى بعد قليل';

  @override
  String get error_data_exists => 'هذه البيانات مسجلة بالفعل في النظام';

  @override
  String get error_data_linked =>
      'عذراً، لا يمكن إتمام العملية لوجود بيانات مرتبطة بها';

  @override
  String get error_database =>
      'خطأ في الوصول لقاعدة البيانات، يرجى التواصل مع الدعم';

  @override
  String get error_file_not_found => 'الملف غير موجود';

  @override
  String get error_file_too_large => 'حجم الملف كبير جداً';

  @override
  String get validator_email_required => 'يرجى إدخال البريد الإلكتروني';

  @override
  String get validator_email_invalid => 'يرجى إدخال بريد إلكتروني صحيح';

  @override
  String get validator_password_required => 'يرجى إدخال كلمة المرور';

  @override
  String get validator_password_short =>
      'كلمة المرور يجب أن تكون 6 أحرف على الأقل';

  @override
  String get validator_confirm_password_required => 'يرجى تأكيد كلمة المرور';

  @override
  String get validator_passwords_not_match => 'كلمتا المرور غير متطابقتين';

  @override
  String get validator_name_required => 'يرجى إدخال الاسم بالكامل';

  @override
  String get validator_name_short => 'يرجى إدخال الاسم الثنائي على الأقل';

  @override
  String get validator_phone_required => 'يرجى إدخال رقم الهاتف';

  @override
  String get validator_phone_invalid => 'يرجى إدخال رقم هاتف مصري صحيح';

  @override
  String get validator_otp_required => 'يرجى إدخال رمز التحقق';

  @override
  String get validator_otp_invalid => 'رمز التحقق يجب أن يكون 6 أرقام';

  @override
  String get hall_details_title => 'تفاصيل القاعة';

  @override
  String get about_hall => 'عن القاعة';

  @override
  String get hall_amenities => 'المميزات والخدمات';

  @override
  String get location_on_map => 'الموقع';

  @override
  String get book_now_cta => 'احجز دلوقتي';

  @override
  String get total_estimated => 'الإجمالي المقدر';

  @override
  String get hall_capacity_label => 'السعة الاستيعابية';

  @override
  String get starts_from => 'يبدأ من';

  @override
  String reviews_count_label(int count) {
    return '($count) تقييم';
  }

  @override
  String get see_all_dates => 'عرض الكل';

  @override
  String get available_dates_label => 'المواعيد المتاحة';

  @override
  String get hall_location_label => 'الموقع';

  @override
  String get empty_state_title => 'لا توجد نتائج';

  @override
  String get empty_state_desc =>
      'عذراً، لم نجد أي قاعات تطابق بحثك حالياً. جرب تغيير الفلاتر أو البحث بكلمات أخرى.';

  @override
  String get empty_state_button => 'البحث من جديد';

  @override
  String get no_internet_title => 'لا يوجد اتصال بالإنترنت';

  @override
  String get no_internet_desc =>
      'يبدو أنك غير متصل بالشبكة. يرجى التحقق من اتصالك بالإنترنت للمتابعة.';

  @override
  String get no_internet_button => 'إعادة المحاولة';
}
