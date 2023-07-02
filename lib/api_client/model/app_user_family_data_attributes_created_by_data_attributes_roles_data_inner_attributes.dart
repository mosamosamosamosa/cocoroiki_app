//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes {
  /// Returns a new [AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes] instance.
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes({
    this.name,
    this.code,
    this.description,
    this.users,
    this.permissions,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

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
  String? code;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesUsers? users;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions? permissions;

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
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole? createdBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole? updatedBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes &&
     other.name == name &&
     other.code == code &&
     other.description == description &&
     other.users == users &&
     other.permissions == permissions &&
     other.createdAt == createdAt &&
     other.updatedAt == updatedAt &&
     other.createdBy == createdBy &&
     other.updatedBy == updatedBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (users == null ? 0 : users!.hashCode) +
    (permissions == null ? 0 : permissions!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (createdBy == null ? 0 : createdBy!.hashCode) +
    (updatedBy == null ? 0 : updatedBy!.hashCode);

  @override
  String toString() => 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes[name=$name, code=$code, description=$description, users=$users, permissions=$permissions, createdAt=$createdAt, updatedAt=$updatedAt, createdBy=$createdBy, updatedBy=$updatedBy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.users != null) {
      json[r'users'] = this.users;
    } else {
      json[r'users'] = null;
    }
    if (this.permissions != null) {
      json[r'permissions'] = this.permissions;
    } else {
      json[r'permissions'] = null;
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

  /// Returns a new [AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes(
        name: mapValueOfType<String>(json, r'name'),
        code: mapValueOfType<String>(json, r'code'),
        description: mapValueOfType<String>(json, r'description'),
        users: AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesUsers.fromJson(json[r'users']),
        permissions: AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.fromJson(json[r'permissions']),
        createdAt: mapDateTime(json, r'createdAt', r''),
        updatedAt: mapDateTime(json, r'updatedAt', r''),
        createdBy: AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole.fromJson(json[r'createdBy']),
        updatedBy: AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole.fromJson(json[r'updatedBy']),
      );
    }
    return null;
  }

  static List<AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes> mapFromJson(dynamic json) {
    final map = <String, AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes-objects as value to a dart map
  static Map<String, List<AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

