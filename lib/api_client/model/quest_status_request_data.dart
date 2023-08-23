//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuestStatusRequestData {
  /// Returns a new [QuestStatusRequestData] instance.
  QuestStatusRequestData({
    this.completedAt,
    this.doing,
    this.grandparent,
    this.tree,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? completedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? doing;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserRequestDataFamiliesInner? grandparent;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? tree;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestStatusRequestData &&
          other.completedAt == completedAt &&
          other.doing == doing &&
          other.grandparent == grandparent &&
          other.tree == tree;

  @override
  int get hashCode =>
      // ignore: unnecessary_parenthesis
      (completedAt == null ? 0 : completedAt!.hashCode) +
      (doing == null ? 0 : doing!.hashCode) +
      (grandparent == null ? 0 : grandparent!.hashCode) +
      (tree == null ? 0 : tree!.hashCode);

  @override
  String toString() =>
      'QuestStatusRequestData[completedAt=$completedAt, doing=$doing, grandparent=$grandparent, tree=$tree]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.completedAt != null) {
      json[r'completedAt'] = this.completedAt!.toUtc().toIso8601String();
    } else {
      json[r'completedAt'] = null;
    }
    if (this.doing != null) {
      json[r'doing'] = this.doing;
    } else {
      json[r'doing'] = null;
    }
    if (this.grandparent != null) {
      json[r'grandparent'] = this.grandparent;
    } else {
      json[r'grandparent'] = null;
    }
    if (this.tree != null) {
      json[r'tree'] = this.tree;
    } else {
      json[r'tree'] = null;
    }
    return json;
  }

  /// Returns a new [QuestStatusRequestData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static QuestStatusRequestData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key),
              'Required key "QuestStatusRequestData[$key]" is missing from JSON.');
          assert(json[key] != null,
              'Required key "QuestStatusRequestData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return QuestStatusRequestData(
        completedAt: mapDateTime(json, r'completedAt', r''),
        doing: mapValueOfType<bool>(json, r'doing'),
        grandparent:
            AppUserRequestDataFamiliesInner.fromJson(json[r'grandparent']),
        tree: mapValueOfType<int>(json, r'tree'),
      );
    }
    return null;
  }

  static List<QuestStatusRequestData> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <QuestStatusRequestData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = QuestStatusRequestData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, QuestStatusRequestData> mapFromJson(dynamic json) {
    final map = <String, QuestStatusRequestData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuestStatusRequestData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of QuestStatusRequestData-objects as value to a dart map
  static Map<String, List<QuestStatusRequestData>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<QuestStatusRequestData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = QuestStatusRequestData.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
