class Uploads {
  String id;
  String fileName;
  String location;
  String uploader;
  String uploadTime;
  String file;

  Uploads(
      {this.id,
        this.fileName,
        this.location,
        this.uploader,
        this.uploadTime,
        this.file});

  Uploads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['file_name'];
    location = json['location'];
    uploader = json['uploader'];
    uploadTime = json['upload_time'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_name'] = this.fileName;
    data['location'] = this.location;
    data['uploader'] = this.uploader;
    data['upload_time'] = this.uploadTime;
    data['file'] = this.file;
    return data;
  }
}
