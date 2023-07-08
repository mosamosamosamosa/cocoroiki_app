//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RewardRequestData {
  /// Returns a new [RewardRequestData] instance.
  RewardRequestData({
    this.content,
    this.name,
    this.point,
    this.user,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? point;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserRequestDataFamiliesInner? user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RewardRequestData &&
     other.content == content &&
     other.name == name &&
     other.point == point &&
     other.user == user;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (content == null ? 0 : content!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (point == null ? 0 : point!.hashCode) +
    (user == null ? 0 : user!.hashCode);

  @override
  String toString() => 'RewardRequestData[content=$content, name=$name, point=$point, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.content != null) {
      json[r'content'] = this.content;
    } else {
      json[r'content'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.point != null) {
      json[r'point'] = this.point;
    } else {
      json[r'point'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    return json;
  }

  /// Returns a new [RewardRequestData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RewardRequestData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RewardRequestData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RewardRequestData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RewardRequestData(
        content: mapValueOfType<String>(json, r'content'),
        name: mapValueOfType<String>(json, r'name'),
        point: mapValueOfType<int>(json, r'point'),
        user: AppUserRequestDataFamiliesInner.fromJson(json[r'user']),
      );
    }
    return null;
  }

  static List<RewardRequestData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RewardRequestData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RewardRequestData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RewardRequestData> mapFromJson(dynamic json) {
    final map = <String, RewardRequestData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RewardRequestData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RewardRequestData-objects as value to a dart map
  static Map<String, List<RewardRequestData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RewardRequestData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RewardRequestData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

