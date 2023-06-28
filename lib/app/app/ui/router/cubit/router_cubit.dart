import 'package:bloc/bloc.dart';

part 'router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(RouterState(0));

  void setTab(RouterTabs tab) {
    emit(RouterState(tab.index));
  }
}

enum RouterTabs { food, basket }
