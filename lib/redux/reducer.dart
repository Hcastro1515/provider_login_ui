import 'actions.dart';
import 'app_state.dart'; 

AppState appReducer(AppState store, dynamic action){
  return AppState(
    isLogin: isLoginReducer(store.isLogin, action)
  ); 
}


bool isLoginReducer(bool state, dynamic action){
  if(action == LoginAction){
    return true; 
  }
  if(action == LogoutAction){
    return false; 
  }
  return state; 
}

