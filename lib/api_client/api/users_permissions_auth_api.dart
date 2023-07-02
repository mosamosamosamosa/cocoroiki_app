//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UsersPermissionsAuthApi {
  UsersPermissionsAuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Update user's own password
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthChangePasswordPostRequest] authChangePasswordPostRequest (required):
  Future<Response> authChangePasswordPostWithHttpInfo(AuthChangePasswordPostRequest authChangePasswordPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/change-password';

    // ignore: prefer_final_locals
    Object? postBody = authChangePasswordPostRequest;

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

  /// Update user's own password
  ///
  /// Parameters:
  ///
  /// * [AuthChangePasswordPostRequest] authChangePasswordPostRequest (required):
  Future<UsersPermissionsUserRegistration?> authChangePasswordPost(AuthChangePasswordPostRequest authChangePasswordPostRequest,) async {
    final response = await authChangePasswordPostWithHttpInfo(authChangePasswordPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUserRegistration',) as UsersPermissionsUserRegistration;
    
    }
    return null;
  }

  /// Confirm user email
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] confirmation:
  ///   confirmation token received by email
  Future<Response> authEmailConfirmationGetWithHttpInfo({ String? confirmation, }) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/email-confirmation';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (confirmation != null) {
      queryParams.addAll(_queryParams('', 'confirmation', confirmation));
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

  /// Confirm user email
  ///
  /// Parameters:
  ///
  /// * [String] confirmation:
  ///   confirmation token received by email
  Future<Error?> authEmailConfirmationGet({ String? confirmation, }) async {
    final response = await authEmailConfirmationGetWithHttpInfo( confirmation: confirmation, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Error',) as Error;
    
    }
    return null;
  }

  /// Send rest password email
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthForgotPasswordPostRequest] authForgotPasswordPostRequest (required):
  Future<Response> authForgotPasswordPostWithHttpInfo(AuthForgotPasswordPostRequest authForgotPasswordPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/forgot-password';

    // ignore: prefer_final_locals
    Object? postBody = authForgotPasswordPostRequest;

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

  /// Send rest password email
  ///
  /// Parameters:
  ///
  /// * [AuthForgotPasswordPostRequest] authForgotPasswordPostRequest (required):
  Future<AuthForgotPasswordPost200Response?> authForgotPasswordPost(AuthForgotPasswordPostRequest authForgotPasswordPostRequest,) async {
    final response = await authForgotPasswordPostWithHttpInfo(authForgotPasswordPostRequest,);
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

  /// Local login
  ///
  /// Returns a jwt token and user info
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthLocalPostRequest] authLocalPostRequest (required):
  Future<Response> authLocalPostWithHttpInfo(AuthLocalPostRequest authLocalPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/local';

    // ignore: prefer_final_locals
    Object? postBody = authLocalPostRequest;

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

  /// Local login
  ///
  /// Returns a jwt token and user info
  ///
  /// Parameters:
  ///
  /// * [AuthLocalPostRequest] authLocalPostRequest (required):
  Future<UsersPermissionsUserRegistration?> authLocalPost(AuthLocalPostRequest authLocalPostRequest,) async {
    final response = await authLocalPostWithHttpInfo(authLocalPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUserRegistration',) as UsersPermissionsUserRegistration;
    
    }
    return null;
  }

  /// Register a user
  ///
  /// Returns a jwt token and user info
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthLocalRegisterPostRequest] authLocalRegisterPostRequest (required):
  Future<Response> authLocalRegisterPostWithHttpInfo(AuthLocalRegisterPostRequest authLocalRegisterPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/local/register';

    // ignore: prefer_final_locals
    Object? postBody = authLocalRegisterPostRequest;

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

  /// Register a user
  ///
  /// Returns a jwt token and user info
  ///
  /// Parameters:
  ///
  /// * [AuthLocalRegisterPostRequest] authLocalRegisterPostRequest (required):
  Future<UsersPermissionsUserRegistration?> authLocalRegisterPost(AuthLocalRegisterPostRequest authLocalRegisterPostRequest,) async {
    final response = await authLocalRegisterPostWithHttpInfo(authLocalRegisterPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUserRegistration',) as UsersPermissionsUserRegistration;
    
    }
    return null;
  }

  /// Default Callback from provider auth
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] provider (required):
  ///   Provider name
  Future<Response> authProviderCallbackGetWithHttpInfo(String provider,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/{provider}/callback'
      .replaceAll('{provider}', provider);

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

  /// Default Callback from provider auth
  ///
  /// Parameters:
  ///
  /// * [String] provider (required):
  ///   Provider name
  Future<UsersPermissionsUserRegistration?> authProviderCallbackGet(String provider,) async {
    final response = await authProviderCallbackGetWithHttpInfo(provider,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUserRegistration',) as UsersPermissionsUserRegistration;
    
    }
    return null;
  }

  /// Rest user password
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthResetPasswordPostRequest] authResetPasswordPostRequest (required):
  Future<Response> authResetPasswordPostWithHttpInfo(AuthResetPasswordPostRequest authResetPasswordPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/reset-password';

    // ignore: prefer_final_locals
    Object? postBody = authResetPasswordPostRequest;

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

  /// Rest user password
  ///
  /// Parameters:
  ///
  /// * [AuthResetPasswordPostRequest] authResetPasswordPostRequest (required):
  Future<UsersPermissionsUserRegistration?> authResetPasswordPost(AuthResetPasswordPostRequest authResetPasswordPostRequest,) async {
    final response = await authResetPasswordPostWithHttpInfo(authResetPasswordPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UsersPermissionsUserRegistration',) as UsersPermissionsUserRegistration;
    
    }
    return null;
  }

  /// Send confirmation email
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthForgotPasswordPostRequest] authForgotPasswordPostRequest (required):
  Future<Response> authSendEmailConfirmationPostWithHttpInfo(AuthForgotPasswordPostRequest authForgotPasswordPostRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/auth/send-email-confirmation';

    // ignore: prefer_final_locals
    Object? postBody = authForgotPasswordPostRequest;

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

  /// Send confirmation email
  ///
  /// Parameters:
  ///
  /// * [AuthForgotPasswordPostRequest] authForgotPasswordPostRequest (required):
  Future<AuthSendEmailConfirmationPost200Response?> authSendEmailConfirmationPost(AuthForgotPasswordPostRequest authForgotPasswordPostRequest,) async {
    final response = await authSendEmailConfirmationPostWithHttpInfo(authForgotPasswordPostRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuthSendEmailConfirmationPost200Response',) as AuthSendEmailConfirmationPost200Response;
    
    }
    return null;
  }

  /// Login with a provider
  ///
  /// Redirects to provider login before being redirect to /auth/{provider}/callback
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] provider (required):
  ///   Provider name
  Future<Response> connectProviderGetWithHttpInfo(String provider,) async {
    // ignore: prefer_const_declarations
    final path = r'/connect/{provider}'
      .replaceAll('{provider}', provider);

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

  /// Login with a provider
  ///
  /// Redirects to provider login before being redirect to /auth/{provider}/callback
  ///
  /// Parameters:
  ///
  /// * [String] provider (required):
  ///   Provider name
  Future<Error?> connectProviderGet(String provider,) async {
    final response = await connectProviderGetWithHttpInfo(provider,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Error',) as Error;
    
    }
    return null;
  }
}
