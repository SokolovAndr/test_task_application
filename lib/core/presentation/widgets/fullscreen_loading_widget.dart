import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_application/core/utils/themes/app_colors.dart';

class FullScreenLoadingWidget extends StatelessWidget {
  const FullScreenLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(
            Theme.of(context).extension<AppColors>()!.baseGreen,
          ),
        ),
      ),
    );
  }
}

class FullScreenLoadingWidgetBuilder extends StatelessWidget {
  const FullScreenLoadingWidgetBuilder({super.key, required this.items});

  final List<FSItem> items;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final streams = items.map((e) => e.bloc(context).stream);

        return StreamBuilder(
          stream: StreamGroup.merge(streams),
          builder: (context, snapshot) {
            if (items.any((e) => e._check(snapshot.data))) {
              return const FullScreenLoadingWidget();
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class FSItem<B extends BlocBase<S>, S> {
  FSItem(this._condition);
  B bloc(BuildContext context) => context.read<B>();
  final bool Function(S) _condition;
  bool _check(v) {
    if (v == null) return false;
    if (v is S) {
      return _condition(v);
    }
    return false;
  }
}
