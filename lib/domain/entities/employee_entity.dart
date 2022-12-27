import 'package:equatable/equatable.dart';

class EmployeeEntity extends Equatable {
  final List<ItemsEntity> items;
  final FirstEntity first;
  final PrevEntity prev;

  const EmployeeEntity(
      {required this.items, required this.first, required this.prev});

  @override
  List<Object?> get props => [items, first, prev];
}


class PrevEntity extends Equatable {
  final String ref;

  const PrevEntity({required this.ref});

  @override
  List<Object?> get props => [ref];
}

class FirstEntity extends Equatable {
  final String ref;

  const FirstEntity({required this.ref});

  @override
  List<Object?> get props => [ref];
}

class ItemsEntity extends Equatable {
  final UriEntity? uri;
  final num? rn;
  final num? empno;
  final String? ename;
  final String? job;
  final String? hiredate;
  final num? mgr;
  final num? sal;
  final dynamic comm;
  final num? deptno;

  const ItemsEntity(
      {required this.uri,
      required this.rn,
      required this.empno,
      required this.ename,
      required this.job,
      required this.hiredate,
      required this.mgr,
      required this.sal,
      required this.comm,
      required this.deptno});

  @override
  List<Object?> get props =>
      [uri, rn, empno, ename, job, hiredate, mgr, sal, comm, deptno];
}
class UriEntity extends Equatable {
  final String ref;

  const UriEntity({required this.ref});

  @override
  List<Object?> get props => [ref];
}
