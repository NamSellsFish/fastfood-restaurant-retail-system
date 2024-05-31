import 'package:flutter/widgets.dart';

const namespace = 'auth_screen';
// Logo
Key logoKey = LabeledGlobalKey('${namespace}_logo');
// Create account option
Key createAccountKey = LabeledGlobalKey('${namespace}_create_account');
/*
  Fields:
    - First and last name
    - Email
    - Password
  Button
  */
Key nameKey = LabeledGlobalKey('${namespace}_name');
Key setEmailKey = LabeledGlobalKey('${namespace}_set_email');
Key setPasswordKey = LabeledGlobalKey('${namespace}_set_password');
Key createAccountButtonKey = LabeledGlobalKey('${namespace}_create_account_button');
// Sign in option
Key signInKey = LabeledGlobalKey('${namespace}_sign_in');
/*
  Fields:
    - Email
    - Password
  Button
  */
Key emailKey = LabeledGlobalKey('${namespace}_email');
Key passwordKey = LabeledGlobalKey('${namespace}_password');
Key loginButtonKey = LabeledGlobalKey('${namespace}_login_button');
// Conditions of Use
Key conditionsOfUseKey = LabeledGlobalKey('${namespace}_conditions_of_use');
// Privacy Notice
Key privacyNoticeKey = LabeledGlobalKey('${namespace}_privacy_notice');
// Help
Key helpKey = LabeledGlobalKey('${namespace}_help');
// Copyright statement
Key copyRightKey = LabeledGlobalKey('${namespace}_copy_right');