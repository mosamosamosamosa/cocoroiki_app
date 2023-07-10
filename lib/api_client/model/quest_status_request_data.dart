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
    this.quest,
    this.kid,
    this.completedAt,
    this.doing,
    this.grandparent,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserRequestDataFamiliesInner? quest;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserRequestDataFamiliesInner? kid;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuestStatusRequestData &&
     other.quest == quest &&
     other.kid == kid &&
     other.completedAt == completedAt &&
     other.doing == doing &&
     other.grandparent == grandparent;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (quest == null ? 0 : quest!.hashCode) +
    (kid == null ? 0 : kid!.hashCode) +
    (completedAt == null ? 0 : completedAt!.hashCode) +
    (doing == null ? 0 : doing!.hashCode) +
    (grandparent == null ? 0 : grandparent!.hashCode);

  @override
  String toString() => 'QuestStatusRequestData[quest=$quest, kid=$kid, completedAt=$completedAt, doing=$doing, grandparent=$grandparent]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.quest != null) {
      json[r'quest'] = this.quest;
    } else {
      json[r'quest'] = null;
    }
    if (this.kid != null) {
      json[r'kid'] = this.kid;
    } else {
      json[r'kid'] = null;
    }
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
          assert(json.containsKey(key), 'Required key "QuestStatusRequestData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "QuestStatusRequestData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return QuestStatusRequestData(
        quest: AppUserRequestDataFamiliesInner.fromJson(json[r'quest']),
        kid: AppUserRequestDataFamiliesInner.fromJson(json[r'kid']),
        completedAt: mapDateTime(json, r'completedAt', r''),
        doing: mapValueOfType<bool>(json, r'doing'),
        grandparent: AppUserRequestDataFamiliesInner.fromJson(json[r'grandparent']),
      );
    }
    return null;
  }

  static List<QuestStatusRequestData> listFromJson(dynamic json, {bool growable = false,}) {
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
  static Map<String, List<QuestStatusRequestData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<QuestStatusRequestData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = QuestStatusRequestData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

