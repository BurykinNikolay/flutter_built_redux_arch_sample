// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CameraState> _$cameraStateSerializer = new _$CameraStateSerializer();

class _$CameraStateSerializer implements StructuredSerializer<CameraState> {
  @override
  final Iterable<Type> types = const [CameraState, _$CameraState];
  @override
  final String wireName = 'CameraState';

  @override
  Iterable serialize(Serializers serializers, CameraState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.cameraDescription != null) {
      result
        ..add('cameraDescription')
        ..add(serializers.serialize(object.cameraDescription,
            specifiedType: const FullType(CameraDescription)));
    }
    if (object.cameraController != null) {
      result
        ..add('cameraController')
        ..add(serializers.serialize(object.cameraController,
            specifiedType: const FullType(CameraController)));
    }
    if (object.cameras != null) {
      result
        ..add('cameras')
        ..add(serializers.serialize(object.cameras,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CameraDescription)])));
    }
    if (object.currentFilePath != null) {
      result
        ..add('currentFilePath')
        ..add(serializers.serialize(object.currentFilePath,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  CameraState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CameraStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cameraDescription':
          result.cameraDescription = serializers.deserialize(value,
                  specifiedType: const FullType(CameraDescription))
              as CameraDescription;
          break;
        case 'cameraController':
          result.cameraController = serializers.deserialize(value,
                  specifiedType: const FullType(CameraController))
              as CameraController;
          break;
        case 'cameras':
          result.cameras.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CameraDescription)]))
              as BuiltList);
          break;
        case 'currentFilePath':
          result.currentFilePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CameraState extends CameraState {
  @override
  final CameraDescription cameraDescription;
  @override
  final CameraController cameraController;
  @override
  final BuiltList<CameraDescription> cameras;
  @override
  final String currentFilePath;

  factory _$CameraState([void Function(CameraStateBuilder) updates]) =>
      (new CameraStateBuilder()..update(updates)).build();

  _$CameraState._(
      {this.cameraDescription,
      this.cameraController,
      this.cameras,
      this.currentFilePath})
      : super._();

  @override
  CameraState rebuild(void Function(CameraStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CameraStateBuilder toBuilder() => new CameraStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CameraState &&
        cameraDescription == other.cameraDescription &&
        cameraController == other.cameraController &&
        cameras == other.cameras &&
        currentFilePath == other.currentFilePath;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, cameraDescription.hashCode), cameraController.hashCode),
            cameras.hashCode),
        currentFilePath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CameraState')
          ..add('cameraDescription', cameraDescription)
          ..add('cameraController', cameraController)
          ..add('cameras', cameras)
          ..add('currentFilePath', currentFilePath))
        .toString();
  }
}

class CameraStateBuilder implements Builder<CameraState, CameraStateBuilder> {
  _$CameraState _$v;

  CameraDescription _cameraDescription;
  CameraDescription get cameraDescription => _$this._cameraDescription;
  set cameraDescription(CameraDescription cameraDescription) =>
      _$this._cameraDescription = cameraDescription;

  CameraController _cameraController;
  CameraController get cameraController => _$this._cameraController;
  set cameraController(CameraController cameraController) =>
      _$this._cameraController = cameraController;

  ListBuilder<CameraDescription> _cameras;
  ListBuilder<CameraDescription> get cameras =>
      _$this._cameras ??= new ListBuilder<CameraDescription>();
  set cameras(ListBuilder<CameraDescription> cameras) =>
      _$this._cameras = cameras;

  String _currentFilePath;
  String get currentFilePath => _$this._currentFilePath;
  set currentFilePath(String currentFilePath) =>
      _$this._currentFilePath = currentFilePath;

  CameraStateBuilder();

  CameraStateBuilder get _$this {
    if (_$v != null) {
      _cameraDescription = _$v.cameraDescription;
      _cameraController = _$v.cameraController;
      _cameras = _$v.cameras?.toBuilder();
      _currentFilePath = _$v.currentFilePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CameraState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CameraState;
  }

  @override
  void update(void Function(CameraStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CameraState build() {
    _$CameraState _$result;
    try {
      _$result = _$v ??
          new _$CameraState._(
              cameraDescription: cameraDescription,
              cameraController: cameraController,
              cameras: _cameras?.build(),
              currentFilePath: currentFilePath);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'cameras';
        _cameras?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CameraState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
