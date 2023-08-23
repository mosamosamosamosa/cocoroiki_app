import 'package:flutter_riverpod/flutter_riverpod.dart';

//更新可能な値：ユーザID
final StateProvider<int> userIdProvider = StateProvider((ref) {
  return 1;
});

//ユーザがおばあちゃんか否か
final StateProvider<bool> userRoleProvider = StateProvider((ref) {
  return false;
});

//familyId
final StateProvider<int> familyIdProvider = StateProvider((ref) {
  return 1;
});

//grandList
final StateProvider<List<int>> grandListProvider = StateProvider((ref) {
  return [];
});

//quest
final StateProvider<String> questProvider = StateProvider((ref) {
  return '';
});
