import 'package:getx_mvvm/data/responce/ststus.dart';

class ApiResponce<T> {
  Status? status;
  T? data;
  String? massage;
  ApiResponce(this.status, this.data, this.massage);

  ApiResponce.loding() : status = Status.LOADING;
  ApiResponce.completed(this.data) : status = Status.COMPLETE;
  ApiResponce.error(this.massage) : status = Status.ERROR;

  @override
  String toString() {
    return 'status : $status \n massage : $massage \n data : $data';
  }
}
