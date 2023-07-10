//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner {
  /// Returns a new [CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner] instance.
  CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner({
    this.id,
    this.attributes,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInnerAttributes? attributes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner &&
     other.id == id &&
     other.attributes == attributes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (attributes == null ? 0 : attributes!.hashCode);

  @override
  String toString() => 'CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner[id=$id, attributes=$attributes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.attributes != null) {
      json[r'attributes'] = this.attributes;
    } else {
      json[r'attributes'] = null;
    }
    return json;
  }

  /// Returns a new [CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner(
        id: num.parse('${json[r'id']}'),
        attributes: CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInnerAttributes.fromJson(json[r'attributes']),
      );
    }
    return null;
  }

  static List<CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner> mapFromJson(dynamic json) {
    final map = <String, CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner-objects as value to a dart map
  static Map<String, List<CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CommentCommentsDataInnerAttributesUserDataAttributesFamiliesDataInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

