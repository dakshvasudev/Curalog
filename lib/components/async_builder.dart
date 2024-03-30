import 'package:flutter/material.dart';

class AsyncBuilder extends StatefulWidget {
  final Future<void> Function() future;
  final Widget Function(Function() onPressed, bool loading) builder;
  const AsyncBuilder({Key? key, required this.builder, required this.future})
      : super(key: key);

  @override
  State<AsyncBuilder> createState() => _AsyncBuilderState();
}

class _AsyncBuilderState extends State<AsyncBuilder> {
  bool loading = false;

  void _executeFuture() async {
    setState(() {
      loading = true;
    });
    await widget.future();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_executeFuture, loading);
  }
}
