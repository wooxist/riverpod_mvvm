// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_mvvm/sources/widgets/platform_widget.dart';

/// Utility Scaffold that uses [CupertinoPageScaffold] under [CupertinoApp] and
/// [Scaffold] under [MaterialApp].
class UniversalScaffold extends PlatformStatelessWidget {
  /// See [CupertinoPageScaffold.child] and [Scaffold.body]
  final Widget body;

  /// See [Scaffold.resizeToAvoidBottomInset]
  final bool? resizeToAvoidBottomInset;

  const UniversalScaffold({
    super.key,
    required this.body,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      child: body,
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      body: body,
    );
  }
}
