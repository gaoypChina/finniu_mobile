import 'package:finniu/graphql/queries.dart';
import 'package:finniu/models/user.dart';
import 'package:finniu/providers/auth_provider.dart';
import 'package:finniu/providers/graphql_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = FutureProvider<UserProfile>((ref) async {
  final result = await ref.watch(gqlClientProvider.future).then(
    (client) async {
      final QueryResult result = await client.query(
        QueryOptions(
          document: gql(
            QueryRepository.getUserProfile,
          ), // this is the query string you just created

          pollInterval: const Duration(seconds: 10),
        ),
      );
      return result;
    },
  );
  if (result.hasException) {
    throw result.exception!;
  }
  if (result.data?['userProfile'] != null) {
    return UserProfile.fromJson(result.data?['userProfile']);
  }
  return UserProfile();
});

class UserProviderNotifier extends StateNotifier<UserProfile> {
  UserProviderNotifier(UserProfile user) : super(user);

  void updateFields({
    String? nickName,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    bool hasCompletedOnboarding = false,
  }) {
    state = state.copyWith(
      nickName: nickName,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      hasCompletedOnboarding: hasCompletedOnboarding,
    );
  }

  // existing set methods

  void setNickName(String? nickName) {
    state = state.copyWith(nickName: nickName);
  }

  void setEmail(String? email) {
    state = state.copyWith(email: email);
  }

  void setFirstName(String? firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void setLastName(String? lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void setPhone(String? phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void setOnboardingCompleted(bool hasCompletedOnboarding) {
    state = state.copyWith(hasCompletedOnboarding: hasCompletedOnboarding);
  }
}

final userNotifierProvider =
    StateNotifierProvider<UserProviderNotifier, UserProfile>(
  (ref) => UserProviderNotifier(UserProfile()),
);
