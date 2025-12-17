import 'package:collection/collection.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

extension Submit<T> on FormModel<T, T> {
  void validateAndSubmit(
    void Function(T model) submit, {
    FormGroup? formGroup,
  }) {
    (formGroup ?? form).markAllAsTouched();
    if ((formGroup ?? form).valid) {
      submit(rawModel);
    } else {
      (formGroup ?? form).controls.forEach((key, value) {
        value.markAllAsTouched();
        if (value.hasErrors) {
          if (value is FormGroup) {
            value.controls.entries
                .firstWhereOrNull((e) => e.value.hasErrors)
                ?.value
                .focus();
          } else if (value is FormArray) {
            for (final e in value.controls) {
              e.markAllAsTouched();
            }
            value.controls.firstWhereOrNull((e) => e.hasErrors)?.focus();
          } else {
            value.focus();
          }
          return;
        }
      });
    }
  }
}
