//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library openapi.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/app_user_api.dart';
part 'api/comment_api.dart';
part 'api/family_api.dart';
part 'api/post_api.dart';
part 'api/profile_api.dart';
part 'api/quest_api.dart';
part 'api/quest_kind_api.dart';
part 'api/quest_status_api.dart';
part 'api/reward_api.dart';
part 'api/tree_api.dart';
part 'api/upload_file_api.dart';
part 'api/users_permissions_auth_api.dart';
part 'api/users_permissions_users_roles_api.dart';

part 'model/app_user.dart';
part 'model/app_user_families.dart';
part 'model/app_user_families_data_inner.dart';
part 'model/app_user_families_data_inner_attributes.dart';
part 'model/app_user_families_data_inner_attributes_kids.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes_roles.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes_roles_data_inner.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes_roles_data_inner_attributes.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes_roles_data_inner_attributes_permissions.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes_roles_data_inner_attributes_permissions_data_inner.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes_roles_data_inner_attributes_permissions_data_inner_attributes.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_created_by_data_attributes_roles_data_inner_attributes_permissions_data_inner_attributes_role.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_families.dart';
part 'model/app_user_families_data_inner_attributes_kids_data_inner_attributes_families_data_inner.dart';
part 'model/app_user_list_response.dart';
part 'model/app_user_list_response_data_item.dart';
part 'model/app_user_list_response_meta.dart';
part 'model/app_user_list_response_meta_pagination.dart';
part 'model/app_user_request.dart';
part 'model/app_user_request_data.dart';
part 'model/app_user_request_data_families_inner.dart';
part 'model/app_user_response.dart';
part 'model/app_user_response_data_object.dart';
part 'model/auth_change_password_post_request.dart';
part 'model/auth_forgot_password_post200_response.dart';
part 'model/auth_forgot_password_post_request.dart';
part 'model/auth_local_post_request.dart';
part 'model/auth_local_register_post_request.dart';
part 'model/auth_reset_password_post_request.dart';
part 'model/auth_send_email_confirmation_post200_response.dart';
part 'model/comment.dart';
part 'model/comment_comments.dart';
part 'model/comment_comments_data_inner.dart';
part 'model/comment_comments_data_inner_attributes.dart';
part 'model/comment_comments_data_inner_attributes_user.dart';
part 'model/comment_comments_data_inner_attributes_user_data.dart';
part 'model/comment_comments_data_inner_attributes_user_data_attributes.dart';
part 'model/comment_comments_data_inner_attributes_user_data_attributes_families.dart';
part 'model/comment_comments_data_inner_attributes_user_data_attributes_families_data_inner.dart';
part 'model/comment_comments_data_inner_attributes_user_data_attributes_families_data_inner_attributes.dart';
part 'model/comment_list_response.dart';
part 'model/comment_list_response_data_item.dart';
part 'model/comment_request.dart';
part 'model/comment_request_data.dart';
part 'model/comment_response.dart';
part 'model/comment_response_data_object.dart';
part 'model/error.dart';
part 'model/error_data.dart';
part 'model/error_error.dart';
part 'model/family.dart';
part 'model/family_kids.dart';
part 'model/family_list_response.dart';
part 'model/family_list_response_data_item.dart';
part 'model/family_request.dart';
part 'model/family_request_data.dart';
part 'model/family_response.dart';
part 'model/family_response_data_object.dart';
part 'model/post.dart';
part 'model/post_comments.dart';
part 'model/post_comments_data_inner.dart';
part 'model/post_comments_data_inner_attributes.dart';
part 'model/post_images.dart';
part 'model/post_images_data_inner.dart';
part 'model/post_images_data_inner_attributes.dart';
part 'model/post_images_data_inner_attributes_folder.dart';
part 'model/post_images_data_inner_attributes_folder_data.dart';
part 'model/post_images_data_inner_attributes_folder_data_attributes.dart';
part 'model/post_images_data_inner_attributes_folder_data_attributes_files.dart';
part 'model/post_images_data_inner_attributes_folder_data_attributes_files_data_inner.dart';
part 'model/post_images_data_inner_attributes_folder_data_attributes_files_data_inner_attributes.dart';
part 'model/post_list_response.dart';
part 'model/post_list_response_data_item.dart';
part 'model/post_request.dart';
part 'model/post_request_data.dart';
part 'model/post_response.dart';
part 'model/post_response_data_object.dart';
part 'model/profile.dart';
part 'model/profile_image.dart';
part 'model/profile_list_response.dart';
part 'model/profile_list_response_data_item.dart';
part 'model/profile_request.dart';
part 'model/profile_request_data.dart';
part 'model/profile_response.dart';
part 'model/profile_response_data_object.dart';
part 'model/quest.dart';
part 'model/quest_kind.dart';
part 'model/quest_kind_list_response.dart';
part 'model/quest_kind_list_response_data_item.dart';
part 'model/quest_kind_request.dart';
part 'model/quest_kind_request_data.dart';
part 'model/quest_kind_response.dart';
part 'model/quest_kind_response_data_object.dart';
part 'model/quest_list_response.dart';
part 'model/quest_list_response_data_item.dart';
part 'model/quest_quest_kinds.dart';
part 'model/quest_quest_kinds_data_inner.dart';
part 'model/quest_quest_kinds_data_inner_attributes.dart';
part 'model/quest_request.dart';
part 'model/quest_request_data.dart';
part 'model/quest_response.dart';
part 'model/quest_response_data_object.dart';
part 'model/quest_status.dart';
part 'model/quest_status_list_response.dart';
part 'model/quest_status_list_response_data_item.dart';
part 'model/quest_status_request.dart';
part 'model/quest_status_request_data.dart';
part 'model/quest_status_response.dart';
part 'model/quest_status_response_data_object.dart';
part 'model/quest_status_tree.dart';
part 'model/quest_status_tree_data.dart';
part 'model/quest_status_tree_data_attributes.dart';
part 'model/reward.dart';
part 'model/reward_list_response.dart';
part 'model/reward_list_response_data_item.dart';
part 'model/reward_request.dart';
part 'model/reward_request_data.dart';
part 'model/reward_response.dart';
part 'model/reward_response_data_object.dart';
part 'model/tree.dart';
part 'model/tree_list_response.dart';
part 'model/tree_list_response_data_item.dart';
part 'model/tree_request.dart';
part 'model/tree_request_data.dart';
part 'model/tree_response.dart';
part 'model/tree_response_data_object.dart';
part 'model/upload_file.dart';
part 'model/users_permissions_permissions_get200_response.dart';
part 'model/users_permissions_permissions_tree_value.dart';
part 'model/users_permissions_permissions_tree_value_controllers_value_value.dart';
part 'model/users_permissions_role.dart';
part 'model/users_permissions_roles_get200_response.dart';
part 'model/users_permissions_roles_get200_response_roles_inner.dart';
part 'model/users_permissions_roles_id_get200_response.dart';
part 'model/users_permissions_roles_post_request.dart';
part 'model/users_permissions_user.dart';
part 'model/users_permissions_user_registration.dart';
part 'model/users_post201_response.dart';
part 'model/users_post_request.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();

bool _isEpochMarker(String? pattern) => pattern == _dateEpochMarker || pattern == '/$_dateEpochMarker/';
