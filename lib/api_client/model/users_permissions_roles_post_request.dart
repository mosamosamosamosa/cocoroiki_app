//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UsersPermissionsRolesPostRequest {
  /// Returns a new [UsersPermissionsRolesPostRequest] instance.
  UsersPermissionsRolesPostRequest({
    this.name,
    this.description,
    this.type,
    this.permissions = const {},
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
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  Map<String, UsersPermissionsPermissionsTreeValue> permissions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UsersPermissionsRolesPostRequest &&
     other.name == name &&
     other.description == description &&
     other.type == type &&
     other.permissions == permissions;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (permissions.hashCode);

  @override
  String toString() => 'UsersPermissionsRolesPostRequest[name=$name, description=$description, type=$type, permissions=$permissions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
      json[r'permissions'] = this.permissions;
    return json;
  }

  /// Returns a new [UsersPermissionsRolesPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UsersPermissionsRolesPostRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UsersPermissionsRolesPostRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UsersPermissionsRolesPostRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UsersPermissionsRolesPostRequest(
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        type: mapValueOfType<String>(json, r'type'),
        permissions: UsersPermissionsPermissionsTreeValue.mapFromJson(json[r'permissions']),
      );
    }
    return null;
  }

  static List<UsersPermissionsRolesPostRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UsersPermissionsRolesPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UsersPermissionsRolesPostRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UsersPermissionsRolesPostRequest> mapFromJson(dynamic json) {
    final map = <String, UsersPermissionsRolesPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UsersPermissionsRolesPostRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UsersPermissionsRolesPostRequest-objects as value to a dart map
  static Map<String, List<UsersPermissionsRolesPostRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UsersPermissionsRolesPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UsersPermissionsRolesPostRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

