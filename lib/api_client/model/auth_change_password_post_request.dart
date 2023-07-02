//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthChangePasswordPostRequest {
  /// Returns a new [AuthChangePasswordPostRequest] instance.
  AuthChangePasswordPostRequest({
    required this.password,
    required this.currentPassword,
    required this.passwordConfirmation,
  });

  String password;

  String currentPassword;

  String passwordConfirmation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthChangePasswordPostRequest &&
     other.password == password &&
     other.currentPassword == currentPassword &&
     other.passwordConfirmation == passwordConfirmation;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (password.hashCode) +
    (currentPassword.hashCode) +
    (passwordConfirmation.hashCode);

  @override
  String toString() => 'AuthChangePasswordPostRequest[password=$password, currentPassword=$currentPassword, passwordConfirmation=$passwordConfirmation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'password'] = this.password;
      json[r'currentPassword'] = this.currentPassword;
      json[r'passwordConfirmation'] = this.passwordConfirmation;
    return json;
  }

  /// Returns a new [AuthChangePasswordPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthChangePasswordPostRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthChangePasswordPostRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthChangePasswordPostRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthChangePasswordPostRequest(
        password: mapValueOfType<String>(json, r'password')!,
        currentPassword: mapValueOfType<String>(json, r'currentPassword')!,
        passwordConfirmation: mapValueOfType<String>(json, r'passwordConfirmation')!,
      );
    }
    return null;
  }

  static List<AuthChangePasswordPostRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthChangePasswordPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthChangePasswordPostRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthChangePasswordPostRequest> mapFromJson(dynamic json) {
    final map = <String, AuthChangePasswordPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthChangePasswordPostRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthChangePasswordPostRequest-objects as value to a dart map
  static Map<String, List<AuthChangePasswordPostRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthChangePasswordPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthChangePasswordPostRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'password',
    'currentPassword',
    'passwordConfirmation',
  };
}

