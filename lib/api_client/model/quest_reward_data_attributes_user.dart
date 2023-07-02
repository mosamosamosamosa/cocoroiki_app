//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuestRewardDataAttributesUser {
  /// Returns a new [QuestRewardDataAttributesUser] instance.
  QuestRewardDataAttributesUser({
    this.data,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  QuestRewardDataAttributesUserData? data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuestRewardDataAttributesUser &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data == null ? 0 : data!.hashCode);

  @override
  String toString() => 'QuestRewardDataAttributesUser[data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.data != null) {
      json[r'data'] = this.data;
    } else {
      json[r'data'] = null;
    }
    return json;
  }

  /// Returns a new [QuestRewardDataAttributesUser] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static QuestRewardDataAttributesUser? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "QuestRewardDataAttributesUser[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "QuestRewardDataAttributesUser[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return QuestRewardDataAttributesUser(
        data: QuestRewardDataAttributesUserData.fromJson(json[r'data']),
      );
    }
    return null;
  }

  static List<QuestRewardDataAttributesUser> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <QuestRewardDataAttributesUser>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = QuestRewardDataAttributesUser.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, QuestRewardDataAttributesUser> mapFromJson(dynamic json) {
    final map = <String, QuestRewardDataAttributesUser>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuestRewardDataAttributesUser.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of QuestRewardDataAttributesUser-objects as value to a dart map
  static Map<String, List<QuestRewardDataAttributesUser>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<QuestRewardDataAttributesUser>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = QuestRewardDataAttributesUser.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

