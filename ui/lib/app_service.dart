import 'package:flutter/cupertino.dart';
import 'package:sinceokos_ui/port/grpc_client.dart';

class GrpcContainer extends InheritedWidget {
  GrpcContainer({@required this.grpc, @required Widget child})
      : super(child: child);

  final Grpc grpc;

  static GrpcContainer of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GrpcContainer>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
