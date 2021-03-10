import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networking/ApiConstants.dart';
import 'package:networking/networking.dart';

Future<bool> upload(String id,String path,int type,String name) async
{
  FacultyApiProvider facultyApiProvider = ApiFactory(2).getProvider();
  ApiConstants apiConstants = ApiConstants(2);
  debugPrint(apiConstants.sendUploadsEndPoint()+id+"/"+type.toString());
  bool result = await facultyApiProvider.UploadFile(path, apiConstants.sendUploadsEndPoint()+id+"/"+type.toString()+"/",name);
  return result;
}
Future<void> findUpload(BuildContext context,String id,int type)
async {
  FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.any);

  if(result != null)
  {
    PlatformFile file = result.files.first;
    debugPrint(file.size.toString());

    if(file.size > 104857600)
    {
      final snackBar = SnackBar
        (
        behavior: SnackBarBehavior.floating,
        content: Text('File too large (max: 100MB)!'),
        action: SnackBarAction
          (
          label: 'Retry',
          onPressed: ()async
          {
            await findUpload(context,id,type);
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else
    {
      SnackBar snackBar;
      String name = file.name;
      bool isDone = await upload(id,file.path,type,name);
      if(isDone)
        snackBar = SnackBar
          (
          content: Text('Complete!'),
        );
      else
        snackBar = SnackBar
          (
          content: Text('Upload Incomplete!'),
          action: SnackBarAction
            (
            label: 'Retry',
            onPressed: ()
            async
            {
              await findUpload(context,id,type);
            },
          ),
        );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
  else
  {
    final snackBar = SnackBar
      (
      content: Text('Error during upload process!'),
      action: SnackBarAction
        (
        label: 'Retry',
        onPressed: ()
        async
        {
          await findUpload(context,id,type);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}