//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppUserRequestData {
  /// Returns a new [AppUserRequestData] instance.
  AppUserRequestData({
    this.name,
    this.email,
    this.password,
    this.birth,
    this.age,
    this.gender,
    this.lastLogin,
    this.families = const [],
    this.grandparent,
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
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? password;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? birth;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? age;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? gender;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastLogin;

  List<AppUserRequestDataFamiliesInner> families;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? grandparent;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppUserRequestData &&
     other.name == name &&
     other.email == email &&
     other.password == password &&
     other.birth == birth &&
     other.age == age &&
     other.gender == gender &&
     other.lastLogin == lastLogin &&
     other.families == families &&
     other.grandparent == grandparent;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name == null ? 0 : name!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (password == null ? 0 : password!.hashCode) +
    (birth == null ? 0 : birth!.hashCode) +
    (age == null ? 0 : age!.hashCode) +
    (gender == null ? 0 : gender!.hashCode) +
    (lastLogin == null ? 0 : lastLogin!.hashCode) +
    (families.hashCode) +
    (grandparent == null ? 0 : grandparent!.hashCode);

  @override
  String toString() => 'AppUserRequestData[name=$name, email=$email, password=$password, birth=$birth, age=$age, gender=$gender, lastLogin=$lastLogin, families=$families, grandparent=$grandparent]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.password != null) {
      json[r'password'] = this.password;
    } else {
      json[r'password'] = null;
    }
    if (this.birth != null) {
      json[r'birth'] = _dateFormatter.format(this.birth!.toUtc());
    } else {
      json[r'birth'] = null;
    }
    if (this.age != null) {
      json[r'age'] = this.age;
    } else {
      json[r'age'] = null;
    }
    if (this.gender != null) {
      json[r'gender'] = this.gender;
    } else {
      json[r'gender'] = null;
    }
    if (this.lastLogin != null) {
      json[r'last_login'] = this.lastLogin!.toUtc().toIso8601String();
    } else {
      json[r'last_login'] = null;
    }
      json[r'families'] = this.families;
    if (this.grandparent != null) {
      json[r'grandparent'] = this.grandparent;
    } else {
      json[r'grandparent'] = null;
    }
    return json;
  }

  /// Returns a new [AppUserRequestData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppUserRequestData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AppUserRequestData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AppUserRequestData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AppUserRequestData(
        name: mapValueOfType<String>(json, r'name'),
        email: mapValueOfType<String>(json, r'email'),
        password: mapValueOfType<String>(json, r'password'),
        birth: mapDateTime(json, r'birth', r''),
        age: mapValueOfType<int>(json, r'age'),
        gender: mapValueOfType<String>(json, r'gender'),
        lastLogin: mapDateTime(json, r'last_login', r''),
        families: AppUserRequestDataFamiliesInner.listFromJson(json[r'families']),
        grandparent: mapValueOfType<bool>(json, r'grandparent'),
      );
    }
    return null;
  }

  static List<AppUserRequestData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppUserRequestData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppUserRequestData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppUserRequestData> mapFromJson(dynamic json) {
    final map = <String, AppUserRequestData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppUserRequestData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppUserRequestData-objects as value to a dart map
  static Map<String, List<AppUserRequestData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppUserRequestData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppUserRequestData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

