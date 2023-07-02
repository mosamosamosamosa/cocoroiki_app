//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions {
  /// Returns a new [AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions] instance.
  AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions({
    this.data = const [],
  });

  List<AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInner> data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode);

  @override
  String toString() => 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions[data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
    return json;
  }

  /// Returns a new [AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions(
        data: AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInner.listFromJson(json[r'data']),
      );
    }
    return null;
  }

  static List<AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions> mapFromJson(dynamic json) {
    final map = <String, AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions-objects as value to a dart map
  static Map<String, List<AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

