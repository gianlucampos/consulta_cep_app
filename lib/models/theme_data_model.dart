class ThemeDataFields {
  static final String TABLE_NAME = 'ThemeData';
  static final String IS_DARK = 'is_dark';
}

class ThemeDataModel {
  bool isDark = false;

  ThemeDataModel({
    required this.isDark,
  });

  Map<String, dynamic> toMap() {
    return {
      'is_dark': this.isDark ? 1 : 0,
    };
  }

  factory ThemeDataModel.fromMap(Map<String, dynamic> map) {
    return ThemeDataModel(
      isDark: map['is_dark'] == 1,
    );
  }

  @override
  String toString() {
    return 'ThemeDataModel{isDark: $isDark}';
  }
}