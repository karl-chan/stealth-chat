import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/boot/boot_screen.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/home/home_page.dart';
import 'package:stealth_chat/util/api/user_api.dart';
import 'package:stealth_chat/util/security/auth.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:uuid/uuid.dart';

enum RegistrationStep { SET_NAME, SET_PASSWORD, CONFIRM_PASSWORD, REGISTRATION }

class RegistrationController extends GetxController {
  final String id = Uuid().v4();
  final Globals globals = Get.find();
  final BootConfig boot;

  RegistrationController(BootConfig boot) : this.boot = boot;

  Rx<RegistrationStep> step = RegistrationStep.SET_NAME.obs;
  RxBool isRegistering = false.obs;
  RxString setNameErrorText = RxString(null);
  RxString setPasswordErrorText = RxString(null);
  RxString confirmPasswordErrorText = RxString(null);
  RxString registrationErrorText = RxString(null);

  var setNameController = TextEditingController();
  var setPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  Future<bool> runSetName() async {
    final name = setNameController.text;
    if (name.isBlank) {
      setNameErrorText.value = 'Name must not be empty!';
      return false;
    } else {
      setNameErrorText.nil();
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
      setPasswordErrorText.nil();
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
      confirmPasswordErrorText.nil();
      return true;
    }
  }

  Future<bool> runRegistration() async {
    isRegistering.value = true;

    final name = setNameController.text;
    final password = setPasswordController.text;
    final keys = await Keys.generate(id, password);

    try {
      await UserApi.create(id, keys.publicKey);

      await Auth.setUser(id, name, password, keys);
      await Auth.login(password);

      registrationErrorText.nil();
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
              : await Get.off(() => HomePage());
        }
    }
  }

  prevStep() async {
    switch (step.value) {
      case RegistrationStep.SET_NAME:
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
    final c = RegistrationController(boot);

    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        body: Obx(() => Stepper(
              steps: [
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
                            ? SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.blue,
                                ))
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
