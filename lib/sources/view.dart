/*
 * Copyright (c) 2023. Village Baby.
 */

part of '../riverpod_mvvm.dart';

/// 1. 스테이트 관리가 필요한 경우
/// 2. 복잡한 비즈니스 로직이 필요한 경우
/// 복잡하지 않은 비즈니스 로직과 스테이트 관리가 필요한 View는
/// [StatefulWidget]과 [State]을 사용합니다.
abstract class StatefulView<VM extends ViewModel, VMS>
    extends ConsumerStatefulWidget {
  const StatefulView({Key? key}) : super(key: key);

  @override
  ViewState<VM, VMS> createState();
}

abstract class ViewState<VM extends ViewModel, VMS>
    extends ConsumerState<StatefulView<VM, VMS>> {
  @override
  void initState() {
    super.initState();
    read.setUiActions(this);
    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) {
          initViewModel();
        }
      },
    );
  }

  VM get read;

  VMS get watch;

  initViewModel();
}

abstract class PagingViewState<VM extends ViewModel, VMS>
    extends ViewState<VM, VMS> {
  ScrollController? scrollController;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((value) {
      if (mounted) {
        scrollController = PrimaryScrollController.of(context);
        scrollController?.addListener(() async {
          if (scrollController!.position.pixels >
              scrollController!.position.maxScrollExtent * 0.7) {
            if (loading) {
              return;
            }
            loading = true;
            await loadMore();
            loading = false;
          }
        });
      }
    });
  }

  Future loadMore();
}

/// 1. 스테이트 관리가 필요 없는 경우
/// 2. 복잡한 비즈니스 로직이 필요한 경우
/// 복잡하지 않은 비즈니스 로직과 스테이트 관리가 필요없는 View는
/// [StatelessWidget]을 사용합니다.
abstract class StatelessView<VM extends ViewModel, VMS> extends ConsumerWidget {
  const StatelessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }

  VM get read;
}
