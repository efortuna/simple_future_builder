import 'package:flutter/widgets.dart';

/// Signature for strategies that build widgets based on asynchronous interaction.
/// 
/// This function is only called when a future has completed.
typedef AsyncSimpleWidgetBuilder<T> = Widget Function(BuildContext context, T futureResult);

/// Extremely simple wrapper around [FutureBuilder] to reduce boilerplate for
/// the simple case where no error handling is necessary and nothing
/// is displayed until the future completes.
/// 
/// Note: if you want to deal with error handling based on what the future returns, 
/// we recommend using [FutureBuilder].
class SimpleFutureBuilder<T> extends StatelessWidget {
  SimpleFutureBuilder({Key key, this.future, this.builder}) : super(key: key);

  /// The asynchronous computation that this widget is waiting on before displaying a result.
  /// 
  /// If no future has yet completed, including in the case where [future] is null, [builder] will
  /// will never by called.
  final Future<T> future;

  /// The build strategy currently used by this builder.
  /// 
  /// This function is only called once the future completes.
  final AsyncSimpleWidgetBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(future: this.future, 
    builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
      return snapshot.hasData? builder(context, snapshot.data) : Container();
    },);
  }
}