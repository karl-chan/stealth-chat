import 'package:get/get.dart';

extension GetExtras on GetInterface {
  // Prevents race conditions between creation and deletion of same controller
  S safePut<S>(S dependency) {
    return put(dependency, tag: dependency.hashCode.toString());
  }
}
