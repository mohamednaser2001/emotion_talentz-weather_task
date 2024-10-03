import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
 late int? statusCode;
  late String? message;
  String? errors;

  ErrorMessageModel({
  this.statusCode,
   this.message,
   required this.errors
});

 ErrorMessageModel.fromJson(Map<String, dynamic> json) {
     statusCode= json["status"];
      message= json["message"]??'';
      errors= _mergeErrors(json["errors"] as Map<String, List<String>>);
  }



  /// Get errors from api and convert it to single string.
  String _mergeErrors(Map<String, List<String>> errors){
   String mergedErrors = '';
   try{
      errors.forEach((key, value) {
        mergedErrors += '\nvalue.first';
      });
      return mergedErrors;
    } catch(e){
    return mergedErrors;
   }
  }



  @override
  List<Object?> get props => [
   statusCode,
    message,
    errors,
  ];
}
