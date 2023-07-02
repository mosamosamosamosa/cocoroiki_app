//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class QuestApi {
  QuestApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs an HTTP 'DELETE /quests/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  ///   
  Future<Response> deleteQuestsIdWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/quests/{id}'
      .replaceAll('{id}', id.toString());

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
  /// * [num] id (required):
  ///   
  Future<int?> deleteQuestsId(num id,) async {
    final response = await deleteQuestsIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /quests' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [String] sort:
  ///   Sort by attributes ascending (asc) or descending (desc)
  ///
  /// * [bool] paginationLeftSquareBracketWithCountRightSquareBracket:
  ///   Return page/pageSize (default: true)
  ///
  /// * [int] paginationLeftSquareBracketPageRightSquareBracket:
  ///   Page number (default: 0)
  ///
  /// * [int] paginationLeftSquareBracketPageSizeRightSquareBracket:
  ///   Page size (default: 25)
  ///
  /// * [int] paginationLeftSquareBracketStartRightSquareBracket:
  ///   Offset value (default: 0)
  ///
  /// * [int] paginationLeftSquareBracketLimitRightSquareBracket:
  ///   Number of entities to return (default: 25)
  ///
  /// * [String] fields:
  ///   Fields to return (ex: title,author)
  ///
  /// * [String] populate:
  ///   Relations to return
  ///
  /// * [Object] filters:
  ///   Filters to apply
  ///
  /// * [String] locale:
  ///   Locale to apply
  Future<Response> getQuestsWithHttpInfo({ String? sort, bool? paginationLeftSquareBracketWithCountRightSquareBracket, int? paginationLeftSquareBracketPageRightSquareBracket, int? paginationLeftSquareBracketPageSizeRightSquareBracket, int? paginationLeftSquareBracketStartRightSquareBracket, int? paginationLeftSquareBracketLimitRightSquareBracket, String? fields, String? populate, Object? filters, String? locale, }) async {
    // ignore: prefer_const_declarations
    final path = r'/quests';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (paginationLeftSquareBracketWithCountRightSquareBracket != null) {
      queryParams.addAll(_queryParams('', 'pagination[withCount]', paginationLeftSquareBracketWithCountRightSquareBracket));
    }
    if (paginationLeftSquareBracketPageRightSquareBracket != null) {
      queryParams.addAll(_queryParams('', 'pagination[page]', paginationLeftSquareBracketPageRightSquareBracket));
    }
    if (paginationLeftSquareBracketPageSizeRightSquareBracket != null) {
      queryParams.addAll(_queryParams('', 'pagination[pageSize]', paginationLeftSquareBracketPageSizeRightSquareBracket));
    }
    if (paginationLeftSquareBracketStartRightSquareBracket != null) {
      queryParams.addAll(_queryParams('', 'pagination[start]', paginationLeftSquareBracketStartRightSquareBracket));
    }
    if (paginationLeftSquareBracketLimitRightSquareBracket != null) {
      queryParams.addAll(_queryParams('', 'pagination[limit]', paginationLeftSquareBracketLimitRightSquareBracket));
    }
    if (fields != null) {
      queryParams.addAll(_queryParams('', 'fields', fields));
    }
    if (populate != null) {
      queryParams.addAll(_queryParams('', 'populate', populate));
    }
    if (filters != null) {
      queryParams.addAll(_queryParams('', 'filters', filters));
    }
    if (locale != null) {
      queryParams.addAll(_queryParams('', 'locale', locale));
    }

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
  /// * [String] sort:
  ///   Sort by attributes ascending (asc) or descending (desc)
  ///
  /// * [bool] paginationLeftSquareBracketWithCountRightSquareBracket:
  ///   Return page/pageSize (default: true)
  ///
  /// * [int] paginationLeftSquareBracketPageRightSquareBracket:
  ///   Page number (default: 0)
  ///
  /// * [int] paginationLeftSquareBracketPageSizeRightSquareBracket:
  ///   Page size (default: 25)
  ///
  /// * [int] paginationLeftSquareBracketStartRightSquareBracket:
  ///   Offset value (default: 0)
  ///
  /// * [int] paginationLeftSquareBracketLimitRightSquareBracket:
  ///   Number of entities to return (default: 25)
  ///
  /// * [String] fields:
  ///   Fields to return (ex: title,author)
  ///
  /// * [String] populate:
  ///   Relations to return
  ///
  /// * [Object] filters:
  ///   Filters to apply
  ///
  /// * [String] locale:
  ///   Locale to apply
  Future<QuestListResponse?> getQuests({ String? sort, bool? paginationLeftSquareBracketWithCountRightSquareBracket, int? paginationLeftSquareBracketPageRightSquareBracket, int? paginationLeftSquareBracketPageSizeRightSquareBracket, int? paginationLeftSquareBracketStartRightSquareBracket, int? paginationLeftSquareBracketLimitRightSquareBracket, String? fields, String? populate, Object? filters, String? locale, }) async {
    final response = await getQuestsWithHttpInfo( sort: sort, paginationLeftSquareBracketWithCountRightSquareBracket: paginationLeftSquareBracketWithCountRightSquareBracket, paginationLeftSquareBracketPageRightSquareBracket: paginationLeftSquareBracketPageRightSquareBracket, paginationLeftSquareBracketPageSizeRightSquareBracket: paginationLeftSquareBracketPageSizeRightSquareBracket, paginationLeftSquareBracketStartRightSquareBracket: paginationLeftSquareBracketStartRightSquareBracket, paginationLeftSquareBracketLimitRightSquareBracket: paginationLeftSquareBracketLimitRightSquareBracket, fields: fields, populate: populate, filters: filters, locale: locale, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuestListResponse',) as QuestListResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'GET /quests/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  ///   
  Future<Response> getQuestsIdWithHttpInfo(num id,) async {
    // ignore: prefer_const_declarations
    final path = r'/quests/{id}'
      .replaceAll('{id}', id.toString());

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
  /// * [num] id (required):
  ///   
  Future<QuestResponse?> getQuestsId(num id,) async {
    final response = await getQuestsIdWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuestResponse',) as QuestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'POST /quests' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [QuestRequest] questRequest (required):
  Future<Response> postQuestsWithHttpInfo(QuestRequest questRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/quests';

    // ignore: prefer_final_locals
    Object? postBody = questRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Parameters:
  ///
  /// * [QuestRequest] questRequest (required):
  Future<QuestResponse?> postQuests(QuestRequest questRequest,) async {
    final response = await postQuestsWithHttpInfo(questRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuestResponse',) as QuestResponse;
    
    }
    return null;
  }

  /// Performs an HTTP 'PUT /quests/{id}' operation and returns the [Response].
  /// Parameters:
  ///
  /// * [num] id (required):
  ///   
  ///
  /// * [QuestRequest] questRequest (required):
  Future<Response> putQuestsIdWithHttpInfo(num id, QuestRequest questRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/quests/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = questRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Parameters:
  ///
  /// * [num] id (required):
  ///   
  ///
  /// * [QuestRequest] questRequest (required):
  Future<QuestResponse?> putQuestsId(num id, QuestRequest questRequest,) async {
    final response = await putQuestsIdWithHttpInfo(id, questRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'QuestResponse',) as QuestResponse;
    
    }
    return null;
  }
}
