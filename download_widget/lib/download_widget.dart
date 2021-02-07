library download_widget;
import 'GetDirectory.dart';
import 'StartDownload.dart';
class RunDownload
{
  static Future<void> downloadFile(String url, String folder) async
  {
    Map <String, dynamic> items = await GetDirectory.requestDownloadDirectory(folder);
    String task = await StartDownload.startDownload(url,folder,items["loci"],items["savedDir"]);
  }
}
