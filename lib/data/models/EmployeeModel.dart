/// items : [{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7369"},"rn":1,"empno":7369,"ename":"SMITH","job":"CLERK","hiredate":"1980-12-16T17:00:00Z","mgr":7902,"sal":800,"comm":null,"deptno":20},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7499"},"rn":2,"empno":7499,"ename":"ALLEN","job":"SALESMAN","hiredate":"1981-02-19T17:00:00Z","mgr":7698,"sal":1600,"comm":300,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7521"},"rn":3,"empno":7521,"ename":"WARD","job":"SALESMAN","hiredate":"1981-02-21T17:00:00Z","mgr":7698,"sal":1250,"comm":500,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7566"},"rn":4,"empno":7566,"ename":"JONES","job":"MANAGER","hiredate":"1981-04-01T17:00:00Z","mgr":7839,"sal":2975,"comm":null,"deptno":20},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7654"},"rn":5,"empno":7654,"ename":"MARTIN","job":"SALESMAN","hiredate":"1981-09-27T17:00:00Z","mgr":7698,"sal":1250,"comm":1400,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7698"},"rn":6,"empno":7698,"ename":"BLAKE","job":"MANAGER","hiredate":"1981-04-30T17:00:00Z","mgr":7839,"sal":2850,"comm":null,"deptno":30},{"uri":{"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/7782"},"rn":7,"empno":7782,"ename":"CLARK","job":"MANAGER","hiredate":"1981-06-08T17:00:00Z","mgr":7839,"sal":2450,"comm":null,"deptno":10}]
/// first : {"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/"}
/// next : {"$ref":"https://demo.medxa.id:8443/simrs/pon/hr/employees/?page=1"}

class EmployeeModel {
  EmployeeModel({
      List<Items>? items, 
      First? first, 
      Next? next,}){
    _items = items;
    _first = first;
    _next = next;
}

  EmployeeModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _first = json['first'] != null ? First.fromJson(json['first']) : null;
    _next = json['next'] != null ? Next.fromJson(json['next']) : null;
  }
  List<Items>? _items;
  First? _first;
  Next? _next;
EmployeeModel copyWith({  List<Items>? items,
  First? first,
  Next? next,
}) => EmployeeModel(  items: items ?? _items,
  first: first ?? _first,
  next: next ?? _next,
);
  List<Items>? get items => _items;
  First? get first => _first;
  Next? get next => _next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    if (_first != null) {
      map['first'] = _first?.toJson();
    }
    if (_next != null) {
      map['next'] = _next?.toJson();
    }
    return map;
  }

}

/// $ref : "https://demo.medxa.id:8443/simrs/pon/hr/employees/?page=1"

class Next {
  Next({
      String? ref,}){
    _ref = ref;
}

  Next.fromJson(dynamic json) {
    _ref = json['$ref'];
  }
  String? _ref;
Next copyWith({  String? ref,
}) => Next(  ref: ref ?? _ref,
);
  String? get ref => _ref;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$ref'] = _ref;
    return map;
  }

}

/// $ref : "https://demo.medxa.id:8443/simrs/pon/hr/employees/"

class First {
  First({
      String? ref,}){
    _ref = ref;
}

  First.fromJson(dynamic json) {
    _ref = json['$ref'];
  }
  String? _ref;
First copyWith({  String? ref,
}) => First(  ref: ref ?? _ref,
);
  String? get ref => _ref;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$ref'] = _ref;
    return map;
  }

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
      num? deptno,}){
    _uri = uri;
    _rn = rn;
    _empno = empno;
    _ename = ename;
    _job = job;
    _hiredate = hiredate;
    _mgr = mgr;
    _sal = sal;
    _comm = comm;
    _deptno = deptno;
}

  Items.fromJson(dynamic json) {
    _uri = json['uri'] != null ? Uri.fromJson(json['uri']) : null;
    _rn = json['rn'];
    _empno = json['empno'];
    _ename = json['ename'];
    _job = json['job'];
    _hiredate = json['hiredate'];
    _mgr = json['mgr'];
    _sal = json['sal'];
    _comm = json['comm'];
    _deptno = json['deptno'];
  }
  Uri? _uri;
  num? _rn;
  num? _empno;
  String? _ename;
  String? _job;
  String? _hiredate;
  num? _mgr;
  num? _sal;
  dynamic _comm;
  num? _deptno;
Items copyWith({  Uri? uri,
  num? rn,
  num? empno,
  String? ename,
  String? job,
  String? hiredate,
  num? mgr,
  num? sal,
  dynamic comm,
  num? deptno,
}) => Items(  uri: uri ?? _uri,
  rn: rn ?? _rn,
  empno: empno ?? _empno,
  ename: ename ?? _ename,
  job: job ?? _job,
  hiredate: hiredate ?? _hiredate,
  mgr: mgr ?? _mgr,
  sal: sal ?? _sal,
  comm: comm ?? _comm,
  deptno: deptno ?? _deptno,
);
  Uri? get uri => _uri;
  num? get rn => _rn;
  num? get empno => _empno;
  String? get ename => _ename;
  String? get job => _job;
  String? get hiredate => _hiredate;
  num? get mgr => _mgr;
  num? get sal => _sal;
  dynamic get comm => _comm;
  num? get deptno => _deptno;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_uri != null) {
      map['uri'] = _uri?.toJson();
    }
    map['rn'] = _rn;
    map['empno'] = _empno;
    map['ename'] = _ename;
    map['job'] = _job;
    map['hiredate'] = _hiredate;
    map['mgr'] = _mgr;
    map['sal'] = _sal;
    map['comm'] = _comm;
    map['deptno'] = _deptno;
    return map;
  }

}

/// $ref : "https://demo.medxa.id:8443/simrs/pon/hr/employees/7369"

class Uri {
  Uri({
      String? ref,}){
    _ref = ref;
}

  Uri.fromJson(dynamic json) {
    _ref = json['$ref'];
  }
  String? _ref;
Uri copyWith({  String? ref,
}) => Uri(  ref: ref ?? _ref,
);
  String? get ref => _ref;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$ref'] = _ref;
    return map;
  }

}