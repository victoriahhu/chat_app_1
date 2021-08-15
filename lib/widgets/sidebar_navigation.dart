import 'package:bloc/bloc.dart';
import '../screens/all_screens.dart';

enum NavigationEvents {
  ConversationsClickedEvent,
  MeetingsClickedEvent,
  MyOrdersClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => ConversationsScreen();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.ConversationsClickedEvent:
        yield ConversationsScreen();
        break;
      case NavigationEvents.MeetingsClickedEvent:
        yield MeetingsPage();
        break;
      case NavigationEvents.MyOrdersClickedEvent:
        yield MyOrdersPage();
        break;
    }
  }
}