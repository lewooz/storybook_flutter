import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/src/knobs/select_knob.dart';

abstract class Knob<T> {
  Knob(this.label, this.value);

  final String label;
  T value;

  Widget build();
}

/// Provides helper methods for creating knobs: control elements
/// that can be used in stories to dynamically update its properties.
///
/// It's injected into a story builder, so you can use it there:
///
/// ```dart
///  Story(
///    name: 'Flat button',
///    builder: (_, k) => MaterialButton(
///      onPressed: k.boolean('Enabled', initial: true) ? () {} : null,
///      child: Text(k.text('Text', initial: 'Flat button')),
///    ),
///  )
///  ```
abstract class KnobsBuilder {
  /// Creates checkbox with [label] and [initial] value.
  bool boolean({required String label, bool initial = false});

  /// Creates text input field with [label] and [initial] value.
  String text({required String label, String initial = ''});

  Color color({required String label, Color initial});

  double slider({
    required String label,
    double initial = 0,
    double max = 1,
    double min = 0,
  });

  /// Creates select field with [label], [initial] value and list of [options].
  T options<T>({
    required String label,
    required T initial,
    List<Option<T>> options = const [],
  });
}
