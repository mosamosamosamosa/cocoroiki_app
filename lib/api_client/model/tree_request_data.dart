//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TreeRequestData {
  /// Returns a new [TreeRequestData] instance.
  TreeRequestData({
    this.users = const [],
    this.state,
    this.wateredAt,
  });

  List<AppUserRequestDataFamily> users;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? state;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? wateredAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TreeRequestData &&
     other.users == users &&
     other.state == state &&
     other.wateredAt == wateredAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (users.hashCode) +
    (state == null ? 0 : state!.hashCode) +
    (wateredAt == null ? 0 : wateredAt!.hashCode);

  @override
  String toString() => 'TreeRequestData[users=$users, state=$state, wateredAt=$wateredAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'users'] = this.users;
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
      json[r'state'] = null;
    }
    if (this.wateredAt != null) {
      json[r'wateredAt'] = this.wateredAt!.toUtc().toIso8601String();
    } else {
      json[r'wateredAt'] = null;
    }
    return json;
  }

  /// Returns a new [TreeRequestData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TreeRequestData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TreeRequestData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TreeRequestData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TreeRequestData(
        users: AppUserRequestDataFamily.listFromJson(json[r'users']),
        state: mapValueOfType<int>(json, r'state'),
        wateredAt: mapDateTime(json, r'wateredAt', r''),
      );
    }
    return null;
  }

  static List<TreeRequestData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TreeRequestData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TreeRequestData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TreeRequestData> mapFromJson(dynamic json) {
    final map = <String, TreeRequestData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TreeRequestData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TreeRequestData-objects as value to a dart map
  static Map<String, List<TreeRequestData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TreeRequestData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TreeRequestData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

