import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomIndexProvider extends StateNotifier<int>  {

  BottomIndexProvider(): super(0);

  void setIndex(int index){
    state = index;
  }
  
}

final bottomIndexProvider = StateNotifierProvider<BottomIndexProvider, int>((ref) =>BottomIndexProvider() );