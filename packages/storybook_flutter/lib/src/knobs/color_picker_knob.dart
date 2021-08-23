import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:storybook_flutter/src/knobs/knobs.dart';
import 'package:storybook_flutter/src/story_provider.dart';

class ColorPickerKnob extends Knob<Color> {
  ColorPickerKnob(String label, Color value) : super(label, value);

  @override
  Widget build() => ColorPickerKnobWidget(
    label: label,
    value: value,
  );
}

class ColorPickerKnobWidget extends StatelessWidget {
  const ColorPickerKnobWidget({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final Color value;


  @override
  Widget build(BuildContext context) => ListTile(
    subtitle: Container(
      color: value,
      padding: const EdgeInsets.all(10),
      child:  Center(
        child: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: value,
            onColorChanged: (color)=> context.read<StoryProvider>().update(label, color),
            colorPickerWidth: 250,
            pickerAreaHeightPercent: 0.7,
            enableAlpha: true,
            displayThumbColor: true,
            showLabel: true,
            paletteType: PaletteType.hsv,
            pickerAreaBorderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
          ),
        ),
      ),
    ),
    title: Text('$label)'),
  );

}
