class LanguageEnum {
  final String _value;

  const LanguageEnum._(this._value);

  @override
  String toString() {
    return _value.toString();
  }

  static const LanguageEnum ENGLISH = LanguageEnum._('en');
  static const LanguageEnum ARABIC = LanguageEnum._('ar');
  static const LanguageEnum NONE = LanguageEnum._('none');
}
