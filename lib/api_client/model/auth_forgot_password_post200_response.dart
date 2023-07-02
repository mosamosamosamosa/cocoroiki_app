//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthForgotPasswordPost200Response {
  /// Returns a new [AuthForgotPasswordPost200Response] instance.
  AuthForgotPasswordPost200Response({
    this.ok,
  });

  AuthForgotPasswordPost200ResponseOkEnum? ok;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AuthForgotPasswordPost200Response &&
     other.ok == ok;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ok == null ? 0 : ok!.hashCode);

  @override
  String toString() => 'AuthForgotPasswordPost200Response[ok=$ok]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ok != null) {
      json[r'ok'] = this.ok;
    } else {
      json[r'ok'] = null;
    }
    return json;
  }

  /// Returns a new [AuthForgotPasswordPost200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AuthForgotPasswordPost200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "AuthForgotPasswordPost200Response[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "AuthForgotPasswordPost200Response[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return AuthForgotPasswordPost200Response(
        ok: AuthForgotPasswordPost200ResponseOkEnum.fromJson(json[r'ok']),
      );
    }
    return null;
  }

  static List<AuthForgotPasswordPost200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthForgotPasswordPost200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthForgotPasswordPost200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AuthForgotPasswordPost200Response> mapFromJson(dynamic json) {
    final map = <String, AuthForgotPasswordPost200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AuthForgotPasswordPost200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AuthForgotPasswordPost200Response-objects as value to a dart map
  static Map<String, List<AuthForgotPasswordPost200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AuthForgotPasswordPost200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AuthForgotPasswordPost200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


class AuthForgotPasswordPost200ResponseOkEnum {
  /// Instantiate a new enum with the provided [value].
  const AuthForgotPasswordPost200ResponseOkEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const true_ = AuthForgotPasswordPost200ResponseOkEnum._(r'true');

  /// List of all possible values in this [enum][AuthForgotPasswordPost200ResponseOkEnum].
  static const values = <AuthForgotPasswordPost200ResponseOkEnum>[
    true_,
  ];

  static AuthForgotPasswordPost200ResponseOkEnum? fromJson(dynamic value) => AuthForgotPasswordPost200ResponseOkEnumTypeTransformer().decode(value);

  static List<AuthForgotPasswordPost200ResponseOkEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AuthForgotPasswordPost200ResponseOkEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AuthForgotPasswordPost200ResponseOkEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AuthForgotPasswordPost200ResponseOkEnum] to String,
/// and [decode] dynamic data back to [AuthForgotPasswordPost200ResponseOkEnum].
class AuthForgotPasswordPost200ResponseOkEnumTypeTransformer {
  factory AuthForgotPasswordPost200ResponseOkEnumTypeTransformer() => _instance ??= const AuthForgotPasswordPost200ResponseOkEnumTypeTransformer._();

  const AuthForgotPasswordPost200ResponseOkEnumTypeTransformer._();

  String encode(AuthForgotPasswordPost200ResponseOkEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a AuthForgotPasswordPost200ResponseOkEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AuthForgotPasswordPost200ResponseOkEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'true': return AuthForgotPasswordPost200ResponseOkEnum.true_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [AuthForgotPasswordPost200ResponseOkEnumTypeTransformer] instance.
  static AuthForgotPasswordPost200ResponseOkEnumTypeTransformer? _instance;
}


