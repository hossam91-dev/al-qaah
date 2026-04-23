class ValidationUtils {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال البريد الإلكتروني';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'يرجى إدخال بريد إلكتروني صحيح';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    }
    if (value.length < 6) {
      return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    }
    if (password != confirmPassword) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال الاسم بالكامل';
    }
    if (value.trim().split(' ').length < 2) {
      return 'يرجى إدخال الاسم الثنائي على الأقل';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    }
    final phoneRegex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'يرجى إدخال رقم هاتف مصري صحيح';
    }
    return null;
  }
  
  static String? validateOtp(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال رمز التحقق';
    }
    if (value.trim().length != 6) {
      return 'رمز التحقق يجب أن يكون 6 أرقام';
    }
    return null;
  }
}
