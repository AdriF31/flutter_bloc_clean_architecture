import 'package:advicer/domain/entities/employee_entity.dart';
import 'package:equatable/equatable.dart';

class EmployeeModel extends EmployeeEntity with EquatableMixin {
  final List<Items> items;
  final FirstEntity first;
  final PrevEntity prev;

  EmployeeModel({required this.items, required this.first, required this.prev})
      : super(items: items, first: first, prev: prev);

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
        items: json['items'], first: json['first'], prev: json['prev']);
  }
}

class Items extends ItemsEntity with EquatableMixin {
  final Uri? uri;
  final num? rn;
  final num? empno;
  final String? ename;
  final String? job;
  final String? hiredate;
  final num? mgr;
  final num? sal;
  final dynamic comm;
  final num? deptno;

  Items(
      {required this.uri,
      required this.rn,
      required this.empno,
      required this.ename,
      required this.job,
      required this.hiredate,
      required this.mgr,
      required this.sal,
      required this.comm,
      required this.deptno})
      : super(
            uri: uri,
            sal: sal,
            rn: rn,
            mgr: mgr,
            job: job,
            hiredate: hiredate,
            ename: ename,
            empno: empno,
            deptno: deptno,
            comm: comm);

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
        uri: json['uri'],
        rn: json['rn'],
        empno: json['empno'],
        ename: json['ename'],
        job: json['job'],
        hiredate: json['hiredate'],
        mgr: json['mgr'],
        sal: json['sal'],
        comm: json['comm'],
        deptno: json['deptno']);
  }
}

class First extends FirstEntity with EquatableMixin {
  final String ref;

  First({required this.ref}) : super(ref: ref);

  factory First.fromJson(Map<String, dynamic> json) {
    return First(ref: json['ref']);
  }
}

class Uri extends UriEntity with EquatableMixin {
  final String ref;

  Uri({required this.ref}) : super(ref: ref);

  factory Uri.fromJson(Map<String, dynamic> json) {
    return Uri(ref: json['ref']);
  }
}

class Prev extends PrevEntity with EquatableMixin {
  final String ref;

  Prev({required this.ref}) : super(ref: ref);

  factory Prev.fromJson(Map<String, dynamic> json) {
    return Prev(ref: json['ref']);
  }
}
