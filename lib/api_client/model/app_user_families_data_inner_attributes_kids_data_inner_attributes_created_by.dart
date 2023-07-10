//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy {
  /// Returns a new [AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy] instance.
  AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy({
    this.data,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByData? data;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy &&
     other.data == data;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data == null ? 0 : data!.hashCode);

  @override
  String toString() => 'AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy[data=$data]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.data != null) {
      json[r'data'] = this.data;
    } else {
      json[r'data'] = null;
    }
    return json;
  }

  /// Returns a new [AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy(
        data: AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedByData.fromJson(json[r'data']),
      );
    }
    return null;
  }

  static List<AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy> mapFromJson(dynamic json) {
    final map = <String, AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy-objects as value to a dart map
  static Map<String, List<AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserFamiliesDataInnerAttributesKidsDataInnerAttributesCreatedBy.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

