// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiResults {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultsSuccess value) success,
    required TResult Function(_ApiResultsError value) error,
    required TResult Function(_ApiResultsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultsSuccess value)? success,
    TResult? Function(_ApiResultsError value)? error,
    TResult? Function(_ApiResultsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultsSuccess value)? success,
    TResult Function(_ApiResultsError value)? error,
    TResult Function(_ApiResultsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultsCopyWith<$Res> {
  factory $ApiResultsCopyWith(
          ApiResults value, $Res Function(ApiResults) then) =
      _$ApiResultsCopyWithImpl<$Res, ApiResults>;
}

/// @nodoc
class _$ApiResultsCopyWithImpl<$Res, $Val extends ApiResults>
    implements $ApiResultsCopyWith<$Res> {
  _$ApiResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ApiResultsSuccessCopyWith<$Res> {
  factory _$$_ApiResultsSuccessCopyWith(_$_ApiResultsSuccess value,
          $Res Function(_$_ApiResultsSuccess) then) =
      __$$_ApiResultsSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String data, String url, Map<String, String> headers, int statusCode});
}

/// @nodoc
class __$$_ApiResultsSuccessCopyWithImpl<$Res>
    extends _$ApiResultsCopyWithImpl<$Res, _$_ApiResultsSuccess>
    implements _$$_ApiResultsSuccessCopyWith<$Res> {
  __$$_ApiResultsSuccessCopyWithImpl(
      _$_ApiResultsSuccess _value, $Res Function(_$_ApiResultsSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? url = null,
    Object? headers = null,
    Object? statusCode = null,
  }) {
    return _then(_$_ApiResultsSuccess(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ApiResultsSuccess implements _ApiResultsSuccess {
  const _$_ApiResultsSuccess(
      {required this.data,
      required this.url,
      required final Map<String, String> headers,
      required this.statusCode})
      : _headers = headers;

  @override
  final String data;
  @override
  final String url;
  final Map<String, String> _headers;
  @override
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @override
  final int statusCode;

  @override
  String toString() {
    return 'ApiResults.success(data: $data, url: $url, headers: $headers, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResultsSuccess &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, url,
      const DeepCollectionEquality().hash(_headers), statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiResultsSuccessCopyWith<_$_ApiResultsSuccess> get copyWith =>
      __$$_ApiResultsSuccessCopyWithImpl<_$_ApiResultsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) {
    return success(data, url, headers, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) {
    return success?.call(data, url, headers, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, url, headers, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultsSuccess value) success,
    required TResult Function(_ApiResultsError value) error,
    required TResult Function(_ApiResultsFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultsSuccess value)? success,
    TResult? Function(_ApiResultsError value)? error,
    TResult? Function(_ApiResultsFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultsSuccess value)? success,
    TResult Function(_ApiResultsError value)? error,
    TResult Function(_ApiResultsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _ApiResultsSuccess implements ApiResults {
  const factory _ApiResultsSuccess(
      {required final String data,
      required final String url,
      required final Map<String, String> headers,
      required final int statusCode}) = _$_ApiResultsSuccess;

  String get data;
  String get url;
  Map<String, String> get headers;
  int get statusCode;
  @JsonKey(ignore: true)
  _$$_ApiResultsSuccessCopyWith<_$_ApiResultsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ApiResultsErrorCopyWith<$Res> {
  factory _$$_ApiResultsErrorCopyWith(
          _$_ApiResultsError value, $Res Function(_$_ApiResultsError) then) =
      __$$_ApiResultsErrorCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String data, String url, Map<String, String> headers, int statusCode});
}

/// @nodoc
class __$$_ApiResultsErrorCopyWithImpl<$Res>
    extends _$ApiResultsCopyWithImpl<$Res, _$_ApiResultsError>
    implements _$$_ApiResultsErrorCopyWith<$Res> {
  __$$_ApiResultsErrorCopyWithImpl(
      _$_ApiResultsError _value, $Res Function(_$_ApiResultsError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? url = null,
    Object? headers = null,
    Object? statusCode = null,
  }) {
    return _then(_$_ApiResultsError(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ApiResultsError implements _ApiResultsError {
  const _$_ApiResultsError(
      {required this.data,
      required this.url,
      required final Map<String, String> headers,
      required this.statusCode})
      : _headers = headers;

  @override
  final String data;
  @override
  final String url;
  final Map<String, String> _headers;
  @override
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @override
  final int statusCode;

  @override
  String toString() {
    return 'ApiResults.error(data: $data, url: $url, headers: $headers, statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResultsError &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, url,
      const DeepCollectionEquality().hash(_headers), statusCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiResultsErrorCopyWith<_$_ApiResultsError> get copyWith =>
      __$$_ApiResultsErrorCopyWithImpl<_$_ApiResultsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) {
    return error(data, url, headers, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) {
    return error?.call(data, url, headers, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data, url, headers, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultsSuccess value) success,
    required TResult Function(_ApiResultsError value) error,
    required TResult Function(_ApiResultsFailure value) failure,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultsSuccess value)? success,
    TResult? Function(_ApiResultsError value)? error,
    TResult? Function(_ApiResultsFailure value)? failure,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultsSuccess value)? success,
    TResult Function(_ApiResultsError value)? error,
    TResult Function(_ApiResultsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ApiResultsError implements ApiResults {
  const factory _ApiResultsError(
      {required final String data,
      required final String url,
      required final Map<String, String> headers,
      required final int statusCode}) = _$_ApiResultsError;

  String get data;
  String get url;
  Map<String, String> get headers;
  int get statusCode;
  @JsonKey(ignore: true)
  _$$_ApiResultsErrorCopyWith<_$_ApiResultsError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ApiResultsFailureCopyWith<$Res> {
  factory _$$_ApiResultsFailureCopyWith(_$_ApiResultsFailure value,
          $Res Function(_$_ApiResultsFailure) then) =
      __$$_ApiResultsFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({NetworkException networkException});

  $NetworkExceptionCopyWith<$Res> get networkException;
}

/// @nodoc
class __$$_ApiResultsFailureCopyWithImpl<$Res>
    extends _$ApiResultsCopyWithImpl<$Res, _$_ApiResultsFailure>
    implements _$$_ApiResultsFailureCopyWith<$Res> {
  __$$_ApiResultsFailureCopyWithImpl(
      _$_ApiResultsFailure _value, $Res Function(_$_ApiResultsFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkException = null,
  }) {
    return _then(_$_ApiResultsFailure(
      networkException: null == networkException
          ? _value.networkException
          : networkException // ignore: cast_nullable_to_non_nullable
              as NetworkException,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkExceptionCopyWith<$Res> get networkException {
    return $NetworkExceptionCopyWith<$Res>(_value.networkException, (value) {
      return _then(_value.copyWith(networkException: value));
    });
  }
}

/// @nodoc

class _$_ApiResultsFailure implements _ApiResultsFailure {
  const _$_ApiResultsFailure({required this.networkException});

  @override
  final NetworkException networkException;

  @override
  String toString() {
    return 'ApiResults.failure(networkException: $networkException)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiResultsFailure &&
            (identical(other.networkException, networkException) ||
                other.networkException == networkException));
  }

  @override
  int get hashCode => Object.hash(runtimeType, networkException);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiResultsFailureCopyWith<_$_ApiResultsFailure> get copyWith =>
      __$$_ApiResultsFailureCopyWithImpl<_$_ApiResultsFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        success,
    required TResult Function(String data, String url,
            Map<String, String> headers, int statusCode)
        error,
    required TResult Function(NetworkException networkException) failure,
  }) {
    return failure(networkException);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult? Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult? Function(NetworkException networkException)? failure,
  }) {
    return failure?.call(networkException);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        success,
    TResult Function(String data, String url, Map<String, String> headers,
            int statusCode)?
        error,
    TResult Function(NetworkException networkException)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(networkException);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ApiResultsSuccess value) success,
    required TResult Function(_ApiResultsError value) error,
    required TResult Function(_ApiResultsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ApiResultsSuccess value)? success,
    TResult? Function(_ApiResultsError value)? error,
    TResult? Function(_ApiResultsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ApiResultsSuccess value)? success,
    TResult Function(_ApiResultsError value)? error,
    TResult Function(_ApiResultsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _ApiResultsFailure implements ApiResults {
  const factory _ApiResultsFailure(
          {required final NetworkException networkException}) =
      _$_ApiResultsFailure;

  NetworkException get networkException;
  @JsonKey(ignore: true)
  _$$_ApiResultsFailureCopyWith<_$_ApiResultsFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
