class HomeDataModel {
   int ? ComplitedProjects;
   int ? InProgressProjects;

   HomeDataModel({this.ComplitedProjects,this.InProgressProjects});

   HomeDataModel.fromJson(Map<String,dynamic>json){
    ComplitedProjects=json['COMPLETED'];
    InProgressProjects=json['ACTIVE'];
   }

   Map<String,dynamic>toJson(){
    final Map<String,dynamic>data=new Map<String,dynamic>();
    data['COMPLETED']=this.ComplitedProjects;
    data['ACTIVE']=this.InProgressProjects;
    return data;
   }
}