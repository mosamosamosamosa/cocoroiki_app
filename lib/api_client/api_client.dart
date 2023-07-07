//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({this.basePath = 'http://localhost:1337/api', this.authentication,});

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty ? '?${urlEncodedQueryParams.join('&')}' : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (
        body is MultipartFile && (contentType == null ||
        !contentType.toLowerCase().startsWith('multipart/form-data'))
      ) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
          request.sink.add,
          onDone: request.sink.close,
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace trace) => request.sink.close(),
          cancelOnError: true,
        );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
        ? formParams
        : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch(method) {
        case 'POST': return await _client.post(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PUT': return await _client.put(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'DELETE': return await _client.delete(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PATCH': return await _client.patch(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'HEAD': return await _client.head(uri, headers: nullableHeaderParams,);
        case 'GET': return await _client.get(uri, headers: nullableHeaderParams,);
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(String value, String targetType, {bool growable = false,}) async =>
    // ignore: deprecated_member_use_from_same_package
    deserialize(value, targetType, growable: growable);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(String value, String targetType, {bool growable = false,}) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType = targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
      ? value
      : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(dynamic value, String targetType, {bool growable = false,}) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'AppUser':
          return AppUser.fromJson(value);
        case 'AppUserFamily':
          return AppUserFamily.fromJson(value);
        case 'AppUserFamilyData':
          return AppUserFamilyData.fromJson(value);
        case 'AppUserFamilyDataAttributes':
          return AppUserFamilyDataAttributes.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedBy':
          return AppUserFamilyDataAttributesCreatedBy.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByData':
          return AppUserFamilyDataAttributesCreatedByData.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributes':
          return AppUserFamilyDataAttributesCreatedByDataAttributes.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRoles':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRoles.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInner':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInner.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributes.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissions.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInner':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInner.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributes':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributes.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesPermissionsDataInnerAttributesRole.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesUsers':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesUsers.fromJson(value);
        case 'AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesUsersDataInner':
          return AppUserFamilyDataAttributesCreatedByDataAttributesRolesDataInnerAttributesUsersDataInner.fromJson(value);
        case 'AppUserListResponse':
          return AppUserListResponse.fromJson(value);
        case 'AppUserListResponseDataItem':
          return AppUserListResponseDataItem.fromJson(value);
        case 'AppUserListResponseMeta':
          return AppUserListResponseMeta.fromJson(value);
        case 'AppUserListResponseMetaPagination':
          return AppUserListResponseMetaPagination.fromJson(value);
        case 'AppUserRequest':
          return AppUserRequest.fromJson(value);
        case 'AppUserRequestData':
          return AppUserRequestData.fromJson(value);
        case 'AppUserRequestDataFamily':
          return AppUserRequestDataFamily.fromJson(value);
        case 'AppUserResponse':
          return AppUserResponse.fromJson(value);
        case 'AppUserResponseDataObject':
          return AppUserResponseDataObject.fromJson(value);
        case 'AuthChangePasswordPostRequest':
          return AuthChangePasswordPostRequest.fromJson(value);
        case 'AuthForgotPasswordPost200Response':
          return AuthForgotPasswordPost200Response.fromJson(value);
        case 'AuthForgotPasswordPostRequest':
          return AuthForgotPasswordPostRequest.fromJson(value);
        case 'AuthLocalPostRequest':
          return AuthLocalPostRequest.fromJson(value);
        case 'AuthLocalRegisterPostRequest':
          return AuthLocalRegisterPostRequest.fromJson(value);
        case 'AuthResetPasswordPostRequest':
          return AuthResetPasswordPostRequest.fromJson(value);
        case 'AuthSendEmailConfirmationPost200Response':
          return AuthSendEmailConfirmationPost200Response.fromJson(value);
        case 'Comment':
          return Comment.fromJson(value);
        case 'CommentComments':
          return CommentComments.fromJson(value);
        case 'CommentCommentsDataInner':
          return CommentCommentsDataInner.fromJson(value);
        case 'CommentCommentsDataInnerAttributes':
          return CommentCommentsDataInnerAttributes.fromJson(value);
        case 'CommentCommentsDataInnerAttributesUser':
          return CommentCommentsDataInnerAttributesUser.fromJson(value);
        case 'CommentCommentsDataInnerAttributesUserData':
          return CommentCommentsDataInnerAttributesUserData.fromJson(value);
        case 'CommentCommentsDataInnerAttributesUserDataAttributes':
          return CommentCommentsDataInnerAttributesUserDataAttributes.fromJson(value);
        case 'CommentListResponse':
          return CommentListResponse.fromJson(value);
        case 'CommentListResponseDataItem':
          return CommentListResponseDataItem.fromJson(value);
        case 'CommentRequest':
          return CommentRequest.fromJson(value);
        case 'CommentRequestData':
          return CommentRequestData.fromJson(value);
        case 'CommentResponse':
          return CommentResponse.fromJson(value);
        case 'CommentResponseDataObject':
          return CommentResponseDataObject.fromJson(value);
        case 'Error':
          return Error.fromJson(value);
        case 'ErrorData':
          return ErrorData.fromJson(value);
        case 'ErrorError':
          return ErrorError.fromJson(value);
        case 'Family':
          return Family.fromJson(value);
        case 'FamilyListResponse':
          return FamilyListResponse.fromJson(value);
        case 'FamilyListResponseDataItem':
          return FamilyListResponseDataItem.fromJson(value);
        case 'FamilyRequest':
          return FamilyRequest.fromJson(value);
        case 'FamilyRequestData':
          return FamilyRequestData.fromJson(value);
        case 'FamilyResponse':
          return FamilyResponse.fromJson(value);
        case 'FamilyResponseDataObject':
          return FamilyResponseDataObject.fromJson(value);
        case 'Post':
          return Post.fromJson(value);
        case 'PostComments':
          return PostComments.fromJson(value);
        case 'PostCommentsDataInner':
          return PostCommentsDataInner.fromJson(value);
        case 'PostCommentsDataInnerAttributes':
          return PostCommentsDataInnerAttributes.fromJson(value);
        case 'PostImages':
          return PostImages.fromJson(value);
        case 'PostImagesDataInner':
          return PostImagesDataInner.fromJson(value);
        case 'PostImagesDataInnerAttributes':
          return PostImagesDataInnerAttributes.fromJson(value);
        case 'PostImagesDataInnerAttributesFolder':
          return PostImagesDataInnerAttributesFolder.fromJson(value);
        case 'PostImagesDataInnerAttributesFolderData':
          return PostImagesDataInnerAttributesFolderData.fromJson(value);
        case 'PostImagesDataInnerAttributesFolderDataAttributes':
          return PostImagesDataInnerAttributesFolderDataAttributes.fromJson(value);
        case 'PostImagesDataInnerAttributesFolderDataAttributesFiles':
          return PostImagesDataInnerAttributesFolderDataAttributesFiles.fromJson(value);
        case 'PostImagesDataInnerAttributesFolderDataAttributesFilesDataInner':
          return PostImagesDataInnerAttributesFolderDataAttributesFilesDataInner.fromJson(value);
        case 'PostImagesDataInnerAttributesFolderDataAttributesFilesDataInnerAttributes':
          return PostImagesDataInnerAttributesFolderDataAttributesFilesDataInnerAttributes.fromJson(value);
        case 'PostListResponse':
          return PostListResponse.fromJson(value);
        case 'PostListResponseDataItem':
          return PostListResponseDataItem.fromJson(value);
        case 'PostRequest':
          return PostRequest.fromJson(value);
        case 'PostRequestData':
          return PostRequestData.fromJson(value);
        case 'PostResponse':
          return PostResponse.fromJson(value);
        case 'PostResponseDataObject':
          return PostResponseDataObject.fromJson(value);
        case 'Profile':
          return Profile.fromJson(value);
        case 'ProfileImage':
          return ProfileImage.fromJson(value);
        case 'ProfileListResponse':
          return ProfileListResponse.fromJson(value);
        case 'ProfileListResponseDataItem':
          return ProfileListResponseDataItem.fromJson(value);
        case 'ProfileRequest':
          return ProfileRequest.fromJson(value);
        case 'ProfileRequestData':
          return ProfileRequestData.fromJson(value);
        case 'ProfileResponse':
          return ProfileResponse.fromJson(value);
        case 'ProfileResponseDataObject':
          return ProfileResponseDataObject.fromJson(value);
        case 'Quest':
          return Quest.fromJson(value);
        case 'QuestKind':
          return QuestKind.fromJson(value);
        case 'QuestKindListResponse':
          return QuestKindListResponse.fromJson(value);
        case 'QuestKindListResponseDataItem':
          return QuestKindListResponseDataItem.fromJson(value);
        case 'QuestKindRequest':
          return QuestKindRequest.fromJson(value);
        case 'QuestKindRequestData':
          return QuestKindRequestData.fromJson(value);
        case 'QuestKindResponse':
          return QuestKindResponse.fromJson(value);
        case 'QuestKindResponseDataObject':
          return QuestKindResponseDataObject.fromJson(value);
        case 'QuestListResponse':
          return QuestListResponse.fromJson(value);
        case 'QuestListResponseDataItem':
          return QuestListResponseDataItem.fromJson(value);
        case 'QuestQuestKinds':
          return QuestQuestKinds.fromJson(value);
        case 'QuestQuestKindsDataInner':
          return QuestQuestKindsDataInner.fromJson(value);
        case 'QuestQuestKindsDataInnerAttributes':
          return QuestQuestKindsDataInnerAttributes.fromJson(value);
        case 'QuestRequest':
          return QuestRequest.fromJson(value);
        case 'QuestRequestData':
          return QuestRequestData.fromJson(value);
        case 'QuestResponse':
          return QuestResponse.fromJson(value);
        case 'QuestResponseDataObject':
          return QuestResponseDataObject.fromJson(value);
        case 'QuestReward':
          return QuestReward.fromJson(value);
        case 'QuestRewardData':
          return QuestRewardData.fromJson(value);
        case 'QuestRewardDataAttributes':
          return QuestRewardDataAttributes.fromJson(value);
        case 'QuestRewardDataAttributesUser':
          return QuestRewardDataAttributesUser.fromJson(value);
        case 'QuestRewardDataAttributesUserData':
          return QuestRewardDataAttributesUserData.fromJson(value);
        case 'QuestRewardDataAttributesUserDataAttributes':
          return QuestRewardDataAttributesUserDataAttributes.fromJson(value);
        case 'QuestRewardDataAttributesUserDataAttributesFamily':
          return QuestRewardDataAttributesUserDataAttributesFamily.fromJson(value);
        case 'QuestRewardDataAttributesUserDataAttributesFamilyData':
          return QuestRewardDataAttributesUserDataAttributesFamilyData.fromJson(value);
        case 'QuestRewardDataAttributesUserDataAttributesFamilyDataAttributes':
          return QuestRewardDataAttributesUserDataAttributesFamilyDataAttributes.fromJson(value);
        case 'Reward':
          return Reward.fromJson(value);
        case 'RewardListResponse':
          return RewardListResponse.fromJson(value);
        case 'RewardListResponseDataItem':
          return RewardListResponseDataItem.fromJson(value);
        case 'RewardRequest':
          return RewardRequest.fromJson(value);
        case 'RewardRequestData':
          return RewardRequestData.fromJson(value);
        case 'RewardResponse':
          return RewardResponse.fromJson(value);
        case 'RewardResponseDataObject':
          return RewardResponseDataObject.fromJson(value);
        case 'Tree':
          return Tree.fromJson(value);
        case 'TreeListResponse':
          return TreeListResponse.fromJson(value);
        case 'TreeListResponseDataItem':
          return TreeListResponseDataItem.fromJson(value);
        case 'TreeRequest':
          return TreeRequest.fromJson(value);
        case 'TreeRequestData':
          return TreeRequestData.fromJson(value);
        case 'TreeResponse':
          return TreeResponse.fromJson(value);
        case 'TreeResponseDataObject':
          return TreeResponseDataObject.fromJson(value);
        case 'TreeUsers':
          return TreeUsers.fromJson(value);
        case 'UploadFile':
          return UploadFile.fromJson(value);
        case 'UsersIdDelete200Response':
          return UsersIdDelete200Response.fromJson(value);
        case 'UsersPermissionsPermissionsGet200Response':
          return UsersPermissionsPermissionsGet200Response.fromJson(value);
        case 'UsersPermissionsPermissionsTreeValue':
          return UsersPermissionsPermissionsTreeValue.fromJson(value);
        case 'UsersPermissionsPermissionsTreeValueControllersValueValue':
          return UsersPermissionsPermissionsTreeValueControllersValueValue.fromJson(value);
        case 'UsersPermissionsRole':
          return UsersPermissionsRole.fromJson(value);
        case 'UsersPermissionsRolesGet200Response':
          return UsersPermissionsRolesGet200Response.fromJson(value);
        case 'UsersPermissionsRolesGet200ResponseRolesInner':
          return UsersPermissionsRolesGet200ResponseRolesInner.fromJson(value);
        case 'UsersPermissionsRolesIdGet200Response':
          return UsersPermissionsRolesIdGet200Response.fromJson(value);
        case 'UsersPermissionsRolesPostRequest':
          return UsersPermissionsRolesPostRequest.fromJson(value);
        case 'UsersPermissionsUser':
          return UsersPermissionsUser.fromJson(value);
        case 'UsersPermissionsUserRegistration':
          return UsersPermissionsUserRegistration.fromJson(value);
        case 'UsersPost201Response':
          return UsersPost201Response.fromJson(value);
        case 'UsersPostRequest':
          return UsersPostRequest.fromJson(value);
        default:
          dynamic match;
          if (value is List && (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toList(growable: growable);
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toSet();
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,)),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(HttpStatus.internalServerError, 'Exception during deserialization.', error, trace,);
    }
    throw ApiException(HttpStatus.internalServerError, 'Could not find a suitable class for deserialization',);
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : ApiClient.fromJson(
        json.decode(message.json),
        targetType,
        growable: message.growable,
      );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async => value == null ? '' : json.encode(value);