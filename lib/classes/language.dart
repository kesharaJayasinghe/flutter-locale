class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, '🇺🇸', 'English', 'en'),
      Language(2, '🇱🇰', 'සිංහල', 'si'),
      Language(3, '🇮🇳', 'हिंदी', 'hi'),
      Language(4, '🇦🇪', 'اَلْعَرَبِيَّةُ‎', 'ar'),
      Language(5, '🇫🇷', 'Français', 'fr'),
    ];
  }
}
