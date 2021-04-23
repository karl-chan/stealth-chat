import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/boot/boot_screen.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/home/home_page.dart';
import 'package:stealth_chat/settings/settings_page.dart';
import 'package:stealth_chat/util/api/user_api.dart';
import 'package:stealth_chat/util/get_extras.dart';
import 'package:stealth_chat/util/security/auth.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:uuid/uuid.dart';

enum RegistrationStep {
  ENABLE_NOTIFICATIONS,
  SET_NAME,
  SET_PASSWORD,
  CONFIRM_PASSWORD,
  REGISTRATION
}

class RegistrationController extends GetxController {
  final String id = Uuid().v4();
  final Globals globals;
  final BootConfig boot;

  Rx<RegistrationStep> step = RegistrationStep.SET_NAME.obs;
  RxBool isRegistering = false.obs;
  RxString setNameErrorText = RxString(null);
  RxString setPasswordErrorText = RxString(null);
  RxString confirmPasswordErrorText = RxString(null);
  RxString registrationErrorText = RxString(null);
  Rx<AuthorizationStatus> authorizationStatus =
      AuthorizationStatus.notDetermined.obs;

  TextEditingController setNameController = TextEditingController();
  TextEditingController setPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RegistrationController(Globals globals, BootConfig boot)
      : this.globals = globals,
        this.boot = boot {
    globals.firebase
        .getCurrentAuthorizationStatus()
        .then((status) => authorizationStatus.value = status);
  }

  @override
  void onClose() {
    this.setNameController.dispose();
    this.setPasswordController.dispose();
    this.confirmPasswordController.dispose();
    super.onClose();
  }

  Future<bool> runEnableNotifications() async {
    authorizationStatus.value = await globals.firebase.requestPermissions();
    switch (authorizationStatus.value) {
      case AuthorizationStatus.authorized:
        return true;
      default:
        return false;
    }
  }

  Future<bool> runSetName() async {
    final name = setNameController.text;
    if (name.isBlank) {
      setNameErrorText.value = 'Name must not be empty!';
      return false;
    } else {
      setNameErrorText.value = null;
      return true;
    }
  }

  Future<bool> runSetPassword() async {
    final password = setPasswordController.text;
    if (password.length < 6) {
      setPasswordErrorText.value =
          'Password must be at least 6 characters long!';
      return false;
    } else {
      setPasswordErrorText.value = null;
      return true;
    }
  }

  Future<bool> runConfirmPassword() async {
    final password = setPasswordController.text;
    final confirmPassword = confirmPasswordController.text;
    if (password != confirmPassword) {
      confirmPasswordErrorText.value = 'Passwords do not match!';
      return false;
    } else {
      confirmPasswordErrorText.value = null;
      return true;
    }
  }

  Future<bool> runRegistration() async {
    isRegistering.value = true;

    final name = setNameController.text.trim();
    final password = setPasswordController.text;
    final keys = await Keys.generate(id, password);
    final fcmToken = await globals.firebase.getToken();

    try {
      await UserApi.create(id, keys.publicKey, fcmToken);

      await Auth.setUser(id, name, password, keys);
      await Auth.login(password);

      registrationErrorText.value = null;
      isRegistering.value = false;
      return true;
    } catch (err) {
      registrationErrorText.value = err.toString();
      isRegistering.value = false;
      return false;
    }
  }

  nextStep() async {
    switch (step.value) {
      case RegistrationStep.ENABLE_NOTIFICATIONS:
        final enableNotificationsSuccess = await runEnableNotifications();
        if (enableNotificationsSuccess) {
          step.value = RegistrationStep.SET_NAME;
        }
        break;
      case RegistrationStep.SET_NAME:
        final setNameSuccess = await runSetName();
        if (setNameSuccess) {
          step.value = RegistrationStep.SET_PASSWORD;
        }
        break;
      case RegistrationStep.SET_PASSWORD:
        final setPasswordSuccess = await runSetPassword();
        if (setPasswordSuccess) {
          step.value = RegistrationStep.CONFIRM_PASSWORD;
        }
        break;
      case RegistrationStep.CONFIRM_PASSWORD:
        final confirmPasswordSuccess = await runConfirmPassword();
        if (confirmPasswordSuccess) {
          step.value = RegistrationStep.REGISTRATION;
        }
        break;
      case RegistrationStep.REGISTRATION:
        final registrationSuccess = await runRegistration();
        if (registrationSuccess) {
          boot.destination != null
              ? await boot.destination()
              : await Get.off(HomePage());
        }
    }
  }

  prevStep() async {
    switch (step.value) {
      case RegistrationStep.ENABLE_NOTIFICATIONS:
        Get.back();
        return;
      default:
        step.value = RegistrationStep.values[step.value.index - 1];
    }
  }

