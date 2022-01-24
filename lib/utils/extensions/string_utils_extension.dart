extension StringUtilExtension on String {
  String getInitials() {
    try {
      if (this.isEmpty) {
        return this;
      }
      List<String> _flName = this.split(" ");
      if (_flName.isEmpty) {
        return this;
      }
      if (_flName.length > 1) {
        return _flName.first[0] + _flName.last[0];
      }
      return _flName.first[0];
    } catch (exception) {
      return this[0];
    }
  }

  String capitalize() {
    if (this.isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
