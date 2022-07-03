class ThemeDataFields {
  static const String tableName = 'ThemeData';
  static const String isDark = 'is_dark';
}

class ThemeDataModel {
  bool isDark = false;

  ThemeDataModel({
    required this.isDark,
  });

  Map<String, dynamic> toMap() {
    return {
      'is_dark': isDark ? 1 : 0,
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