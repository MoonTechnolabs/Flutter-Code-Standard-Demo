/// Either to retrieve data out of the three types
abstract class Either<L, M, R> {
  const Either();

  B fold<B>(B Function(L l) ifLeft, B Function(M m) ifMid, B Function(R r) ifRight);

  bool isLeft() => fold((_) => true, (_) => false, (_) => false);

  bool isMid() => fold((_) => false, (_) => true, (_) => false);

  bool isRight() => fold((_) => false, (_) => false, (_) => true);
}

class Left<L, M, R> extends Either<L, M, R> {
  final L _l;

  const Left(this._l);

  L get value => _l;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(M m) ifMid, B Function(R r) ifRight) => ifLeft(_l);

  @override
  bool operator ==(other) => other is Left && other._l == _l;

  @override
  int get hashCode => _l.hashCode;
}

class Mid<L, M, R> extends Either<L, M, R> {
  final M _m;

  const Mid(this._m);

  M get value => _m;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(M m) ifMid, B Function(R r) ifRight) => ifMid(_m);

  @override
  bool operator ==(other) => other is Mid && other._m == _m;

  @override
  int get hashCode => _m.hashCode;
}

class Right<L, M, R> extends Either<L, M, R> {
  final R _r;

  const Right(this._r);

  R get value => _r;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(M m) ifMid, B Function(R r) ifRight) => ifRight(_r);

  @override
  bool operator ==(other) => other is Right && other._r == _r;

  @override
  int get hashCode => _r.hashCode;
}
