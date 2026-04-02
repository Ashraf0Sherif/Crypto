import '../../../../core/local/secure_storage_service.dart';
import '../../../../core/networking/api_result.dart';

class AuthRepo {
  final SecureStorageService _storageService;

  AuthRepo(this._storageService);

  Future<Result<void>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final existing = await _storageService.getCredentials();
      if (existing != null && existing.email == email.trim().toLowerCase()) {
        return Failure(
          'An account with this email already exists. Please sign in.',
        );
      }

      await _storageService.saveCredentials(
        email: email.trim().toLowerCase(),
        password: password,
      );
      await _storageService.setLoggedIn(true);

      return Success(null);
    } catch (e) {
      return Failure('Something went wrong. Please try again.');
    }
  }

  Future<Result<void>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final stored = await _storageService.getCredentials();

      if (stored == null) {
        return Failure('No account found. Please sign up first.');
      }

      if (email.trim().toLowerCase() != stored.email) {
        return Failure('No account found with this email.');
      }

      if (password != stored.password) {
        return Failure('Incorrect password. Please try again.');
      }

      await _storageService.setLoggedIn(true);
      return Success(null);
    } catch (e) {
      return Failure('Something went wrong. Please try again.');
    }
  }

  Future<void> signOut() async {
    await _storageService.setLoggedIn(false);
  }
}
