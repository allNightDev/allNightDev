import '../types/build_type.dart';
import './env.dart';

void main() => Env.newInstance(BuildType.development).run();
