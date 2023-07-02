//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppUserListResponseMetaPagination {
  /// Returns a new [AppUserListResponseMetaPagination] instance.
  AppUserListResponseMetaPagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? page;

  /// Minimum value: 25
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? pageSize;

  /// Maximum value: 1
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? pageCount;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppUserListResponseMetaPagination &&
     other.page == page &&
     other.pageSize == pageSize &&
     other.pageCount == pageCount &&
     other.total == total;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (page == null ? 0 : page!.hashCode) +
    (pageSize == null ? 0 : pageSize!.hashCode) +
    (pageCount == null ? 0 : pageCount!.hashCode) +
    (total == null ? 0 : total!.hashCode);

  @override
  String toString() => 'AppUserListResponseMetaPagination[page=$page, pageSize=$pageSize, pageCount=$pageCount, total=$total]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.page != null) {
      json[r'page'] = this.page;
    } else {
      json[r'page'] = null;
    }
    if (this.pageSize != null) {
      json[r'pageSize'] = this.pageSize;
    } else {
      json[r'pageSize'] = null;
    }
    if (this.pageCount != null) {
      json[r'pageCount'] = this.pageCount;
    } else {
      json[r'pageCount'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
    return json;
  }

  /// Returns a new [AppUserListResponseMetaPagination] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppUserListResponseMetaPagination? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppUserListResponseMetaPagination[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppUserListResponseMetaPagination[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppUserListResponseMetaPagination(
        page: mapValueOfType<int>(json, r'page'),
        pageSize: mapValueOfType<int>(json, r'pageSize'),
        pageCount: mapValueOfType<int>(json, r'pageCount'),
        total: mapValueOfType<int>(json, r'total'),
      );
    }
    return null;
  }

  static List<AppUserListResponseMetaPagination> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserListResponseMetaPagination>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserListResponseMetaPagination.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserListResponseMetaPagination> mapFromJson(dynamic json) {
    final map = <String, AppUserListResponseMetaPagination>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserListResponseMetaPagination.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserListResponseMetaPagination-objects as value to a dart map
  static Map<String, List<AppUserListResponseMetaPagination>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppUserListResponseMetaPagination>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserListResponseMetaPagination.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

