import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StateProvider.autoDispose((ref) => TimeOfDay.now());
