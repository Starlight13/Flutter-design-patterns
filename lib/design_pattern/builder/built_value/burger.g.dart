// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Burger extends Burger {
  @override
  final Bun? bread;
  @override
  final Cheese? cheese;
  @override
  final Meat? meat;
  @override
  final Sauce? sauce;
  @override
  final List<Extra> extras;

  factory _$Burger([void Function(BurgerBuilder)? updates]) =>
      (new BurgerBuilder()..update(updates))._build();

  _$Burger._(
      {this.bread, this.cheese, this.meat, this.sauce, required this.extras})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(extras, r'Burger', 'extras');
  }

  @override
  Burger rebuild(void Function(BurgerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BurgerBuilder toBuilder() => new BurgerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Burger &&
        bread == other.bread &&
        cheese == other.cheese &&
        meat == other.meat &&
        sauce == other.sauce &&
        extras == other.extras;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, bread.hashCode), cheese.hashCode), meat.hashCode),
            sauce.hashCode),
        extras.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Burger')
          ..add('bread', bread)
          ..add('cheese', cheese)
          ..add('meat', meat)
          ..add('sauce', sauce)
          ..add('extras', extras))
        .toString();
  }
}

class BurgerBuilder implements Builder<Burger, BurgerBuilder> {
  _$Burger? _$v;

  Bun? _bread;
  Bun? get bread => _$this._bread;
  set bread(Bun? bread) => _$this._bread = bread;

  Cheese? _cheese;
  Cheese? get cheese => _$this._cheese;
  set cheese(Cheese? cheese) => _$this._cheese = cheese;

  Meat? _meat;
  Meat? get meat => _$this._meat;
  set meat(Meat? meat) => _$this._meat = meat;

  Sauce? _sauce;
  Sauce? get sauce => _$this._sauce;
  set sauce(Sauce? sauce) => _$this._sauce = sauce;

  List<Extra>? _extras;
  List<Extra>? get extras => _$this._extras;
  set extras(List<Extra>? extras) => _$this._extras = extras;

  BurgerBuilder() {
    Burger._setDefaults(this);
  }

  BurgerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bread = $v.bread;
      _cheese = $v.cheese;
      _meat = $v.meat;
      _sauce = $v.sauce;
      _extras = $v.extras;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Burger other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Burger;
  }

  @override
  void update(void Function(BurgerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Burger build() => _build();

  _$Burger _build() {
    final _$result = _$v ??
        new _$Burger._(
            bread: bread,
            cheese: cheese,
            meat: meat,
            sauce: sauce,
            extras: BuiltValueNullFieldError.checkNotNull(
                extras, r'Burger', 'extras'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
