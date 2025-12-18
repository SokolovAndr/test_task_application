import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';

class ReactivePasswordTextField<T> extends ReactiveFormField<T, String> {
  ReactivePasswordTextField({
    super.key,
    super.formControl,
    super.formControlName,
    super.valueAccessor,
    super.validationMessages,
    super.showErrors,
    super.focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    EditableTextContextMenuBuilder? contextMenuBuilder,
    bool? showCursor,
    String obscuringCharacter = '●',
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20),
    bool enableInteractiveSelection = true,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    MouseCursor? mouseCursor,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    AppPrivateCommandCallback? onAppPrivateCommand,
    String? restorationId,
    ScrollController? scrollController,
    TextSelectionControls? selectionControls,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    TextEditingController? controller,
    Clip clipBehavior = Clip.hardEdge,
    bool enableIMEPersonalizedLearning = true,
    bool stylusHandwritingEnabled = true,
    ReactiveFormFieldCallback<T>? onTap,
    ReactiveFormFieldCallback<T>? onEditingComplete,
    ReactiveFormFieldCallback<T>? onSubmitted,
    ReactiveFormFieldCallback<T>? onChanged,
    UndoHistoryController? undoController,
    bool? cursorOpacityAnimates,
    TapRegionCallback? onTapOutside,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    bool canRequestFocus = true,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
  }) : super(
         builder: (ReactiveFormFieldState<T, String> field) {
           final state = field as _ReactivePasswordTextFieldState<T>;
           final effectiveDecoration = decoration
               .applyDefaults(Theme.of(state.context).inputDecorationTheme)
               .copyWith(
                 suffixIconConstraints: const BoxConstraints(
                   maxWidth: 30,
                   maxHeight: 28,
                 ),
                 suffixIcon: IconButton(
                   visualDensity: VisualDensity.compact,
                   icon: Icon(
                     state.passwordShown
                         ? Icons.visibility_off_outlined
                         : Icons.visibility_outlined,
                     color: Theme.of(
                       state.context,
                     ).extension<AppColors>()?.base400,
                     size: 24,
                   ),
                   onPressed: state.togglePasswordShown,
                   padding: const EdgeInsets.only(right: 23),
                 ),
               );

           return TextField(
             controller: controller,
             focusNode: state.focusNode,
             decoration: effectiveDecoration.copyWith(
               errorText: state.errorText,
               isDense: true,
             ),
             keyboardType: keyboardType,
             textInputAction: textInputAction,
             style: style,
             strutStyle: strutStyle,
             textAlign: textAlign,
             textAlignVertical: textAlignVertical,
             textDirection: textDirection,
             textCapitalization: textCapitalization,
             autofocus: autofocus,
             contextMenuBuilder: contextMenuBuilder,
             readOnly: readOnly,
             showCursor: showCursor,
             obscureText: !state.passwordShown,
             smartDashesType:
                 smartDashesType ??
                 (!state.passwordShown
                     ? SmartDashesType.disabled
                     : SmartDashesType.enabled),
             smartQuotesType:
                 smartQuotesType ??
                 (!state.passwordShown
                     ? SmartQuotesType.disabled
                     : SmartQuotesType.enabled),
             enableSuggestions: false,
             maxLengthEnforcement: maxLengthEnforcement,
             maxLines: maxLines,
             minLines: minLines,
             expands: expands,
             maxLength: maxLength,
             inputFormatters: [
               LengthLimitingTextInputFormatter(250),
               ...?inputFormatters,
             ],
             enabled: field.control.enabled,
             cursorWidth: cursorWidth,
             cursorHeight: cursorHeight,
             cursorRadius: cursorRadius,
             cursorColor: cursorColor,
             scrollPadding: scrollPadding,
             scrollPhysics: scrollPhysics,
             keyboardAppearance: keyboardAppearance,
             enableInteractiveSelection: enableInteractiveSelection,
             buildCounter: buildCounter,
             autofillHints: autofillHints,
             mouseCursor: mouseCursor,
             obscuringCharacter: obscuringCharacter,
             dragStartBehavior: dragStartBehavior,
             onAppPrivateCommand: onAppPrivateCommand,
             restorationId: restorationId,
             scrollController: scrollController,
             selectionControls: selectionControls,
             selectionHeightStyle: selectionHeightStyle,
             selectionWidthStyle: selectionWidthStyle,
             clipBehavior: clipBehavior,
             enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
             stylusHandwritingEnabled: stylusHandwritingEnabled,
             onTap: onTap != null ? () => onTap(field.control) : null,
             onSubmitted: onSubmitted != null
                 ? (_) => onSubmitted(field.control)
                 : null,
             onEditingComplete: onEditingComplete != null
                 ? () => onEditingComplete.call(field.control)
                 : null,
             onChanged: (value) {
               field.didChange(value);
               onChanged?.call(field.control);
             },
             undoController: undoController,
             cursorOpacityAnimates: cursorOpacityAnimates,
             onTapOutside: onTapOutside,
             contentInsertionConfiguration: contentInsertionConfiguration,
             canRequestFocus: canRequestFocus,
             spellCheckConfiguration: spellCheckConfiguration,
             magnifierConfiguration: magnifierConfiguration,
           );
         },
       );

  @override
  ReactiveFormFieldState<T, String> createState() =>
      _ReactivePasswordTextFieldState<T>();
}

class _ReactivePasswordTextFieldState<T>
    extends ReactiveFocusableFormFieldState<T, String> {
  bool passwordShown = false;
  void togglePasswordShown() {
    setState(() {
      passwordShown = !passwordShown;
    });
  }
}
