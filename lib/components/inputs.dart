import 'package:course_book/utils/log.dart';
import 'package:flutter/material.dart';

class RadioBuilder<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final Function(T value) onChanged;
  final Widget Function(BuildContext context, T value, T groupValue) builder;
  RadioBuilder(
      {@required this.value,
      Key key,
      this.groupValue,
      @required this.onChanged,
      @required this.builder})
      : super(key: key);
  @override
  _RadioState<T> createState() => _RadioState<T>();
}

class _RadioState<T> extends State<RadioBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    // bool isSelected = widget?.value == widget?.groupValue;
    return GestureDetector(
        key: widget?.key,
        onTap: () {
          // RadioGroupState.of(context)?.setChecked(widget?.value);
          if (widget?.value != widget?.groupValue)
            widget?.onChanged(widget?.value);
        },
        child: widget?.builder(context, widget?.value, widget?.groupValue));
    // return Stack(children: [
    //   Visibility(
    //     visible: false,
    //     child: Radio<T>(
    //         value: widget.value,
    //         groupValue: widget.groupValue,
    //         onChanged: widget.onChanged),
    //   ),
    //   widget?.builder(context, widget?.value, widget?.groupValue)
    // ]);
  }
}

class RadioGroup<T> extends StatefulWidget {
  final T checked;
  final List<T> options;
  final Widget Function(BuildContext context, T data, T groupValue, [int index])
      itemBuilder;
  final MultiChildRenderObjectWidget Function(BuildContext context)
      containerBuilder;
  final void Function(T value) onChanged;
  RadioGroup(
      {Key key,
      this.checked,
      @required this.itemBuilder,
      this.containerBuilder,
      @required this.onChanged,
      @required this.options})
      : super(key: key);
  @override
  RadioGroupState<T> createState() => RadioGroupState<T>();
}

class RadioGroupState<T> extends State<RadioGroup<T>> {
  static RadioGroupState of(BuildContext context) {
    final RadioGroupState result =
        context.findAncestorStateOfType<RadioGroupState>();
    return result;
  }

  List<Widget> buildItems(BuildContext context) {
    List<Widget> result = widget?.options?.map((e) {
      return RadioBuilder(
        value: e,
        groupValue: widget?.checked,
        builder: (BuildContext context, T value, T groupValue) {
          return widget?.itemBuilder(context, value, groupValue);
        },
        onChanged: widget?.onChanged,
      );
    })?.toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // Widget container = widget?.containerBuilder(context) ?? Row();
    // widget?.containerBuilder(context)..children = buildItems(context);

    return Row(
      children: buildItems(context),
    );
  }
}
