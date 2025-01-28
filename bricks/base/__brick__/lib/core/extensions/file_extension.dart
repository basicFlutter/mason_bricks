import 'dart:io';

extension FileExtension on File {

  Future<num> getFileSizeInMB() async{
    return await length()/(1024*1024);
  }

}