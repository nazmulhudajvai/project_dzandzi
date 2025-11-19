class create_post_model {
  String? name;
  String? location;
  String? startDate;
  String? endDate;
  String? status;
  String? projectManagerId;

  create_post_model(
      {this.name,
      this.location,
      this.startDate,
      this.endDate,
      this.status,
      this.projectManagerId});

  create_post_model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    projectManagerId = json['projectManagerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    data['projectManagerId'] = this.projectManagerId;
    return data;
  }
}
