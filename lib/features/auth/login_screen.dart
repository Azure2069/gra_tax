import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/app_utils.dart';
import 'auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget{const LoginScreen({super.key});@override ConsumerState<LoginScreen> createState()=>_State();}
class _State extends ConsumerState<LoginScreen>{final form=GlobalKey<FormState>();final pin=TextEditingController();@override Widget build(BuildContext context){final auth=ref.watch(authProvider);return Scaffold(body:Center(child:Padding(padding:const EdgeInsets.all(24),child:Form(key:form,child:Column(mainAxisSize:MainAxisSize.min,children:[const CircleAvatar(radius:38,child:Icon(Icons.lock_outline,size:34)),const SizedBox(height:18),Text(auth.profile?.business??'Welcome back',style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight:FontWeight.w900)),const SizedBox(height:22),TextFormField(controller:pin,maxLength:4,obscureText:true,keyboardType:TextInputType.number,textAlign:TextAlign.center,decoration:InputDecoration(labelText:'PIN',counterText:'',errorText:auth.error),validator:Validators.pin,onFieldSubmitted:(_)=>ref.read(authProvider.notifier).login(pin.text)),const SizedBox(height:18),ElevatedButton(onPressed:(){if(form.currentState!.validate())ref.read(authProvider.notifier).login(pin.text);},child:const Text('Unlock app'))])))));}}
