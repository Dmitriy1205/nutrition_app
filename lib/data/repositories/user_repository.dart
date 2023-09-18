import 'package:nutrition_app/common/exceptions.dart';
import 'package:nutrition_app/data/models/subscription/subscription.dart';
import 'package:nutrition_app/data/models/tutorial/tutorial.dart';

import '../../common/services/firestore_service.dart';
import '../models/account/account.dart';

class UserRepository {
  final FirestoreService _firestoreService;
  final String collectionName = 'users';
  final String subCollectionName = 'tutorial';

  UserRepository({required FirestoreService firestoreService})
      : _firestoreService = firestoreService;

  Future<void> createUser(
      {required String userId, required UserAccount data}) async {
    try {
      await _firestoreService.write(
          collection: collectionName, data: data.toJson(), userId: userId);
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

  Future<Tutorial> getTutorial({required String id}) async {
    try {
      final data = await _firestoreService.readSubCollection(
          collectionName: collectionName,
          docId: id,
          subCollection: subCollectionName);
      if (!data.exists) {
        return const Tutorial();
      }
      return Tutorial.fromJson(data.data() ?? {});
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

  Future<void> updateSubscription(
      {required String userId, required Subscription data}) async {
    try {
      await _firestoreService.update(
          collectionName: collectionName,
          userId: userId,
          data: {'subscription': data.toJson()});
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> writeTutorial({required String userId}) async {
    try {
      await _firestoreService.writeSubCollection(
          collection: collectionName,
          userId: userId,
          subCollection: subCollectionName,
          data: const Tutorial(
            isEditMood: true,
            isFoodChoose: true,
            isRegenerateRecipe: true,
            isRecipeButton: true,
            isShowBottomBar: true,
            isSwipeCards: true,
            isAddCraving: true,
          ).toJson());
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> updateTutorial(
      {required String userId, required Map<String, dynamic> data}) async {
    try {
      await _firestoreService.updateFieldSubCollection(
          collection: collectionName,
          userId: userId,
          subCollection: subCollectionName,
          data: data);
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }
}
