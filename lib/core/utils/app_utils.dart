import 'package:intl/intl.dart';

final _ghs=NumberFormat.currency(locale:'en_GH',symbol:'GH₵ ',decimalDigits:2);
String formatGhs(num value)=>_ghs.format(value);

class Validators {
  static String? requiredText(String? value,{String label='Field'})=>value==null||value.trim().isEmpty?'$label is required':null;
  static String? money(String? value){final n=double.tryParse(value??'');return n==null||n<0?'Enter a valid amount':null;}
  static String? whole(String? value){final n=int.tryParse(value??'');return n==null||n<0?'Enter a valid whole number':null;}
  static String? pin(String? value)=>value!=null&&RegExp(r'^\d{4}$').hasMatch(value)?null:'Enter exactly four digits';
}
