import 'dart:async';
import 'package:lyc_clinic/ui/about/data/about.dart';

abstract class AboutRepository {
  Future<About> getContent(String accessCode);
}
