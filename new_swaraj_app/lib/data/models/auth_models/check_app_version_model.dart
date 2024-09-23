class CheckAppVersionModel {
  bool? status;
  String? message;
  List<Data>? data;

  CheckAppVersionModel({this.status, this.message, this.data});

  CheckAppVersionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? versionMessage;
  String? versionNo;
  String? buildNo;
  String? dateTime;
  String? platform;

  Data(
      {this.id,
        this.versionMessage,
        this.versionNo,
        this.buildNo,
        this.dateTime,
        this.platform});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    versionMessage = json['version_message'];
    versionNo = json['version_no'];
    buildNo = json['build_no'];
    dateTime = json['date_time'];
    platform = json['platform'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['version_message'] = this.versionMessage;
    data['version_no'] = this.versionNo;
    data['build_no'] = this.buildNo;
    data['date_time'] = this.dateTime;
    data['platform'] = this.platform;
    return data;
  }
}
