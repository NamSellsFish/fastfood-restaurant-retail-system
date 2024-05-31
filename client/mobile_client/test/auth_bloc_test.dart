import 'package:flutter_amazon_clone_bloc/src/data/repositories/auth_repository.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'test_resources.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() async {
  final user = await testResources.customer;

  registerFallbackValue(user);

  group(AuthBloc, () {
    late AuthBloc bloc;

    final repo = MockAuthRepository();

    when(() => repo.signInUser(any(), any())).thenAnswer((_) async => user);
    when(() => repo.signUpUser(any())).thenAnswer((_) async => user);

    setUp(() => bloc = AuthBloc(repo));

    blocTest<AuthBloc, AuthState>(
      'Valid account creation credentials:' 
      'Emits TextFieldValidState'
      'When TextFieldChangedEvent is added.',
      build: () => bloc,
      act: (bloc) => bloc.add(TextFieldChangedEvent(
        user.name,
        user.email,
        user.password,
      )),
      expect: () => <AuthState>[
        TextFieldValidState(emailValue: user.email, passwordValue: user.password)
      ],
    );


    Iterable<(String name, String email, String password)> getInvalidCredentials() sync* {
      yield ('', user.email, user.password);
      yield (user.name, '', user.password);
      yield (user.name, user.email, '');
    }

    for (var credentials in getInvalidCredentials()) {
      blocTest<AuthBloc, AuthState>(
        'Invalid account creation credentials: $credentials' 
        'Emits TextFieldInvalidState'
        'When TextFieldChangedEvent is added.',
        build: () => bloc,
        act: (bloc) => bloc.add(TextFieldChangedEvent(
          credentials.$1,
          credentials.$2,
          credentials.$3,
        )),
        expect: () => [
          isA<TextFieldErrorState>()
        ],
      );
    }

    blocTest<AuthBloc, AuthState>(
      'Valid account creation credentials:' 
      'Emits [AuthLoadingState, CreateUserInProgressState, CreateUserSuccessState]'
      'When CreateAccountPressedEvent is added.',
      build: () => bloc,
      act: (bloc) => bloc.add(CreateAccountPressedEvent(
        user.name,
        user.email,
        user.password,
      )),
      expect: () => <AuthState>[
        AuthLoadingState(),
        CreateUserInProgressState(user: user),
        CreateUserSuccessState(
            userCreatedString: 'User Created, you can sign in now!'),
      ],
    );
  });
}
