//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UsersPermissionsUsersRolesApi {
  UsersPermissionsUsersRolesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get user count
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> usersCountGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/users/count';

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

  /// Get user count
  Future<num?> usersCountGet() async {
    final response = await usersCountGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'num',) as num;
    
    }
    return null;
  }

  /// Get list of users
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> usersGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/users';

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

  /// Get list of users
  Future<List<UsersPermissionsUser>?> usersGet() async {
    final response = await usersGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UsersPermissionsUser>') as List)
        .cast<UsersPermissionsUser>()
        .toList(growable: false);

    }
    return null;
  }

  /// Delete a user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   user Id
  Future<Response> usersIdDeleteWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{id}'
      .replaceAll('{id}', id);

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

  /// Delete a user
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   user Id
  Future<UsersPermissionsUser?> usersIdDelete(String id,) async {
    final response = await usersIdDeleteWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUser',) as UsersPermissionsUser;
    
    }
    return null;
  }

  /// Get a user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   user Id
  Future<Response> usersIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{id}'
      .replaceAll('{id}', id);

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

  /// Get a user
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   user Id
  Future<UsersPermissionsUser?> usersIdGet(String id,) async {
    final response = await usersIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUser',) as UsersPermissionsUser;
    
    }
    return null;
  }

  /// Update a user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   user Id
  ///
  /// * [UsersPostRequest] usersPostRequest (required):
  Future<Response> usersIdPutWithHttpInfo(String id, UsersPostRequest usersPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/users/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = usersPostRequest;

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

  /// Update a user
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   user Id
  ///
  /// * [UsersPostRequest] usersPostRequest (required):
  Future<UsersPost201Response?> usersIdPut(String id, UsersPostRequest usersPostRequest,) async {
    final response = await usersIdPutWithHttpInfo(id, usersPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPost201Response',) as UsersPost201Response;
    
    }
    return null;
  }

  /// Get authenticated user info
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> usersMeGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/users/me';

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

  /// Get authenticated user info
  Future<UsersPermissionsUser?> usersMeGet() async {
    final response = await usersMeGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUser',) as UsersPermissionsUser;
    
    }
    return null;
  }

  /// Get default generated permissions
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> usersPermissionsPermissionsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/users-permissions/permissions';

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

  /// Get default generated permissions
  Future<UsersPermissionsPermissionsGet200Response?> usersPermissionsPermissionsGet() async {
    final response = await usersPermissionsPermissionsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsPermissionsGet200Response',) as UsersPermissionsPermissionsGet200Response;
    
    }
    return null;
  }

  /// List roles
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> usersPermissionsRolesGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/users-permissions/roles';

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

  /// List roles
  Future<UsersPermissionsRolesGet200Response?> usersPermissionsRolesGet() async {
    final response = await usersPermissionsRolesGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsRolesGet200Response',) as UsersPermissionsRolesGet200Response;
    
    }
    return null;
  }

  /// Get a role
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   role Id
  Future<Response> usersPermissionsRolesIdGetWithHttpInfo(String id,) async {
    // ignore: prefer_const_declarations
    final path = r'/users-permissions/roles/{id}'
      .replaceAll('{id}', id);

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

  /// Get a role
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   role Id
  Future<UsersPermissionsRolesIdGet200Response?> usersPermissionsRolesIdGet(String id,) async {
    final response = await usersPermissionsRolesIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsRolesIdGet200Response',) as UsersPermissionsRolesIdGet200Response;
    
    }
    return null;
  }

  /// Create a role
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UsersPermissionsRolesPostRequest] usersPermissionsRolesPostRequest (required):
  Future<Response> usersPermissionsRolesPostWithHttpInfo(UsersPermissionsRolesPostRequest usersPermissionsRolesPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/users-permissions/roles';

    // ignore: prefer_final_locals
    Object? postBody = usersPermissionsRolesPostRequest;

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

  /// Create a role
  ///
  /// Parameters:
  ///
  /// * [UsersPermissionsRolesPostRequest] usersPermissionsRolesPostRequest (required):
  Future<AuthForgotPasswordPost200Response?> usersPermissionsRolesPost(UsersPermissionsRolesPostRequest usersPermissionsRolesPostRequest,) async {
    final response = await usersPermissionsRolesPostWithHttpInfo(usersPermissionsRolesPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthForgotPasswordPost200Response',) as AuthForgotPasswordPost200Response;
    
    }
    return null;
  }

  /// Delete a role
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] role (required):
  ///   role Id
  Future<Response> usersPermissionsRolesRoleDeleteWithHttpInfo(String role,) async {
    // ignore: prefer_const_declarations
    final path = r'/users-permissions/roles/{role}'
      .replaceAll('{role}', role);

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

  /// Delete a role
  ///
  /// Parameters:
  ///
  /// * [String] role (required):
  ///   role Id
  Future<AuthForgotPasswordPost200Response?> usersPermissionsRolesRoleDelete(String role,) async {
    final response = await usersPermissionsRolesRoleDeleteWithHttpInfo(role,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthForgotPasswordPost200Response',) as AuthForgotPasswordPost200Response;
    
    }
    return null;
  }

  /// Update a role
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] role (required):
  ///   role Id
  ///
  /// * [UsersPermissionsRolesPostRequest] usersPermissionsRolesPostRequest (required):
  Future<Response> usersPermissionsRolesRolePutWithHttpInfo(String role, UsersPermissionsRolesPostRequest usersPermissionsRolesPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/users-permissions/roles/{role}'
      .replaceAll('{role}', role);

    // ignore: prefer_final_locals
    Object? postBody = usersPermissionsRolesPostRequest;

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

  /// Update a role
  ///
  /// Parameters:
  ///
  /// * [String] role (required):
  ///   role Id
  ///
  /// * [UsersPermissionsRolesPostRequest] usersPermissionsRolesPostRequest (required):
  Future<AuthForgotPasswordPost200Response?> usersPermissionsRolesRolePut(String role, UsersPermissionsRolesPostRequest usersPermissionsRolesPostRequest,) async {
    final response = await usersPermissionsRolesRolePutWithHttpInfo(role, usersPermissionsRolesPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthForgotPasswordPost200Response',) as AuthForgotPasswordPost200Response;
    
    }
    return null;
  }

  /// Create a user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UsersPostRequest] usersPostRequest (required):
  Future<Response> usersPostWithHttpInfo(UsersPostRequest usersPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/users';

    // ignore: prefer_final_locals
    Object? postBody = usersPostRequest;

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

  /// Create a user
  ///
  /// Parameters:
  ///
  /// * [UsersPostRequest] usersPostRequest (required):
  Future<UsersPost201Response?> usersPost(UsersPostRequest usersPostRequest,) async {
    final response = await usersPostWithHttpInfo(usersPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPost201Response',) as UsersPost201Response;
    
    }
    return null;
  }
}
