import 'package:flutter/material.dart';

abstract class AllFailures {
  final String failure;

  AllFailures({required this.failure}) {
    debugPrint(failure.toString());
  }
}

class SongListError extends AllFailures {
  SongListError({required super.failure});
}
