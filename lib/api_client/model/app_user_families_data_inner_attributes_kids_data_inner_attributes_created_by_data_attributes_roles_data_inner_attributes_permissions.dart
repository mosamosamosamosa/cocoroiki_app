//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions {
  /// Returns a new [AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions] instance.
  AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions({
    this.data = const [],
  });

  List<AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInner> data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode);

  @override
  String toString() => 'AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions[data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
    return json;
  }

  /// Returns a new [AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions(
        data: AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInner.listFromJson(json[r'data']),
      );
    }
    return null;
  }

  static List<AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions> mapFromJson(dynamic json) {
    final map = <String, AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions-objects as value to a dart map
  static Map<String, List<AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

