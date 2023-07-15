import 'package:flutter/widgets.dart';

typedef PlatformRouteFactory = Route<dynamic>? Function(
  BuildContext context,
  RouteSettings settings,
);
