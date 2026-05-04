import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ar')];

  /// No description provided for @login_title.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login_title;

  /// No description provided for @login_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك مجدداً في القاعة، عالم الفخامة'**
  String get login_subtitle;

  /// No description provided for @phone_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم الهاتف'**
  String get phone_number;

  /// No description provided for @phone_hint.
  ///
  /// In ar, this message translates to:
  /// **'012 XXXX XXXX'**
  String get phone_hint;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور'**
  String get password;

  /// No description provided for @password_hint.
  ///
  /// In ar, this message translates to:
  /// **'••••••••'**
  String get password_hint;

  /// No description provided for @login_button.
  ///
  /// In ar, this message translates to:
  /// **'دخول'**
  String get login_button;

  /// No description provided for @create_account.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get create_account;

  /// No description provided for @dont_have_account.
  ///
  /// In ar, this message translates to:
  /// **'ليس لديك حساب؟'**
  String get dont_have_account;

  /// No description provided for @register_title.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء حساب جديد'**
  String get register_title;

  /// No description provided for @register_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'انضم إلى القاعة وابدأ رحلتك'**
  String get register_subtitle;

  /// No description provided for @full_name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم بالكامل'**
  String get full_name;

  /// No description provided for @full_name_hint.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الثلاثي'**
  String get full_name_hint;

  /// No description provided for @confirm_password.
  ///
  /// In ar, this message translates to:
  /// **'تأكيد كلمة المرور'**
  String get confirm_password;

  /// No description provided for @confirm_password_hint.
  ///
  /// In ar, this message translates to:
  /// **'••••••••'**
  String get confirm_password_hint;

  /// No description provided for @register_button.
  ///
  /// In ar, this message translates to:
  /// **'إنشاء الحساب'**
  String get register_button;

  /// No description provided for @already_have_account.
  ///
  /// In ar, this message translates to:
  /// **'لديك حساب بالفعل؟'**
  String get already_have_account;

  /// No description provided for @login_now.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login_now;

  /// No description provided for @terms_and_conditions.
  ///
  /// In ar, this message translates to:
  /// **'بالتسجيل أنت توافق المضي على الشروط والأحكام'**
  String get terms_and_conditions;

  /// No description provided for @forgot_password.
  ///
  /// In ar, this message translates to:
  /// **'نسيت كلمة المرور؟'**
  String get forgot_password;

  /// No description provided for @forgot_password_title.
  ///
  /// In ar, this message translates to:
  /// **'استعادة كلمة المرور'**
  String get forgot_password_title;

  /// No description provided for @forgot_password_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'أدخل بريدك الإلكتروني لتلقي رمز التحقق'**
  String get forgot_password_subtitle;

  /// No description provided for @send_code_button.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الرمز'**
  String get send_code_button;

  /// No description provided for @otp_title.
  ///
  /// In ar, this message translates to:
  /// **'رمز التحقق'**
  String get otp_title;

  /// No description provided for @otp_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'أدخل الرمز المكون من 6 أرقام المرسل إليك'**
  String get otp_subtitle;

  /// No description provided for @verify_button.
  ///
  /// In ar, this message translates to:
  /// **'تحقق'**
  String get verify_button;

  /// No description provided for @resend_code.
  ///
  /// In ar, this message translates to:
  /// **'إعادة إرسال الرمز'**
  String get resend_code;

  /// No description provided for @invalid_code_error.
  ///
  /// In ar, this message translates to:
  /// **'رمز التحقق غير صحيح، حاول مرة أخرى'**
  String get invalid_code_error;

  /// No description provided for @reset_password_title.
  ///
  /// In ar, this message translates to:
  /// **'تعيين كلمة المرور'**
  String get reset_password_title;

  /// No description provided for @reset_password_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'قم بتعيين كلمة مرور جديدة قوية'**
  String get reset_password_subtitle;

  /// No description provided for @new_password.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور الجديدة'**
  String get new_password;

  /// No description provided for @new_password_hint.
  ///
  /// In ar, this message translates to:
  /// **'••••••••'**
  String get new_password_hint;

  /// No description provided for @update_password_button.
  ///
  /// In ar, this message translates to:
  /// **'تحديث كلمة المرور'**
  String get update_password_button;

  /// No description provided for @password_updated_success.
  ///
  /// In ar, this message translates to:
  /// **'تم تحديث كلمة المرور بنجاح'**
  String get password_updated_success;

  /// No description provided for @nav_home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get nav_home;

  /// No description provided for @nav_search.
  ///
  /// In ar, this message translates to:
  /// **'البحث'**
  String get nav_search;

  /// No description provided for @nav_bookings.
  ///
  /// In ar, this message translates to:
  /// **'حجوزاتي'**
  String get nav_bookings;

  /// No description provided for @nav_profile.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get nav_profile;

  /// No description provided for @welcome_back.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك، {name}'**
  String welcome_back(String name);

  /// No description provided for @discover_perfect_hall.
  ///
  /// In ar, this message translates to:
  /// **'اكتشف قاعتك المثالية'**
  String get discover_perfect_hall;

  /// No description provided for @featured_halls.
  ///
  /// In ar, this message translates to:
  /// **'قاعات مميزة'**
  String get featured_halls;

  /// No description provided for @all_halls.
  ///
  /// In ar, this message translates to:
  /// **'كل القاعات'**
  String get all_halls;

  /// No description provided for @see_all.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكل'**
  String get see_all;

  /// No description provided for @capacity_person.
  ///
  /// In ar, this message translates to:
  /// **'{count} فرد'**
  String capacity_person(int count);

  /// No description provided for @currency_egp.
  ///
  /// In ar, this message translates to:
  /// **'ج.م'**
  String get currency_egp;

  /// No description provided for @hero_title.
  ///
  /// In ar, this message translates to:
  /// **'ابدئي رحلة ليلة العمر'**
  String get hero_title;

  /// No description provided for @hero_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'نحن هنا لنجعل من زفافكِ لوحة فنية خالدة في أرقى قاعات مصر.'**
  String get hero_subtitle;

  /// No description provided for @browse_halls.
  ///
  /// In ar, this message translates to:
  /// **'تصفح القاعات'**
  String get browse_halls;

  /// No description provided for @browse_halls_desc.
  ///
  /// In ar, this message translates to:
  /// **'استكشفي تشكيلتنا المختارة من أفخم دور المناسبات'**
  String get browse_halls_desc;

  /// No description provided for @we_choose_for_you.
  ///
  /// In ar, this message translates to:
  /// **'احنا نختارلك'**
  String get we_choose_for_you;

  /// No description provided for @we_choose_desc.
  ///
  /// In ar, this message translates to:
  /// **'دعي منسقينا المحترفين يجدون لك القاعة المثالية بناءً على ذوقك وميزانيتك'**
  String get we_choose_desc;

  /// No description provided for @magazine_title.
  ///
  /// In ar, this message translates to:
  /// **'مجلة القاعة الرقمية'**
  String get magazine_title;

  /// No description provided for @magazine_desc.
  ///
  /// In ar, this message translates to:
  /// **'احصلي على نصائح حصرية من كبار منسقي الأفراح وتوجهات الموضة لهذا الموسم مباشرة في بريدك.'**
  String get magazine_desc;

  /// No description provided for @app_name.
  ///
  /// In ar, this message translates to:
  /// **'القاعة'**
  String get app_name;

  /// No description provided for @greeting.
  ///
  /// In ar, this message translates to:
  /// **'أهلاً بك'**
  String get greeting;

  /// No description provided for @explore_now.
  ///
  /// In ar, this message translates to:
  /// **'استكشف الآن'**
  String get explore_now;

  /// No description provided for @start_smart_experience.
  ///
  /// In ar, this message translates to:
  /// **'ابدئي التجربة الذكية'**
  String get start_smart_experience;

  /// No description provided for @email_hint.
  ///
  /// In ar, this message translates to:
  /// **'بريدك الإلكتروني'**
  String get email_hint;

  /// No description provided for @subscribe_now.
  ///
  /// In ar, this message translates to:
  /// **'اشتركي الآن'**
  String get subscribe_now;

  /// No description provided for @up_to_capacity.
  ///
  /// In ar, this message translates to:
  /// **'حتى {count} فرد'**
  String up_to_capacity(int count);

  /// No description provided for @search_title.
  ///
  /// In ar, this message translates to:
  /// **'قاعات النخبة'**
  String get search_title;

  /// No description provided for @search_hint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن القاعة المثالية...'**
  String get search_hint;

  /// No description provided for @booking_status_title.
  ///
  /// In ar, this message translates to:
  /// **'تتبع حالة طلب الحجز'**
  String get booking_status_title;

  /// No description provided for @booking_accepted_msg.
  ///
  /// In ar, this message translates to:
  /// **'تم قبول طلبك من قبل إدارة القاعة. نحن الآن بانتظار إتمام عملية الدفع النهائية لتأكيد حجزك بشكل رسمي.'**
  String get booking_accepted_msg;

  /// No description provided for @cancellation_policy_title.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الإلغاء'**
  String get cancellation_policy_title;

  /// No description provided for @cancellation_policy_desc.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك استرداد كامل المبلغ في حال تم الإلغاء قبل الموعد بـ 30 يوماً على الأقل. تطبق الشروط والأحكام.'**
  String get cancellation_policy_desc;

  /// No description provided for @pay_now.
  ///
  /// In ar, this message translates to:
  /// **'إتمام الدفع'**
  String get pay_now;

  /// No description provided for @profile_title.
  ///
  /// In ar, this message translates to:
  /// **'الملف الشخصي'**
  String get profile_title;

  /// No description provided for @account_settings.
  ///
  /// In ar, this message translates to:
  /// **'الحساب'**
  String get account_settings;

  /// No description provided for @my_bookings_menu.
  ///
  /// In ar, this message translates to:
  /// **'حجوزاتي'**
  String get my_bookings_menu;

  /// No description provided for @support.
  ///
  /// In ar, this message translates to:
  /// **'الدعم'**
  String get support;

  /// No description provided for @logout.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الخروج'**
  String get logout;

  /// No description provided for @edit_personal_data.
  ///
  /// In ar, this message translates to:
  /// **'تعديل البيانات الشخصية'**
  String get edit_personal_data;

  /// No description provided for @change_mobile_number.
  ///
  /// In ar, this message translates to:
  /// **'تغيير رقم الموبايل'**
  String get change_mobile_number;

  /// No description provided for @change_password.
  ///
  /// In ar, this message translates to:
  /// **'تغيير كلمة المرور'**
  String get change_password;

  /// No description provided for @current_bookings.
  ///
  /// In ar, this message translates to:
  /// **'حجوزاتي الحالية'**
  String get current_bookings;

  /// No description provided for @bookings_history.
  ///
  /// In ar, this message translates to:
  /// **'سجل الحجوزات'**
  String get bookings_history;

  /// No description provided for @saved_halls.
  ///
  /// In ar, this message translates to:
  /// **'القاعات المحفوظة'**
  String get saved_halls;

  /// No description provided for @contact_us.
  ///
  /// In ar, this message translates to:
  /// **'تواصل معنا'**
  String get contact_us;

  /// No description provided for @app_rating.
  ///
  /// In ar, this message translates to:
  /// **'تقييم التطبيق'**
  String get app_rating;

  /// No description provided for @terms_and_privacy.
  ///
  /// In ar, this message translates to:
  /// **'الشروط والخصوصية'**
  String get terms_and_privacy;

  /// No description provided for @account_section.
  ///
  /// In ar, this message translates to:
  /// **'الحساب'**
  String get account_section;

  /// No description provided for @my_bookings_section.
  ///
  /// In ar, this message translates to:
  /// **'حجوزاتي'**
  String get my_bookings_section;

  /// No description provided for @support_section.
  ///
  /// In ar, this message translates to:
  /// **'الدعم'**
  String get support_section;

  /// No description provided for @bookings_count.
  ///
  /// In ar, this message translates to:
  /// **'الحجوزات'**
  String get bookings_count;

  /// No description provided for @saved_halls_count.
  ///
  /// In ar, this message translates to:
  /// **'القاعات المحفوظة'**
  String get saved_halls_count;

  /// No description provided for @reviews_count.
  ///
  /// In ar, this message translates to:
  /// **'التقييمات'**
  String get reviews_count;

  /// No description provided for @welcome_user.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً'**
  String get welcome_user;

  /// No description provided for @search_results.
  ///
  /// In ar, this message translates to:
  /// **'نتائج البحث'**
  String get search_results;

  /// No description provided for @halls_elite.
  ///
  /// In ar, this message translates to:
  /// **'قاعات النخبة'**
  String get halls_elite;

  /// No description provided for @halls_available.
  ///
  /// In ar, this message translates to:
  /// **'{count} قاعة متاحة'**
  String halls_available(int count);

  /// No description provided for @filter_region.
  ///
  /// In ar, this message translates to:
  /// **'المنطقة'**
  String get filter_region;

  /// No description provided for @filter_price.
  ///
  /// In ar, this message translates to:
  /// **'السعر'**
  String get filter_price;

  /// No description provided for @filter_capacity.
  ///
  /// In ar, this message translates to:
  /// **'السعة'**
  String get filter_capacity;

  /// No description provided for @search_halls_hint.
  ///
  /// In ar, this message translates to:
  /// **'ابحث عن قاعة أحلامك...'**
  String get search_halls_hint;

  /// No description provided for @booking_details_royal.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل حجزك الملكي'**
  String get booking_details_royal;

  /// No description provided for @booking_status_tracking.
  ///
  /// In ar, this message translates to:
  /// **'تتبع حالة\nطلب الحجز'**
  String get booking_status_tracking;

  /// No description provided for @status_pending.
  ///
  /// In ar, this message translates to:
  /// **'معلق'**
  String get status_pending;

  /// No description provided for @status_accepted.
  ///
  /// In ar, this message translates to:
  /// **'مقبول'**
  String get status_accepted;

  /// No description provided for @status_confirmed.
  ///
  /// In ar, this message translates to:
  /// **'تم التأكيد'**
  String get status_confirmed;

  /// No description provided for @total_cost.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي التكلفة'**
  String get total_cost;

  /// No description provided for @contact_hall.
  ///
  /// In ar, this message translates to:
  /// **'تواصل مع القاعة'**
  String get contact_hall;

  /// No description provided for @reference_number.
  ///
  /// In ar, this message translates to:
  /// **'رقم المرجع'**
  String get reference_number;

  /// No description provided for @cancellation_policy_label.
  ///
  /// In ar, this message translates to:
  /// **'سياسة الإلغاء: {policy}'**
  String cancellation_policy_label(String policy);

  /// No description provided for @cancellation_policy_full_text.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك استرداد كامل المبلغ في حال تم الإلغاء قبل الموعد بـ 30 يوماً على الأقل. تطبق الشروط والأحكام.'**
  String get cancellation_policy_full_text;

  /// No description provided for @guests_count.
  ///
  /// In ar, this message translates to:
  /// **'{count} ضيف'**
  String guests_count(String count);

  /// No description provided for @error_no_internet.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة'**
  String get error_no_internet;

  /// No description provided for @error_unexpected.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً'**
  String get error_unexpected;

  /// No description provided for @error_invalid_credentials.
  ///
  /// In ar, this message translates to:
  /// **'بيانات الدخول غير صحيحة، يرجى التأكد من البريد وكلمة المرور'**
  String get error_invalid_credentials;

  /// No description provided for @error_email_exists.
  ///
  /// In ar, this message translates to:
  /// **'هذا البريد الإلكتروني مسجل بالفعل'**
  String get error_email_exists;

  /// No description provided for @error_confirm_email.
  ///
  /// In ar, this message translates to:
  /// **'يرجى تأكيد بريدك الإلكتروني من خلال الرابط المرسل إليك'**
  String get error_confirm_email;

  /// No description provided for @error_too_many_attempts.
  ///
  /// In ar, this message translates to:
  /// **'محاولات كثيرة جداً، يرجى المحاولة مرة أخرى بعد قليل'**
  String get error_too_many_attempts;

  /// No description provided for @error_data_exists.
  ///
  /// In ar, this message translates to:
  /// **'هذه البيانات مسجلة بالفعل في النظام'**
  String get error_data_exists;

  /// No description provided for @error_data_linked.
  ///
  /// In ar, this message translates to:
  /// **'عذراً، لا يمكن إتمام العملية لوجود بيانات مرتبطة بها'**
  String get error_data_linked;

  /// No description provided for @error_database.
  ///
  /// In ar, this message translates to:
  /// **'خطأ في الوصول لقاعدة البيانات، يرجى التواصل مع الدعم'**
  String get error_database;

  /// No description provided for @error_file_not_found.
  ///
  /// In ar, this message translates to:
  /// **'الملف غير موجود'**
  String get error_file_not_found;

  /// No description provided for @error_file_too_large.
  ///
  /// In ar, this message translates to:
  /// **'حجم الملف كبير جداً'**
  String get error_file_too_large;

  /// No description provided for @validator_email_required.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال البريد الإلكتروني'**
  String get validator_email_required;

  /// No description provided for @validator_email_invalid.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال بريد إلكتروني صحيح'**
  String get validator_email_invalid;

  /// No description provided for @validator_password_required.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال كلمة المرور'**
  String get validator_password_required;

  /// No description provided for @validator_password_short.
  ///
  /// In ar, this message translates to:
  /// **'كلمة المرور يجب أن تكون 6 أحرف على الأقل'**
  String get validator_password_short;

  /// No description provided for @validator_confirm_password_required.
  ///
  /// In ar, this message translates to:
  /// **'يرجى تأكيد كلمة المرور'**
  String get validator_confirm_password_required;

  /// No description provided for @validator_passwords_not_match.
  ///
  /// In ar, this message translates to:
  /// **'كلمتا المرور غير متطابقتين'**
  String get validator_passwords_not_match;

  /// No description provided for @validator_name_required.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الاسم بالكامل'**
  String get validator_name_required;

  /// No description provided for @validator_name_short.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال الاسم الثنائي على الأقل'**
  String get validator_name_short;

  /// No description provided for @validator_phone_required.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رقم الهاتف'**
  String get validator_phone_required;

  /// No description provided for @validator_phone_invalid.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رقم هاتف مصري صحيح'**
  String get validator_phone_invalid;

  /// No description provided for @validator_otp_required.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال رمز التحقق'**
  String get validator_otp_required;

  /// No description provided for @validator_otp_invalid.
  ///
  /// In ar, this message translates to:
  /// **'رمز التحقق يجب أن يكون 6 أرقام'**
  String get validator_otp_invalid;

  /// No description provided for @hall_details_title.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل القاعة'**
  String get hall_details_title;

  /// No description provided for @about_hall.
  ///
  /// In ar, this message translates to:
  /// **'عن القاعة'**
  String get about_hall;

  /// No description provided for @hall_amenities.
  ///
  /// In ar, this message translates to:
  /// **'المميزات والخدمات'**
  String get hall_amenities;

  /// No description provided for @location_on_map.
  ///
  /// In ar, this message translates to:
  /// **'الموقع'**
  String get location_on_map;

  /// No description provided for @book_now_cta.
  ///
  /// In ar, this message translates to:
  /// **'احجز دلوقتي'**
  String get book_now_cta;

  /// No description provided for @total_estimated.
  ///
  /// In ar, this message translates to:
  /// **'الإجمالي المقدر'**
  String get total_estimated;

  /// No description provided for @hall_capacity_label.
  ///
  /// In ar, this message translates to:
  /// **'السعة الاستيعابية'**
  String get hall_capacity_label;

  /// No description provided for @starts_from.
  ///
  /// In ar, this message translates to:
  /// **'يبدأ من'**
  String get starts_from;

  /// No description provided for @reviews_count_label.
  ///
  /// In ar, this message translates to:
  /// **'({count}) تقييم'**
  String reviews_count_label(int count);

  /// No description provided for @see_all_dates.
  ///
  /// In ar, this message translates to:
  /// **'عرض الكل'**
  String get see_all_dates;

  /// No description provided for @available_dates_label.
  ///
  /// In ar, this message translates to:
  /// **'المواعيد المتاحة'**
  String get available_dates_label;

  /// No description provided for @hall_location_label.
  ///
  /// In ar, this message translates to:
  /// **'الموقع'**
  String get hall_location_label;

  /// No description provided for @empty_state_title.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد نتائج'**
  String get empty_state_title;

  /// No description provided for @empty_state_desc.
  ///
  /// In ar, this message translates to:
  /// **'عذراً، لم نجد أي قاعات تطابق بحثك حالياً. جرب تغيير الفلاتر أو البحث بكلمات أخرى.'**
  String get empty_state_desc;

  /// No description provided for @empty_state_button.
  ///
  /// In ar, this message translates to:
  /// **'البحث من جديد'**
  String get empty_state_button;

  /// No description provided for @no_internet_title.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد اتصال بالإنترنت'**
  String get no_internet_title;

  /// No description provided for @no_internet_desc.
  ///
  /// In ar, this message translates to:
  /// **'يبدو أنك غير متصل بالشبكة. يرجى التحقق من اتصالك بالإنترنت للمتابعة.'**
  String get no_internet_desc;

  /// No description provided for @no_internet_button.
  ///
  /// In ar, this message translates to:
  /// **'إعادة المحاولة'**
  String get no_internet_button;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
