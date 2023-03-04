import 'package:finniu/graphql/mutations.dart';
import 'package:finniu/models/auth.dart';
import 'package:finniu/models/user.dart';
import 'package:finniu/providers/graphql_provider.dart';
import 'package:finniu/providers/user_provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerMutationProvider = FutureProvider.family(
  (ref, RegisterUserModel userInputData) async {
    final gqlClient = ref.watch(gqlClientProvider).value;
    if (gqlClient == null) {
      throw Exception('GraphQL client is null');
    }

    print('user input data ');
    print(userInputData.phone);
    final response = await gqlClient.mutate(
      MutationOptions(
        document: gql(
          MutationRepository.getSignUpMutation(),
        ),
        variables: {
          'nickname': userInputData.nickname,
          'email': userInputData.email,
          'password': userInputData.password,
          'phone': userInputData.phone,
        },
      ),
    );
    print('response');
    print(response);
    if (response.data == null) {
      return false;
    }
    final registerResponse =
        RegisterUser.fromJson(response.data?['registerUser']);
    final userResponse = registerResponse.user?.userProfile;
    print('response mutation!!');
    print(response);
    // if (response != null &&
    //     response.data?['registerUser']?['success'] == true) {
    //   return true;
    if (userResponse != null) {
      ref.read(userProfileNotifierProvider.notifier).updateFields(
            nickName: userResponse.nickName,
            email: userResponse.email,
            firstName: userResponse.firstName,
            lastName: userResponse.lastName,
            phoneNumber: userResponse.phoneNumber,
          );
    }

    return registerResponse.success;
  },
);
