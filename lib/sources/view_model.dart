/*
 * Copyright (c) 2023. Village Baby.
 */

part of '../riverpod_mvvm.dart';

/// [StatefulView] 와 [StatelessView] 를 사용할 때 비즈니스로직이 구현되는 ViewModel 입니다.
mixin ViewModel<U> {
  late final U uiActions;

  /// View 와 ViewModel을 연결합니다.
  @mustCallSuper
  void setUiActions(U uiActions) {
    this.uiActions = uiActions;
  }
}
