import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/auth_bloc/radio_bloc/radio__bloc.dart';
import '../../widgets/auth/custom_footer_auth_button.dart';
import '/src/config/router/app_route_constants.dart';
import '/src/logic/blocs/auth_bloc/auth_bloc.dart';
import '/src/logic/blocs/auth_bloc/radio_bloc/radio_bloc.dart';
import '/src/logic/blocs/user_cubit/user_cubit.dart';
import '/src/presentation/widgets/common_widgets/custom_elevated_button.dart';
import '/src/presentation/widgets/common_widgets/custom_textfield.dart';
import '/src/utils/constants/constants.dart';
import '/src/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_amazon_clone_bloc/src/presentation/views/auth/keys.dart' as auth_screen_keys;

// enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final bloc = RadioBloc_();

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final Map<String, CustomFooterDialog> customFooterDialogMap = const {
    'Conditions of Use': CoUDialog(),
    'Privacy Notice': PrivacyNoticeDialog(),
    "Help": HelpDialog(),
  };

  var _selectedDialogKey = "Conditions of Use";

  // TODO: Đọc đoạn được highlight trong doc để diễn giải cho thầy: https://flutterdesignpatterns.com/pattern/factory-method
  Future _showCustomFooterDialog(BuildContext context) async {
    /// HINT: The application picks a creator's type depending on the current chosen button.
    final selectedDialog = customFooterDialogMap[_selectedDialogKey];

    // HINT: The client code works with an instance of a concrete creator, althought its base interface. As long as the client keeps working with the creator via the base interface, you can pass it any creator's subclass.
    await selectedDialog!.show(context);
  }

  void _setSelectedDialogKey(String? key) {
    if (key == null) return;

    setState(() => _selectedDialogKey = key);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<RadioBloc>().add(const RadioChangedEvent(auth: Auth.signUp));

    return Scaffold(
      backgroundColor: Constants.greyBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/amazon_in_altt.png',
                  height: 100,
                  width: 50,
                  key: auth_screen_keys.logoKey,
                ),
                const SizedBox.square(
                  dimension: 12,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
                const SizedBox.square(
                  dimension: 12,
                ),
                StreamBuilder<RadioState>(
                    // HINT: sử dụng StreamBuilder để lắng nghe Stream
                    stream: bloc.stateController
                        .stream, // truyền stream của stateController vào để lắng nghe
                    initialData: const RadioSignInState(
                        auth: Auth.signIn), // giá trị khởi tạo
                    builder: (BuildContext context,
                        AsyncSnapshot<RadioState> snapshot) {
                      if (snapshot.data is RadioSignUpState) {
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: 10, right: 8, left: 8),
                              decoration: BoxDecoration(
                                color: Constants.backgroundColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    minLeadingWidth: 2,
                                    leading: SizedBox.square(
                                      dimension: 12,
                                      child: Radio(
                                          key: auth_screen_keys.createAccountKey,
                                          value: Auth.signUp,
                                          groupValue:
                                              snapshot.data is RadioSignUpState
                                                  ? Auth.signUp
                                                  : Auth.signIn,
                                          onChanged: (Auth? val) {
                                            bloc.eventController.sink.add(
                                                RadioChangedEvent(auth: val!));
                                          }),
                                    ),
                                    title: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                          text: 'Create account. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: 'New to FastFood+?',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87),
                                        )
                                      ]),
                                    ),
                                    onTap: () {
                                      bloc.eventController.sink.add(
                                          const RadioChangedEvent(
                                              auth: Auth.signUp));
                                    },
                                  ),
                                  Form(
                                    key: _signUpFormKey,
                                    child: Column(children: [
                                      CustomTextfield(
                                        controller: _nameController,
                                        hintText: 'First and last name',
                                        onChanged: (value) {
                                          context.read<AuthBloc>().add(
                                              TextFieldChangedEvent(
                                                  _nameController.text,
                                                  _emailController.text,
                                                  _passwordController.text));
                                        },
                                      ),
                                      CustomTextfield(
                                        controller: _emailController,
                                        hintText: 'Email',
                                        onChanged: (value) {
                                          context.read<AuthBloc>().add(
                                              TextFieldChangedEvent(
                                                  _nameController.text,
                                                  _emailController.text,
                                                  _passwordController.text));
                                        },
                                      ),
                                      CustomTextfield(
                                        controller: _passwordController,
                                        hintText: 'Set password',
                                        onChanged: (value) {
                                          context.read<AuthBloc>().add(
                                              TextFieldChangedEvent(
                                                  _nameController.text,
                                                  _emailController.text,
                                                  _passwordController.text));
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      BlocBuilder<AuthBloc, AuthState>(
                                        builder: (context, state) {
                                          if (state is TextFieldErrorState) {
                                            return Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/info_icon.png',
                                                  height: 15,
                                                  width: 15,
                                                ),
                                                Text('  ${state.errorString}')
                                              ],
                                            );
                                          } else {
                                            if (_nameController.text == '' ||
                                                _emailController.text == '' ||
                                                _passwordController.text ==
                                                    '') {
                                              return Row(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/info_icon.png',
                                                    height: 15,
                                                    width: 15,
                                                  ),
                                                  const Text(
                                                      '  All fields are required.'),
                                                ],
                                              );
                                            }
                                            return const SizedBox();
                                          }
                                        },
                                      ),
                                      const SizedBox.square(
                                        dimension: 15,
                                      ),
                                      BlocConsumer<AuthBloc, AuthState>(
                                        listener: (context, state) {
                                          if (state is AuthErrorState) {
                                            debugPrint(state.errorString);
                                            showSnackBar(
                                                context, state.errorString);
                                          }
                                          if (state is CreateUserSuccessState) {
                                            showSnackBar(context,
                                                state.userCreatedString);
                                          }
                                          if (state is CreateUserErrorState) {
                                            showSnackBar(
                                                context, state.errorString);
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is AuthLoadingState) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            return CustomElevatedButton(
                                              buttonText: 'Create account',
                                              onPressed: () {
                                                if (_signUpFormKey.currentState!
                                                    .validate()) {
                                                  // signUpUser();
                                                  BlocProvider.of<AuthBloc>(
                                                          context)
                                                      .add(CreateAccountPressedEvent(
                                                          _nameController.text,
                                                          _emailController.text,
                                                          _passwordController
                                                              .text));
                                                }
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: 10, right: 8, left: 8),
                              decoration: BoxDecoration(
                                  color: Constants.greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                children: [
                                  ListTile(
                                    
                                    minLeadingWidth: 2,
                                    leading: SizedBox.square(
                                      dimension: 12,
                                      child: Radio(
                                          key: auth_screen_keys.signInKey,
                                          value: Auth.signIn,
                                          groupValue:
                                              snapshot.data is RadioSignUpState
                                                  ? Auth.signUp
                                                  : Auth.signIn,
                                          onChanged: (Auth? val) {
                                            bloc.eventController.sink.add(
                                                RadioChangedEvent(auth: val!));
                                          }),
                                    ),
                                    title: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                          text: 'Sign in. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: 'Already a customer?',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87),
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      bloc.eventController.sink.add(
                                          const RadioChangedEvent(
                                              auth: Auth.signIn));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      if (snapshot.data is RadioSignInState) {
                        return Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 8, left: 8),
                                decoration: BoxDecoration(
                                  color: Constants.greyBackgroundColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(children: [
                                  ListTile(
                                    minLeadingWidth: 2,
                                    leading: SizedBox.square(
                                      dimension: 12,
                                      child: Radio(
                                          value: Auth.signUp,
                                          groupValue:
                                              snapshot.data is RadioSignUpState
                                                  ? Auth.signUp
                                                  : Auth.signIn,
                                          onChanged: (Auth? val) {
                                            bloc.eventController.sink.add(
                                                RadioChangedEvent(auth: val!));
                                          }),
                                    ),
                                    title: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                          text: 'Create account. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: 'New to FastFood+?',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87),
                                        )
                                      ]),
                                    ),
                                    onTap: () {
                                      bloc.eventController.sink.add(
                                          const RadioChangedEvent(
                                              auth: Auth.signUp));
                                    },
                                  ),
                                ])),
                            Container(
                              padding: const EdgeInsets.only(
                                  bottom: 10, right: 8, left: 8),
                              decoration: BoxDecoration(
                                  color: Constants.backgroundColor,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                children: [
                                  ListTile(
                                    minLeadingWidth: 2,
                                    leading: SizedBox.square(
                                      dimension: 12,
                                      child: Radio(
                                          value: Auth.signIn,
                                          groupValue:
                                              snapshot.data is RadioSignUpState
                                                  ? Auth.signUp
                                                  : Auth.signIn,
                                          onChanged: (Auth? val) {
                                            bloc.eventController.sink.add(
                                                RadioChangedEvent(auth: val!));
                                          }),
                                    ),
                                    title: RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                          text: 'Sign in. ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: 'Already a customer?',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black87),
                                        ),
                                      ]),
                                    ),
                                    onTap: () {
                                      bloc.eventController.sink.add(
                                          const RadioChangedEvent(
                                              auth: Auth.signIn));
                                    },
                                  ),
                                  Form(
                                    key: _signInFormKey,
                                    child: Column(
                                      children: [
                                        CustomTextfield(
                                            controller: _emailController,
                                            hintText: 'Email'),
                                        CustomTextfield(
                                            controller: _passwordController,
                                            hintText: 'Password'),
                                        const SizedBox.square(
                                          dimension: 6,
                                        ),
                                        BlocConsumer<AuthBloc, AuthState>(
                                          listener: (context, state) {
                                            if (state is AuthErrorState) {
                                              showSnackBar(
                                                  context, state.errorString);
                                            }
                                            if (state is SignInSuccessState) {
                                              BlocProvider.of<UserCubit>(
                                                      context)
                                                  .getUserData();
                                              if (state.user.type == 'user') {
                                                context.goNamed(
                                                    AppRouteConstants
                                                        .bottomBarRoute.name);
                                              } else {
                                                context.goNamed(
                                                    AppRouteConstants
                                                        .adminBottomBarRoute
                                                        .name);
                                              }
                                            }
                                            if (state is UpdateUserData) {
                                              BlocProvider.of<UserCubit>(
                                                      context)
                                                  .setUser(state.user);
                                            }
                                          },
                                          builder: (context, state) {
                                            if (state is AuthLoadingState) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            } else {
                                              return CustomElevatedButton(
                                                buttonText: 'Continue',
                                                onPressed: () {
                                                  if (_signInFormKey
                                                      .currentState!
                                                      .validate()) {
                                                    BlocProvider.of<AuthBloc>(
                                                            context)
                                                        .add(SignInPressedEvent(
                                                            _emailController
                                                                .text,
                                                            _passwordController
                                                                .text));
                                                  }
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    }),
                // BlocBuilder<RadioBloc, RadioState>(
                //   builder: (context, state) {
                //     if (state is RadioSignUpState) {
                //       return Column(
                //         children: [
                //           Container(
                //             padding: const EdgeInsets.only(
                //                 bottom: 10, right: 8, left: 8),
                //             decoration: BoxDecoration(
                //               color: Constants.backgroundColor,
                //               borderRadius: BorderRadius.circular(6),
                //             ),
                //             child: Column(
                //               children: [
                //                 ListTile(
                //                   minLeadingWidth: 2,
                //                   leading: SizedBox.square(
                //                     dimension: 12,
                //                     child: Radio(
                //                         value: Auth.signUp,
                //                         groupValue: state.auth,
                //                         onChanged: (Auth? val) {
                //                           context.read<RadioBloc>().add(
                //                               RadioChangedEvent(auth: val!));
                //                         }),
                //                   ),
                //                   title: RichText(
                //                     text: const TextSpan(children: [
                //                       TextSpan(
                //                         text: 'Create account. ',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.w500,
                //                             fontSize: 17,
                //                             color: Colors.black),
                //                       ),
                //                       TextSpan(
                //                         text: 'New to FastFood+?',
                //                         style: TextStyle(
                //                             fontSize: 13,
                //                             color: Colors.black87),
                //                       )
                //                     ]),
                //                   ),
                //                   onTap: () {
                //                     context.read<RadioBloc>().add(
                //                         const RadioChangedEvent(
                //                             auth: Auth.signUp));
                //                   },
                //                 ),
                //                 Form(
                //                   key: _signUpFormKey,
                //                   child: Column(children: [
                //                     CustomTextfield(
                //                       controller: _nameController,
                //                       hintText: 'First and last name',
                //                       onChanged: (value) {
                //                         context.read<AuthBloc>().add(
                //                             TextFieldChangedEvent(
                //                                 _nameController.text,
                //                                 _emailController.text,
                //                                 _passwordController.text));
                //                       },
                //                     ),
                //                     CustomTextfield(
                //                       controller: _emailController,
                //                       hintText: 'Email',
                //                       onChanged: (value) {
                //                         context.read<AuthBloc>().add(
                //                             TextFieldChangedEvent(
                //                                 _nameController.text,
                //                                 _emailController.text,
                //                                 _passwordController.text));
                //                       },
                //                     ),
                //                     CustomTextfield(
                //                       controller: _passwordController,
                //                       hintText: 'Set password',
                //                       onChanged: (value) {
                //                         context.read<AuthBloc>().add(
                //                             TextFieldChangedEvent(
                //                                 _nameController.text,
                //                                 _emailController.text,
                //                                 _passwordController.text));
                //                       },
                //                     ),
                //                     const SizedBox(
                //                       height: 10,
                //                     ),
                //                     BlocBuilder<AuthBloc, AuthState>(
                //                       builder: (context, state) {
                //                         if (state is TextFieldErrorState) {
                //                           return Row(
                //                             children: [
                //                               Image.asset(
                //                                 'assets/images/info_icon.png',
                //                                 height: 15,
                //                                 width: 15,
                //                               ),
                //                               Text('  ${state.errorString}')
                //                             ],
                //                           );
                //                         } else {
                //                           if (_nameController.text == '' ||
                //                               _emailController.text == '' ||
                //                               _passwordController.text == '') {
                //                             return Row(
                //                               children: [
                //                                 Image.asset(
                //                                   'assets/images/info_icon.png',
                //                                   height: 15,
                //                                   width: 15,
                //                                 ),
                //                                 const Text(
                //                                     '  All fields are required.'),
                //                               ],
                //                             );
                //                           }
                //                           return const SizedBox();
                //                         }
                //                       },
                //                     ),
                //                     const SizedBox.square(
                //                       dimension: 15,
                //                     ),
                //                     BlocConsumer<AuthBloc, AuthState>(
                //                       listener: (context, state) {
                //                         if (state is AuthErrorState) {
                //                           debugPrint(state.errorString);
                //                           showSnackBar(
                //                               context, state.errorString);
                //                         }
                //                         if (state is CreateUserSuccessState) {
                //                           showSnackBar(
                //                               context, state.userCreatedString);
                //                         }
                //                         if (state is CreateUserErrorState) {
                //                           showSnackBar(
                //                               context, state.errorString);
                //                         }
                //                       },
                //                       builder: (context, state) {
                //                         if (state is AuthLoadingState) {
                //                           return const Center(
                //                             child: CircularProgressIndicator(),
                //                           );
                //                         } else {
                //                           return CustomElevatedButton(
                //                             buttonText: 'Create account',
                //                             onPressed: () {
                //                               if (_signUpFormKey.currentState!
                //                                   .validate()) {
                //                                 // signUpUser();
                //                                 BlocProvider.of<AuthBloc>(
                //                                         context)
                //                                     .add(
                //                                         CreateAccountPressedEvent(
                //                                             _nameController
                //                                                 .text,
                //                                             _emailController
                //                                                 .text,
                //                                             _passwordController
                //                                                 .text));
                //                               }
                //                             },
                //                           );
                //                         }
                //                       },
                //                     ),
                //                   ]),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Container(
                //             padding: const EdgeInsets.only(
                //                 bottom: 10, right: 8, left: 8),
                //             decoration: BoxDecoration(
                //                 color: Constants.greyBackgroundColor,
                //                 borderRadius: BorderRadius.circular(6)),
                //             child: Column(
                //               children: [
                //                 ListTile(
                //                   minLeadingWidth: 2,
                //                   leading: SizedBox.square(
                //                     dimension: 12,
                //                     child: Radio(
                //                         value: Auth.signIn,
                //                         groupValue: state.auth,
                //                         onChanged: (Auth? val) {
                //                           context.read<RadioBloc>().add(
                //                               RadioChangedEvent(auth: val!));
                //                         }),
                //                   ),
                //                   title: RichText(
                //                     text: const TextSpan(children: [
                //                       TextSpan(
                //                         text: 'Sign in. ',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.w500,
                //                             fontSize: 17,
                //                             color: Colors.black),
                //                       ),
                //                       TextSpan(
                //                         text: 'Already a customer?',
                //                         style: TextStyle(
                //                             fontSize: 13,
                //                             color: Colors.black87),
                //                       ),
                //                     ]),
                //                   ),
                //                   onTap: () {
                //                     context.read<RadioBloc>().add(
                //                         const RadioChangedEvent(
                //                             auth: Auth.signIn));
                //                   },
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       );
                //     }
                //     if (state is RadioSignInState) {
                //       return Column(
                //         children: [
                //           Container(
                //               padding: const EdgeInsets.only(
                //                   bottom: 10, right: 8, left: 8),
                //               decoration: BoxDecoration(
                //                 color: Constants.greyBackgroundColor,
                //                 borderRadius: BorderRadius.circular(6),
                //               ),
                //               child: Column(children: [
                //                 ListTile(
                //                   minLeadingWidth: 2,
                //                   leading: SizedBox.square(
                //                     dimension: 12,
                //                     child: Radio(
                //                         value: Auth.signUp,
                //                         groupValue: state.auth,
                //                         onChanged: (Auth? val) {
                //                           context.read<RadioBloc>().add(
                //                               RadioChangedEvent(auth: val!));
                //                         }),
                //                   ),
                //                   title: RichText(
                //                     text: const TextSpan(children: [
                //                       TextSpan(
                //                         text: 'Create account. ',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.w500,
                //                             fontSize: 17,
                //                             color: Colors.black),
                //                       ),
                //                       TextSpan(
                //                         text: 'New to FastFood+?',
                //                         style: TextStyle(
                //                             fontSize: 13,
                //                             color: Colors.black87),
                //                       )
                //                     ]),
                //                   ),
                //                   onTap: () {
                //                     context.read<RadioBloc>().add(
                //                         const RadioChangedEvent(
                //                             auth: Auth.signUp));
                //                   },
                //                 ),
                //               ])),
                //           Container(
                //             padding: const EdgeInsets.only(
                //                 bottom: 10, right: 8, left: 8),
                //             decoration: BoxDecoration(
                //                 color: Constants.backgroundColor,
                //                 borderRadius: BorderRadius.circular(6)),
                //             child: Column(
                //               children: [
                //                 ListTile(
                //                   minLeadingWidth: 2,
                //                   leading: SizedBox.square(
                //                     dimension: 12,
                //                     child: Radio(
                //                         value: Auth.signIn,
                //                         groupValue: state.auth,
                //                         onChanged: (Auth? val) {
                //                           context.read<RadioBloc>().add(
                //                               RadioChangedEvent(auth: val!));
                //                         }),
                //                   ),
                //                   title: RichText(
                //                     text: const TextSpan(children: [
                //                       TextSpan(
                //                         text: 'Sign in. ',
                //                         style: TextStyle(
                //                             fontWeight: FontWeight.w500,
                //                             fontSize: 17,
                //                             color: Colors.black),
                //                       ),
                //                       TextSpan(
                //                         text: 'Already a customer?',
                //                         style: TextStyle(
                //                             fontSize: 13,
                //                             color: Colors.black87),
                //                       ),
                //                     ]),
                //                   ),
                //                   onTap: () {
                //                     context.read<RadioBloc>().add(
                //                         const RadioChangedEvent(
                //                             auth: Auth.signIn));
                //                   },
                //                 ),
                //                 Form(
                //                   key: _signInFormKey,
                //                   child: Column(
                //                     children: [
                //                       CustomTextfield(
                //                           controller: _emailController,
                //                           hintText: 'Email'),
                //                       CustomTextfield(
                //                           controller: _passwordController,
                //                           hintText: 'Password'),
                //                       const SizedBox.square(
                //                         dimension: 6,
                //                       ),
                //                       BlocConsumer<AuthBloc, AuthState>(
                //                         listener: (context, state) {
                //                           if (state is AuthErrorState) {
                //                             showSnackBar(
                //                                 context, state.errorString);
                //                           }
                //                           if (state is SignInSuccessState) {
                //                             BlocProvider.of<UserCubit>(context)
                //                                 .getUserData();
                //                             if (state.user.type == 'user') {
                //                               context.goNamed(AppRouteConstants
                //                                   .bottomBarRoute.name);
                //                             } else {
                //                               context.goNamed(AppRouteConstants
                //                                   .adminBottomBarRoute.name);
                //                             }
                //                           }
                //                           if (state is UpdateUserData) {
                //                             BlocProvider.of<UserCubit>(context)
                //                                 .setUser(state.user);
                //                           }
                //                         },
                //                         builder: (context, state) {
                //                           if (state is AuthLoadingState) {
                //                             return const Center(
                //                               child:
                //                                   CircularProgressIndicator(),
                //                             );
                //                           } else {
                //                             return CustomElevatedButton(
                //                               buttonText: 'Continue',
                //                               onPressed: () {
                //                                 if (_signInFormKey.currentState!
                //                                     .validate()) {
                //                                   BlocProvider.of<AuthBloc>(
                //                                           context)
                //                                       .add(SignInPressedEvent(
                //                                           _emailController.text,
                //                                           _passwordController
                //                                               .text));
                //                                 }
                //                               },
                //                             );
                //                           }
                //                         },
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ],
                //       );
                //     }

                //     return const SizedBox();
                //   },
                // ),
                const SizedBox.square(
                  dimension: 20,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  indent: 20,
                  endIndent: 20,
                  thickness: 0.5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      customTextButton(buttonText: 'Conditions of Use'),
                      customTextButton(buttonText: 'Privacy Notice'),
                      customTextButton(buttonText: 'Help'),
                    ]),
                const Center(
                  child: Text(
                    '© 1996-2023, FastFoodPlus.com, Inc. or its affiliates',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton customTextButton({String? buttonText}) {
    return TextButton(
      onPressed: () {
        _setSelectedDialogKey(buttonText);
        _showCustomFooterDialog(context);
      },
      child: Text(
        buttonText!,
        style: const TextStyle(color: Color(0xff1F72C5), fontSize: 15),
      ),
    );
  }
}

