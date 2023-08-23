//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UploadFileApi {
  UploadFileApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'GET /upload/files' operation and returns the [Response].
  Future<Response> uploadFilesGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/upload/files';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  Future<List<UploadFile>?> uploadFilesGet() async {
    final response = await uploadFilesGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UploadFile>')
              as List)
          .cast<UploadFile>()
          .toList(growable: false);
    }
    return null;
  }

  /// Performs an HTTP 'DELETE /upload/files/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  Future<Response> uploadFilesIdDeleteWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/upload/files/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  Future<UploadFile?> uploadFilesIdDelete(
    String id,
  ) async {
    final response = await uploadFilesIdDeleteWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'UploadFile',
      ) as UploadFile;
    }
    return null;
  }

  /// Performs an HTTP 'GET /upload/files/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  Future<Response> uploadFilesIdGetWithHttpInfo(
    String id,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/upload/files/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  Future<UploadFile?> uploadFilesIdGet(
    String id,
  ) async {
    final response = await uploadFilesIdGetWithHttpInfo(
      id,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'UploadFile',
      ) as UploadFile;
    }
    return null;
  }

  ///
  ///
  /// Upload file information
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   File id
  ///
  /// * [UploadIdPostRequestFileInfo] fileInfo:
  ///
  /// * [MultipartFile] files:
  Future<Response> uploadIdPostWithHttpInfo(
    String id, {
    fileInfo,
    MultipartFile? files,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/upload/{id}'.replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (fileInfo != null) {
      hasFields = true;
      mp.fields[r'fileInfo'] = parameterToString(fileInfo);
    }
    if (files != null) {
      hasFields = true;
      mp.fields[r'files'] = files.field;
      mp.files.add(files);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  ///
  ///
  /// Upload file information
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   File id
  ///
  /// * [UploadIdPostRequestFileInfo] fileInfo:
  ///
  /// * [MultipartFile] files:
  Future<List<UploadFile>?> uploadIdPost(
    String id, {
    fileInfo,
    MultipartFile? files,
  }) async {
    final response = await uploadIdPostWithHttpInfo(
      id,
      fileInfo: fileInfo,
      files: files,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UploadFile>')
              as List)
          .cast<UploadFile>()
          .toList(growable: false);
    }
    return null;
  }

  ///
  ///
  /// Upload files
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<MultipartFile>] files (required):
  ///
  /// * [String] path:
  ///   The folder where the file(s) will be uploaded to (only supported on strapi-provider-upload-aws-s3).
  ///
  /// * [String] refId:
  ///   The ID of the entry which the file(s) will be linked to
  ///
  /// * [String] ref:
  ///   The unique ID (uid) of the model which the file(s) will be linked to (api::restaurant.restaurant).
  ///
  /// * [String] field:
  ///   The field of the entry which the file(s) will be precisely linked to.
  Future<Response> uploadPostWithHttpInfo(
    List<MultipartFile> files, {
    String? path,
    String? refId,
    String? ref,
    String? field,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/upload';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (path != null) {
      hasFields = true;
      mp.fields[r'path'] = parameterToString(path);
    }
    if (refId != null) {
      hasFields = true;
      mp.fields[r'refId'] = parameterToString(refId);
    }
    if (ref != null) {
      hasFields = true;
      mp.fields[r'ref'] = parameterToString(ref);
    }
    if (field != null) {
      hasFields = true;
      mp.fields[r'field'] = parameterToString(field);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  ///
  ///
  /// Upload files
  ///
  /// Parameters:
  ///
  /// * [List<MultipartFile>] files (required):
  ///
  /// * [String] path:
  ///   The folder where the file(s) will be uploaded to (only supported on strapi-provider-upload-aws-s3).
  ///
  /// * [String] refId:
  ///   The ID of the entry which the file(s) will be linked to
  ///
  /// * [String] ref:
  ///   The unique ID (uid) of the model which the file(s) will be linked to (api::restaurant.restaurant).
  ///
  /// * [String] field:
  ///   The field of the entry which the file(s) will be precisely linked to.
  Future<List<UploadFile>?> uploadPost(
    List<MultipartFile> files, {
    String? path,
    String? refId,
    String? ref,
    String? field,
  }) async {
    final response = await uploadPostWithHttpInfo(
      files,
      path: path,
      refId: refId,
      ref: ref,
      field: field,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UploadFile>')
              as List)
          .cast<UploadFile>()
          .toList(growable: false);
    }
    return null;
  }
}
