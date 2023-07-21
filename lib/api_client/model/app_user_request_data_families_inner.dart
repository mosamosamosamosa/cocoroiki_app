//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppUserRequestDataFamiliesInner {
  final Map<String, dynamic> fields;

  AppUserRequestDataFamiliesInner({this.fields = const {}});

  Map<String, dynamic> toJson() {
    return fields;
  }

  static AppUserRequestDataFamiliesInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return AppUserRequestDataFamiliesInner(fields: json);
    }
    return null;
  }

  static List<AppUserRequestDataFamiliesInner> listFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final result = <AppUserRequestDataFamiliesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserRequestDataFamiliesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserRequestDataFamiliesInner> mapFromJson(
      dynamic json) {
    final map = <String, AppUserRequestDataFamiliesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserRequestDataFamiliesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserRequestDataFamiliesInner-objects as value to a dart map
  static Map<String, List<AppUserRequestDataFamiliesInner>> mapListFromJson(
    dynamic json, {
    bool growable = false,
  }) {
    final map = <String, List<AppUserRequestDataFamiliesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserRequestDataFamiliesInner.listFromJson(
          entry.value,
          growable: growable,
        );
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{};
}
