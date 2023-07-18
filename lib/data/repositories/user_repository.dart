import 'package:nutrition_app/common/exceptions.dart';

import '../../common/services/firestore_service.dart';
import '../models/account/account.dart';

class UserRepository {
  final FirestoreService _firestoreService;
  final String collectionName = 'users';

  UserRepository({required FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  Future<void> createUser(
      {required String userId, required  data}) async {
    try {
      await _firestoreService.write(
          collection: collectionName, data: data, userId: userId);
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<UserAccount> getAccount({required String id}) async {
    try {
      final data = await _firestoreService.read(
          collectionName: collectionName, docId: id);
      if (!data.exists) {
        return const UserAccount();
      }
      return UserAccount.fromJson(data.data() ?? {});
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> updateAccount(
      {required String userId, required UserAccount data}) async {
    try {
      await _firestoreService.update(
          collectionName: collectionName, userId: userId, data: data.toJson());
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }
}
