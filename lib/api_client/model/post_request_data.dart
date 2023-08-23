//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostRequestData {
  /// Returns a new [PostRequestData] instance.
  PostRequestData({
    this.user,
    this.content,
    this.kids = const [],
    this.images = const [],
    this.comments = const [],
    this.appUsers = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AppUserRequestDataFamiliesInner? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? content;

  List<AppUserRequestDataFamiliesInner> kids;

  List<AppUserRequestDataFamiliesInner> images;

  List<AppUserRequestDataFamiliesInner> comments;

  List<AppUserRequestDataFamiliesInner> appUsers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostRequestData &&
     other.user == user &&
     other.content == content &&
     other.kids == kids &&
     other.images == images &&
     other.comments == comments &&
     other.appUsers == appUsers;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (user == null ? 0 : user!.hashCode) +
    (content == null ? 0 : content!.hashCode) +
    (kids.hashCode) +
    (images.hashCode) +
    (comments.hashCode) +
    (appUsers.hashCode);

  @override
  String toString() => 'PostRequestData[user=$user, content=$content, kids=$kids, images=$images, comments=$comments, appUsers=$appUsers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.content != null) {
      json[r'content'] = this.content;
    } else {
      json[r'content'] = null;
    }
      json[r'kids'] = this.kids;
      json[r'images'] = this.images;
      json[r'comments'] = this.comments;
      json[r'app_users'] = this.appUsers;
    return json;
  }

  /// Returns a new [PostRequestData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostRequestData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PostRequestData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PostRequestData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PostRequestData(
        user: AppUserRequestDataFamiliesInner.fromJson(json[r'user']),
        content: mapValueOfType<String>(json, r'content'),
        kids: AppUserRequestDataFamiliesInner.listFromJson(json[r'kids']),
        images: AppUserRequestDataFamiliesInner.listFromJson(json[r'images']),
        comments: AppUserRequestDataFamiliesInner.listFromJson(json[r'comments']),
        appUsers: AppUserRequestDataFamiliesInner.listFromJson(json[r'app_users']),
      );
    }
    return null;
  }

  static List<PostRequestData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostRequestData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostRequestData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostRequestData> mapFromJson(dynamic json) {
    final map = <String, PostRequestData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostRequestData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostRequestData-objects as value to a dart map
  static Map<String, List<PostRequestData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostRequestData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostRequestData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

