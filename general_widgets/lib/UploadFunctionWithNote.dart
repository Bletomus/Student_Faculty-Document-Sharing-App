import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

import 'DialogBox.dart';

Future<bool> uploadNote(String id,String path,List<int> filteredList,String dept,String name) async
{
  StudentApiProvider facultyApiProvider = ApiFactory(1).getProvider();
  ApiConstants apiConstants = ApiConstants(1);
  debugPrint(apiConstants.sendUploadsWithNoteEndPoint()+id+"/");
  bool result = await facultyApiProvider.UploadFileWithNote(path, apiConstants.sendUploadsWithNoteEndPoint()+id,filteredList,dept,name);
  return result;
}
Future<void> findUploadNote(BuildContext context,String id,List<int> filteredList,String dept)
async
{
  FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.any);

  if(result != null)
  {
    PlatformFile file = result.files.first;
    debugPrint(file.size.toString());
    if(file.size > 104857600)
    {
      DialogBox.showMessage(context, 'File too large (max: 100MB)!', 'File too large (max: 100MB)! Please try a smaller upload');
    }
    else
    {
      String name = file.name;
      bool isDone = await uploadNote(id,file.path, filteredList,dept,name);
      if(isDone)
        DialogBox.showMessage(context, "Completed", 'The upload has been completed');
      else
        DialogBox.showMessage(context, 'Upload Incomplete!', 'Upload Incomplete! Please try again to upload');
    }
  }
  else
  {
    DialogBox.showMessage(context, 'Error during upload process!', 'Error during upload process! Please try again to upload');
  }
}