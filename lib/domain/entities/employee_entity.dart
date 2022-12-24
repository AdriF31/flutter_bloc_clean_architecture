import 'package:equatable/equatable.dart';

/// items : [{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7369"},"rn":1,"empno":7369,"ename":"SMITH","job":"CLERK","hiredate":"1980-12-16T17:00:00Z","mgr":7902,"sal":800,"comm":null,"deptno":20},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7499"},"rn":2,"empno":7499,"ename":"ALLEN","job":"SALESMAN","hiredate":"1981-02-19T17:00:00Z","mgr":7698,"sal":1600,"comm":300,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7521"},"rn":3,"empno":7521,"ename":"WARD","job":"SALESMAN","hiredate":"1981-02-21T17:00:00Z","mgr":7698,"sal":1250,"comm":500,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7566"},"rn":4,"empno":7566,"ename":"JONES","job":"MANAGER","hiredate":"1981-04-01T17:00:00Z","mgr":7839,"sal":2975,"comm":null,"deptno":20},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7654"},"rn":5,"empno":7654,"ename":"MARTIN","job":"SALESMAN","hiredate":"1981-09-27T17:00:00Z","mgr":7698,"sal":1250,"comm":1400,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7698"},"rn":6,"empno":7698,"ename":"BLAKE","job":"MANAGER","hiredate":"1981-04-30T17:00:00Z","mgr":7839,"sal":2850,"comm":null,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7782"},"rn":7,"empno":7782,"ename":"CLARK","job":"MANAGER","hiredate":"1981-06-08T17:00:00Z","mgr":7839,"sal":2450,"comm":null,"deptno":10}]
/// first : {"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/"}
/// next : {"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/?page=1"}

class EmployeeModel extends Equatable {
  EmployeeModel({
    List<Items>? items,
    First? first,
    Next? next,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

/// $ref : "https://demo.medxa.id:8443/simrs/pon/hr/employees/?page=1"

class Next {
  Next({
    String? ref,
  });
}

/// $ref : "https://demo.medxa.id:8443/simrs/pon/hr/employees/"

class First {
  First({
    String? ref,
  });
}

/// uri : {"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7369"}
/// rn : 1
/// empno : 7369
/// ename : "SMITH"
/// job : "CLERK"
/// hiredate : "1980-12-16T17:00:00Z"
/// mgr : 7902
/// sal : 800
/// comm : null
/// deptno : 20

class Items {
  Items({
    Uri? uri,
    num? rn,
    num? empno,
    String? ename,
    String? job,
    String? hiredate,
    num? mgr,
    num? sal,
    dynamic comm,
    num? deptno,
  });
}

/// $ref : "https://demo.medxa.id:8443/simrs/pon/hr/employees/7369"

class Uri {
  Uri({
    String? ref,
  });
}
