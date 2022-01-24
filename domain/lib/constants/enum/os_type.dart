class OsType {
  final String _type;

  const OsType._(this._type);

  @override
  String toString() {
    return _type.toString();
  }

  static const OsType IOS = OsType._("IOS");
  static const OsType ANDROID = OsType._("ANDROID");
}
