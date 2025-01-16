enum AppFontFamily {
  SofiaPro,
}

extension AppFontFamilyValue on AppFontFamily {
  String get value {
    switch (this) {
      case AppFontFamily.SofiaPro:
        return 'Sofia Pro';
    }
  }
}
