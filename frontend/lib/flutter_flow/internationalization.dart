import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'consumeAI',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'fzxvw3mu': {
      'en': 'make healthier food choices..',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'a9j78va9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'a0iimirx': {
      'en': 'Create',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    '1zqiw31h': {
      'en': 'Continue as Guest',
      'ar': 'تواصل كضيف',
      'de': 'Als Gast fortfahren',
      'es': 'Continua como invitado',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // profileStep1
  {
    'yhcaf7r2': {
      'en': 'profile....',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    '72ii0waq': {
      'en': 'Goal',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'pf8glhkg': {
      'en': 'Goal? (lose weight, gain muscle etc..)',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
    },
    'b8aje21h': {
      'en': 'Next',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // onboarding
  {
    'n8z28hlx': {
      'en': 'consumeAI',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i8hl2uua': {
      'en': 'add your profile',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en': 'help us understand you better with your goals and composition',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'kqurck7d': {
      'en': 'Add Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // userProfile
  {
    'i16gr6pz': {
      'en': '[User Name Here]',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eixjjzil': {
      'en': 'User.name@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6nzex4pe': {
      'en': 'User.name@domainname.com',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
    },
    '9aogde79': {
      'en': 'Scan History',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // profileComplete
  {
    'xf8d4sm8': {
      'en': 'Setup Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully set up your profile. Now, whenever you add a packed food item, we will let you know if it is good for you!',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homepageFirstTime
  {
    'ucqlrrlk': {
      'en': 'Welcome,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'c10wb3ot': {
      'en': 'Scan items for complete insights and healthier food choices..',
      'ar': 'تفاصيل حسابك أدناه.',
      'de': 'Ihre Kontodetails sind unten.',
      'es': 'Los detalles de su cuenta se encuentran a continuación.',
    },
    '5l4kxl4e': {
      'en': 'Snap',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8yofwdqc': {
      'en': 'to discover',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd06ccdbo': {
      'en': 'Scan',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iz79h7me': {
      'en': 'the barcode',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pnmh2xfi': {
      'en': 'Cancel',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mxfux3wl': {
      'en': 'Search',
      'ar': '',
      'de': '',
      'es': '',
    },
    '75imee62': {
      'en': 'by typing',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lmo3ko2i': {
      'en': 'Quick Actions',
      'ar': 'خدمات سريعة',
      'de': 'Schnelle Dienste',
      'es': 'Servicios rápidos',
    },
    '774itrkn': {
      'en': 'improve consumeAI',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'g8yaaa7f': {
      'en': 'quiz\n',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'ipl3kqlt': {
      'en': 'Searching .. ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c805m53i': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homepagePostScan
  {
    '51kawpgz': {
      'en': 'Welcome',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    '30kx6e5v': {
      'en': 'Be a healthier you!',
      'ar': 'آخر التحديثات الخاصة بك أدناه.',
      'de': 'Ihre neuesten Updates sind unten.',
      'es': 'Sus últimas actualizaciones se encuentran a continuación.',
    },
    'dfjtbkbo': {
      'en': 'Nutrient Profile',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'g7t9krj7': {
      'en': 'Protein',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'vupu5y5p': {
      'en': 'Proteins help build muscles!',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '2thn73jc': {
      'en': 'Fats',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    '1fjdiibo': {
      'en': 'Fats provide energy, support cell growth',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '8t6ddwco': {
      'en': 'Carbohydrates',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'td15kjsa': {
      'en':
          'Carbohydrates are the body\'s main source of energy, fueling body activity',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    '8pdmehj2': {
      'en': 'Energy',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
    },
    'krrhjgc4': {
      'en': 'Obvious, isn\'t it?',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'g9c9azkw': {
      'en': 'Total Sugars',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u7q98ppk': {
      'en': 'Includes natural & artificial sugar)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y0iaknmo': {
      'en': 'Fibers',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hk78auqb': {
      'en': 'Good for digestion',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eebwlvjp': {
      'en': 'Allergens',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uo3mcyda': {
      'en': 'Quick Actions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gcdukjpj': {
      'en': 'improve consumeAI',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // profileStep2
  {
    'emq5ilrt': {
      'en': 'profile....',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9qvkds3d': {
      'en': 'Do you have any chronic diseases? Select applicable',
      'ar': '',
      'de': '',
      'es': '',
    },
    '28ciu3pi': {
      'en': 'Diabetes (Type 1, Type 2)',
      'ar': '',
      'de': '',
      'es': '',
    },
    '94ic29iu': {
      'en': 'Heart (Cardiovascular, Coronary, Hypertension)',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6jd3dg7i': {
      'en': 'Obesity/Overweight',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dhskg9l3': {
      'en': 'Digestive (Celiac, Lactose Intolerance, IBS)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'glndjmtc': {
      'en': 'None',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x1kxeqok': {
      'en': 'Next',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9r4djkxj': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cmfp2zs7': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a7qbitdh': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ehfyruue': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // createAccount
  {
    'fh77rknf': {
      'en': 'consumeAI',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cfsw8l22': {
      'en': 'discover your food with AI',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7u0qtaie': {
      'en': 'Email Address',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8eopj1pv': {
      'en': 'Enter your email...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0vn9ct8h': {
      'en': 'Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v1esvehi': {
      'en': 'Enter your password...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'umxmz4hz': {
      'en': 'Confirm',
      'ar': '',
      'de': '',
      'es': '',
    },
    'npl9s5bg': {
      'en': 'Confirm password...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8y4ppq2w': {
      'en': 'Create',
      'ar': '',
      'de': '',
      'es': '',
    },
    'md8ja4go': {
      'en': 'Continue as Guest',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ug56ja1': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // improveConsumewiseAI
  {
    'oc4payb7': {
      'en': 'help us impove and earn point',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tgmo87j3': {
      'en': 'Scan Food',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kgg4mbox': {
      'en': 'Product Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cs792sof': {
      'en': 'Amul Salted Butter',
      'ar': '',
      'de': '',
      'es': '',
    },
    '09a75q69': {
      'en': 'Brand',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6a6o1hd5': {
      'en': 'Amul',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sn3skusj': {
      'en': 'Ingredients',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dpogp83n': {
      'en': 'Wheat, Emulsifiers...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'its2198r': {
      'en': 'Allergens, if any',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x3y5quk1': {
      'en': 'Gluten..',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b6zjesao': {
      'en': 'Submit',
      'ar': '',
      'de': '',
      'es': '',
    },
    'igco7hei': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // homepagePostBarScan
  {
    '69ifuezm': {
      'en': 'Welcome',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ia7bxzaj': {
      'en': 'Be a healthier you!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3zol7vvo': {
      'en': 'Nutrient Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ed6zjv51': {
      'en': 'Protein',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fhiq82yn': {
      'en': 'Proteins help build muscles!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lw4t09k8': {
      'en': 'Fats',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5cwpo8vl': {
      'en': 'Fats provide energy, support cell growth',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y48urhkx': {
      'en': 'Carbohydrates',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6d30addb': {
      'en':
          'Carbohydrates are the body\'s main source of energy, fueling body activity',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r2eetz2d': {
      'en': 'Energy',
      'ar': '',
      'de': '',
      'es': '',
    },
    '82s7ecvb': {
      'en': 'Obvious, isn\'t it?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ifguoyvw': {
      'en': 'Total Sugars',
      'ar': '',
      'de': '',
      'es': '',
    },
    'htimov5v': {
      'en': 'Includes natural & artificial sugar)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hlr9s0m6': {
      'en': 'Sodium',
      'ar': '',
      'de': '',
      'es': '',
    },
    'eri0ucn6': {
      'en': 'Artifical Sugar Added',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p0x6uq24': {
      'en': 'Fibers',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6v8dbus5': {
      'en': 'Good for digestion',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rj2govk9': {
      'en': 'Allergens',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9j9gfm8i': {
      'en': 'Quick Actions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e1vnsykw': {
      'en': 'improve consumeAI',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y0ctwin7': {
      'en': 'history\n',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l9i49u4j': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // profileStep3
  {
    '52yl14im': {
      'en': 'profile....',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hw1lbcub': {
      'en': 'Which allergens are you sensitive to? Select applicable.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nkbz7spg': {
      'en': 'Gluten',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r88bk3z5': {
      'en': 'Dairy (Milk Products)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tls0yhbc': {
      'en': 'Tree Nuts',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7a2b1k4c': {
      'en': 'Egg Products',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0g07r917': {
      'en': 'Sea Foods (including fish)',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9r28qz7m': {
      'en': 'Peanuts',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h2h4z8he': {
      'en': 'Next',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhw95vob': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '522o6xs8': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '86itj8w1': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q4gdscae': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // profileStep4
  {
    '4mlzmwh2': {
      'en': 'profile....',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4hnm7ieq': {
      'en': 'Dietary Restrictions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f0nt1ctj': {
      'en': 'Vegan',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ji1vbcwa': {
      'en': 'Vegetarian',
      'ar': '',
      'de': '',
      'es': '',
    },
    'r2u5vade': {
      'en': 'Non Vegetarian',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7a1w1ny8': {
      'en': 'Keto',
      'ar': '',
      'de': '',
      'es': '',
    },
    's07w1qj5': {
      'en': 'Paleo',
      'ar': '',
      'de': '',
      'es': '',
    },
    'apxoe1dp': {
      'en': 'Finish',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v13smj9w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vci40p8w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zquvrrgs': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '62o22b29': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // search
  {
    'mc7ls2iv': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dwtkrtdk': {
      'en': 'Search for food products...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'll8n5cad': {
      'en': 'Products matching search',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wa1x6wk1': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Seguro que quieres pausar tu tarjeta?',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا بأس',
      'de': 'egal',
      'es': 'No importa',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // HPReward
  {
    '6jetyi3z': {
      'en': 'Health Points (HP) ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k4yh8yaj': {
      'en':
          'Health Points are rewards you earn by scanning food labels and contributing valuable data. The more complete the information you provide, the more HP you earn! It\'s our way of encouraging smarter, healthier choices.',
      'ar': '',
      'de': '',
      'es': '',
    },
    't6u9ilgv': {
      'en': 'How to Earn HP:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ipi90p2m': {
      'en': '+1 HP: Capture both the product name and brand.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ft96n56m': {
      'en': '+1 HP: Successfully capture the ingredients list.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kfo3yq65': {
      'en':
          '+2 HP: Capture all required nutrition data for Nutri-Score calculation.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zigbjmv3': {
      'en': '+1 HP: Capture the product barcode (EAN or UPC).',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kitmz3zl': {
      'en': 'What Can You Do with HP:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ozp81pn0': {
      'en':
          'Redeem your Health Points for rewards, healthier products, or exclusive offers. Keep scanning to earn more and make healthier choices!',
      'ar': '',
      'de': '',
      'es': '',
    },
    'usvm6iqb': {
      'en': 'Start Scanning',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x1qmkr2u': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i28wf2eh': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yl1fx98v': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wgig19go': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pwgoesi0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l67ous5v': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5m9nnk9e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v7m0u0wa': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b5wzy4a0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ij78qadi': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fvctdfhl': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
