import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/core_providers.dart';
import '../../core/services/app_services.dart';

enum AuthStage{loading,setup,locked,authenticated}
class AuthState {const AuthState(this.stage,{this.profile,this.error});final AuthStage stage;final BusinessProfile? profile;final String? error;}
class AuthController extends StateNotifier<AuthState>{
  AuthController(this.ref):super(const AuthState(AuthStage.loading)){init();} final Ref ref;
  Future<void> init() async {final prefs=ref.read(businessPrefsProvider),pin=ref.read(pinServiceProvider);final profile=await prefs.read();state=(await prefs.complete())&&(await pin.exists())&&profile!=null?AuthState(AuthStage.locked,profile:profile):const AuthState(AuthStage.setup);}
  Future<void> setup(BusinessProfile profile,String pin) async {await ref.read(businessPrefsProvider).save(profile);await ref.read(pinServiceProvider).save(pin);state=AuthState(AuthStage.authenticated,profile:profile);}
  Future<void> login(String pin) async {if(await ref.read(pinServiceProvider).verify(pin)){state=AuthState(AuthStage.authenticated,profile:state.profile);}else{state=AuthState(AuthStage.locked,profile:state.profile,error:'Incorrect PIN');}}
  void logout()=>state=AuthState(AuthStage.locked,profile:state.profile);
  Future<bool> changePin(String oldPin,String newPin) async {final service=ref.read(pinServiceProvider);if(!await service.verify(oldPin))return false;await service.save(newPin);return true;}
  Future<void> reset() async {await ref.read(pinServiceProvider).clear();await ref.read(businessPrefsProvider).clear();state=const AuthState(AuthStage.setup);}
}
final authProvider=StateNotifierProvider<AuthController,AuthState>((ref)=>AuthController(ref));
