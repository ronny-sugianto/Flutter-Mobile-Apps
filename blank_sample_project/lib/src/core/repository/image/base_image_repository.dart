import 'package:blank_sample_project/src/common/common.dart';
import 'package:blank_sample_project/src/core/core.dart';
import 'package:flutter/material.dart';

part 'image_repository.dart';

abstract class BaseImageRepository {
  Future<List<Photos>?>? getAll();
}
