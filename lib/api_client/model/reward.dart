//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Reward {
  /// Returns a new [Reward] instance.
  Reward({
    this.content,
    this.name,
    this.point,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.createdBy,
    this.updatedBy,
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
  CommentCommentsDataInnerAttributesUser? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updatedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? publishedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole? createdBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole? updatedBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Reward &&
     other.content == content &&
     other.name == name &&
     other.point == point &&
     other.user == user &&
     other.createdAt == createdAt &&
     other.updatedAt == updatedAt &&
     other.publishedAt == publishedAt &&
     other.createdBy == createdBy &&
     other.updatedBy == updatedBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (content == null ? 0 : content!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (point == null ? 0 : point!.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (publishedAt == null ? 0 : publishedAt!.hashCode) +
    (createdBy == null ? 0 : createdBy!.hashCode) +
    (updatedBy == null ? 0 : updatedBy!.hashCode);

  @override
  String toString() => 'Reward[content=$content, name=$name, point=$point, user=$user, createdAt=$createdAt, updatedAt=$updatedAt, publishedAt=$publishedAt, createdBy=$createdBy, updatedBy=$updatedBy]';

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
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updatedAt'] = this.updatedAt!.toUtc().toIso8601String();
    } else {
      json[r'updatedAt'] = null;
    }
    if (this.publishedAt != null) {
      json[r'publishedAt'] = this.publishedAt!.toUtc().toIso8601String();
    } else {
      json[r'publishedAt'] = null;
    }
    if (this.createdBy != null) {
      json[r'createdBy'] = this.createdBy;
    } else {
      json[r'createdBy'] = null;
    }
    if (this.updatedBy != null) {
      json[r'updatedBy'] = this.updatedBy;
    } else {
      json[r'updatedBy'] = null;
    }
    return json;
  }

  /// Returns a new [Reward] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Reward? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Reward[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Reward[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Reward(
        content: mapValueOfType<String>(json, r'content'),
        name: mapValueOfType<String>(json, r'name'),
        point: mapValueOfType<int>(json, r'point'),
        user: CommentCommentsDataInnerAttributesUser.fromJson(json[r'user']),
        createdAt: mapDateTime(json, r'createdAt', r''),
        updatedAt: mapDateTime(json, r'updatedAt', r''),
        publishedAt: mapDateTime(json, r'publishedAt', r''),
        createdBy: AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole.fromJson(json[r'createdBy']),
        updatedBy: AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole.fromJson(json[r'updatedBy']),
      );
    }
    return null;
  }

  static List<Reward> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Reward>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Reward.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Reward> mapFromJson(dynamic json) {
    final map = <String, Reward>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Reward.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Reward-objects as value to a dart map
  static Map<String, List<Reward>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Reward>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Reward.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