  bool isCurrentStep(RegistrationStep renderStep) {
    return step.value == renderStep;
  }

  StepState getStepState(RegistrationStep renderStep) {
    if (isCurrentStep(renderStep)) {
      return StepState.editing;
    } else if (step.value.index < renderStep.index) {
      return StepState.disabled;
    } else {
      return StepState.complete;
    }
  }
}

class RegistrationPage extends StatelessWidget {
  final BootConfig boot;

  RegistrationPage(BootConfig boot, {Key key})
      : this.boot = boot,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    final c = Get.safePut(RegistrationController(globals, boot));

    final enableNotificationsViaPrompt = Column(children: [
      RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
            TextSpan(text: 'Press '),
            TextSpan(
                text: ' Continue ',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.green,
                    fontWeight: FontWeight.bold)),
            TextSpan(text: '.\n\nThen select '),
            TextSpan(
                text: 'Allow',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            TextSpan(text: ' when prompted.'),
          ])),
      Image.asset('assets/images/notifications_prompt.jpg').paddingAll(20)
    ]);

    final enableNotificationsViaSettings = Column(children: [
      RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
            TextSpan(text: 'Go to '),
            TextSpan(
                text:
                    ' Settings > Dictionary > Notifications > Allow Notifications:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: '\n\n(scroll image from left to right)'),
          ])),
      SizedBox(
              height: 300,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Image.asset(
                      'assets/images/enable_notifications_steps.jpg')))
          .paddingAll(20),
      RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
            TextSpan(text: '\n\nThen come back and press '),
            TextSpan(
                text: ' Continue ',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.green,
                    fontWeight: FontWeight.bold)),
          ])),
    ]);

    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          actions: [
            Tooltip(
                message: 'Settings',
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Get.to(SettingsPage()),
                )),
          ],
        ),
        body: Obx(() => Stepper(
              steps: [
                Step(
                    title: const Text('Enable notifications'),
                    content: c.authorizationStatus.value ==
                            AuthorizationStatus.notDetermined
                        ? enableNotificationsViaPrompt
                        : (c.authorizationStatus.value ==
                                AuthorizationStatus.denied
                            ? enableNotificationsViaSettings
                            : Column(children: [
                                Icon(Icons.check_circle,
                                    color: Colors.green, size: 50),
                                Text("You're all set!")
                              ])),
                    isActive:
                        c.isCurrentStep(RegistrationStep.ENABLE_NOTIFICATIONS),
                    state:
                        c.getStepState(RegistrationStep.ENABLE_NOTIFICATIONS)),
                Step(
                    title: const Text('Enter a name'),
                    content: TextField(
                      controller: c.setNameController,
                      decoration:
                          InputDecoration(errorText: c.setNameErrorText.value),
                    ),
                    isActive: c.isCurrentStep(RegistrationStep.SET_NAME),
                    state: c.getStepState(RegistrationStep.SET_NAME)),
                Step(
                    title: const Text('Set password'),
                    content: TextField(
                      controller: c.setPasswordController,
                      decoration: InputDecoration(
                          errorText: c.setPasswordErrorText.value),
                      obscureText: true,
                    ),
                    isActive: c.isCurrentStep(RegistrationStep.SET_PASSWORD),
                    state: c.getStepState(RegistrationStep.SET_PASSWORD)),
                Step(
                    title: const Text('Confirm password'),
                    content: TextField(
                      controller: c.confirmPasswordController,
                      decoration: InputDecoration(
                          errorText: c.confirmPasswordErrorText.value),
                      obscureText: true,
                    ),
                    isActive:
                        c.isCurrentStep(RegistrationStep.CONFIRM_PASSWORD),
                    state: c.getStepState(RegistrationStep.CONFIRM_PASSWORD)),
                Step(
                    title: const Text('Register'),
                    content: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: c.isRegistering.value
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.blue,
                                        )),
                                    SizedBox(height: 20),
                                    Text('Processing...',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Text('It may take up to a minute'),
                                    Text('Please be patient')
                                  ])
                            : (c.registrationErrorText.value != null
                                ? Column(children: [
                                    Icon(Icons.error,
                                        color: Colors.red, size: 50),
                                    Text(c.registrationErrorText.value ?? '')
                                  ])
                                : SizedBox.shrink())),
                    isActive: c.isCurrentStep(RegistrationStep.REGISTRATION),
                    state: c.getStepState(RegistrationStep.REGISTRATION))
              ],
              currentStep: c.step.value.index,
              onStepContinue: c.isRegistering.value ? null : c.nextStep,
              onStepCancel: c.prevStep,
            )));
  }
}
