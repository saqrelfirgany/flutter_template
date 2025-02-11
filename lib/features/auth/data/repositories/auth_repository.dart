import '../../domain/entities/user.dart';

/// Abstract class for authentication repository
abstract class AuthRepository {
  Future<void> login(User user);
}

/// Implementation of AuthRepository
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<void> login(User user) async {
    // Implement login logic (e.g., API call)
    await Future.delayed(const Duration(seconds: 2)); // Simulate network call
  }
}
