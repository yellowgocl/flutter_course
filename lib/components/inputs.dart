import 'package:course_book/utils/log.dart';
import 'package:flutter/material.dart';

class RadioBuilder<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final bool disabled;
  final Function(T value) onChanged;
  final Widget Function(BuildContext context, T value, T groupValue) builder;
  RadioBuilder(
      {@required this.value,
      Key key,
      this.disabled = false,
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
          if (!widget.disabled && widget?.value != widget?.groupValue)
            widget?.onChanged(widget?.value);
        },
        child: widget?.builder(context, widget?.value, widget?.groupValue));
  }
}

class RadioGroup<T> extends StatefulWidget {
  final T checked;
  final List<T> options;
  final Widget Function(BuildContext context, T data, T groupValue, [int index])
      itemBuilder;
  final MultiChildRenderObjectWidget Function(
      BuildContext context, List<Widget> items) containerBuilder;
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
    List<Widget> result = widget?.options?.asMap()?.keys?.map((index) {
      T e = widget?.options[index];
      return RadioBuilder(
        value: e,
        groupValue: widget?.checked,
        builder: (BuildContext context, T value, T groupValue) {
          return widget?.itemBuilder(context, value, groupValue, index);
        },
        onChanged: widget?.onChanged,
      );
    })?.toList();
    return result;
  }

  Widget _containerBuilder(BuildContext context, List<Widget> items) {
    return Row(
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    Function caller = widget?.containerBuilder ?? _containerBuilder;
    return caller(context, buildItems(context));
  }
}
