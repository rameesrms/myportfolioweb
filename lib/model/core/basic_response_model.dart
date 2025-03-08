class BasicResponseModel {
  bool? status;
  String? message;
  String? token;
  int? userId;
  String? file;
  bool? isTimeLeft;
  // Map<String,dynamic>? data;


  BasicResponseModel({this.status, this.message,this.userId,this.file,this.isTimeLeft,
    // this.data
  });

  BasicResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    file = json['file'];
    userId = json['user_id'];
    message = json['message'].toString();
    token = json['token'].toString();
    isTimeLeft = json['is_time_left'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['file'] = this.file;
    data['file'] = this.isTimeLeft;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['token'] = this.token;

    return data;
  }
}


class PatientsSaveResponseModel {
  bool? status;
  String? message;
  String? token;
  int? userId;
  // Map<String,dynamic>? data;


  PatientsSaveResponseModel({this.status, this.message,this.userId,
    // this.data
  });

  PatientsSaveResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    message = json['message'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['message'] = this.message;

    return data;
  }
}




class BasicListItem {
  int? id;
  String? item;

  // Map<String,dynamic>? data;


  BasicListItem({this.id, this.item,
    // this.data
  });

  BasicListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'].toString();

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item'] = this.item;

    return data;
  }
}
