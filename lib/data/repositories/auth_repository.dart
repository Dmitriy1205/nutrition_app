import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../../common/exceptions.dart';

class AuthRepository {
  final FirebaseAuth _authRepository;

  AuthRepository({required FirebaseAuth auth}) : _authRepository = auth;

  Stream<User?> get authStateChange => _authRepository.authStateChanges();

  User? currentUser() {
    return _authRepository.currentUser;
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw BadRequestException(
            message:
                'The password provided is too weak.\nmust be more than 8 digits',
            attribute: 'password');
      } else if (e.code == 'email-already-in-use') {
        throw BadRequestException(
            message: 'THE ACCOUNT ALREADY EXISTS FOR THAT EMAIL',
            attribute: 'email');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw BadRequestException(
            message: 'EMAIL OR PASSWORD IS WRONG', attribute: 'password');
      }
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _authRepository.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw BadRequestException(message: e.message!);
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = _sha256ofString(rawNonce);
    var redirectURL = "https://micqui.firebaseapp.com/__/auth/handler";
    var clientID = "com.pandascode.micqui.service";
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: nonce,
          webAuthenticationOptions: WebAuthenticationOptions(
              clientId: clientID, redirectUri: Uri.parse(redirectURL)));
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await _authRepository.signInWithCredential(oauthCredential);
    } on FirebaseAuthException catch (e) {
      throw BadRequestException(message: e.message!);
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> logout() async {
    await _authRepository.signOut();
    await GoogleSignIn().signOut();
  }

  Future<void> resetPassword(String email) async {
    try {
      await _authRepository.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw BadRequestException(message: e.message!);
    } on Exception catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
