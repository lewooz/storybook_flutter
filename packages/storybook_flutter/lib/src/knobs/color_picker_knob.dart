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
    subtitle: InkWell(
      onTap: (){
        showDialog<Color>(
            context: context,
            barrierDismissible: false,
            builder: (context){
              Color selectedColor = value;
              return AlertDialog(
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                actions: [TextButton(
                    onPressed: () {
                      Navigator.pop(context, selectedColor);
                    },
                    child: const Text('Select Color', style: TextStyle(color: Colors.black))),],
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: value,
                    onColorChanged: (color)=> selectedColor = color,
                    colorPickerWidth: 300,
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
              );
            }
        ).then((newColor) => context.read<StoryProvider>().update(label, newColor),);
      },
      child: Container(
        color: value,
        width: 50,
        height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle
          ),
      ),
    ),
    title: Text('$label)'),
  );

}
