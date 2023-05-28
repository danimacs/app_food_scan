import 'package:flutter/material.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T? data) builder;

  CustomFutureBuilder({
    required this.future,
    required this.builder,
  }) : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        } else {
          return builder(context, snapshot.data);
        }
      },
    );
  }
}
