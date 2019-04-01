// GENERATED CODE - DO NOT MODIFY BY HAND

part of award;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GalleryActionModel> _$galleryActionModelSerializer =
    new _$GalleryActionModelSerializer();

class _$GalleryActionModelSerializer
    implements StructuredSerializer<GalleryActionModel> {
  @override
  final Iterable<Type> types = const [GalleryActionModel, _$GalleryActionModel];
  @override
  final String wireName = 'GalleryActionModel';

  @override
  Iterable serialize(Serializers serializers, GalleryActionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.attaches != null) {
      result
        ..add('attaches')
        ..add(serializers.serialize(object.attaches,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.fullScreen != null) {
      result
        ..add('fullScreen')
        ..add(serializers.serialize(object.fullScreen,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  GalleryActionModel deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GalleryActionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'attaches':
          result.attaches.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fullScreen':
          result.fullScreen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GalleryActionModel extends GalleryActionModel {
  @override
  final String name;
  @override
  final String date;
  @override
  final BuiltList<String> attaches;
  @override
  final String id;
  @override
  final bool fullScreen;

  factory _$GalleryActionModel([void updates(GalleryActionModelBuilder b)]) =>
      (new GalleryActionModelBuilder()..update(updates)).build();

  _$GalleryActionModel._(
      {this.name, this.date, this.attaches, this.id, this.fullScreen})
      : super._();

  @override
  GalleryActionModel rebuild(void updates(GalleryActionModelBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  GalleryActionModelBuilder toBuilder() =>
      new GalleryActionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GalleryActionModel &&
        name == other.name &&
        date == other.date &&
        attaches == other.attaches &&
        id == other.id &&
        fullScreen == other.fullScreen;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, name.hashCode), date.hashCode), attaches.hashCode),
            id.hashCode),
        fullScreen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GalleryActionModel')
          ..add('name', name)
          ..add('date', date)
          ..add('attaches', attaches)
          ..add('id', id)
          ..add('fullScreen', fullScreen))
        .toString();
  }
}

class GalleryActionModelBuilder
    implements Builder<GalleryActionModel, GalleryActionModelBuilder> {
  _$GalleryActionModel _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  ListBuilder<String> _attaches;
  ListBuilder<String> get attaches =>
      _$this._attaches ??= new ListBuilder<String>();
  set attaches(ListBuilder<String> attaches) => _$this._attaches = attaches;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  bool _fullScreen;
  bool get fullScreen => _$this._fullScreen;
  set fullScreen(bool fullScreen) => _$this._fullScreen = fullScreen;

  GalleryActionModelBuilder();

  GalleryActionModelBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _date = _$v.date;
      _attaches = _$v.attaches?.toBuilder();
      _id = _$v.id;
      _fullScreen = _$v.fullScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GalleryActionModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GalleryActionModel;
  }

  @override
  void update(void updates(GalleryActionModelBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$GalleryActionModel build() {
    _$GalleryActionModel _$result;
    try {
      _$result = _$v ??
          new _$GalleryActionModel._(
              name: name,
              date: date,
              attaches: _attaches?.build(),
              id: id,
              fullScreen: fullScreen);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'attaches';
        _attaches?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GalleryActionModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
