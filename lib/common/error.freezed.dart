// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataSourceError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSourceErrorCopyWith<$Res> {
  factory $DataSourceErrorCopyWith(
          DataSourceError value, $Res Function(DataSourceError) then) =
      _$DataSourceErrorCopyWithImpl<$Res, DataSourceError>;
}

/// @nodoc
class _$DataSourceErrorCopyWithImpl<$Res, $Val extends DataSourceError>
    implements $DataSourceErrorCopyWith<$Res> {
  _$DataSourceErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotFoundCopyWith<$Res> {
  factory _$$NotFoundCopyWith(
          _$NotFound value, $Res Function(_$NotFound) then) =
      __$$NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundCopyWithImpl<$Res>
    extends _$DataSourceErrorCopyWithImpl<$Res, _$NotFound>
    implements _$$NotFoundCopyWith<$Res> {
  __$$NotFoundCopyWithImpl(_$NotFound _value, $Res Function(_$NotFound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotFound implements NotFound {
  const _$NotFound();

  @override
  String toString() {
    return 'DataSourceError.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements DataSourceError {
  const factory NotFound() = _$NotFound;
}

/// @nodoc
abstract class _$$InternalServerErrorCopyWith<$Res> {
  factory _$$InternalServerErrorCopyWith(_$InternalServerError value,
          $Res Function(_$InternalServerError) then) =
      __$$InternalServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InternalServerErrorCopyWithImpl<$Res>
    extends _$DataSourceErrorCopyWithImpl<$Res, _$InternalServerError>
    implements _$$InternalServerErrorCopyWith<$Res> {
  __$$InternalServerErrorCopyWithImpl(
      _$InternalServerError _value, $Res Function(_$InternalServerError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InternalServerError implements InternalServerError {
  const _$InternalServerError();

  @override
  String toString() {
    return 'DataSourceError.internalServerError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InternalServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) {
    return internalServerError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) {
    return internalServerError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return internalServerError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return internalServerError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (internalServerError != null) {
      return internalServerError(this);
    }
    return orElse();
  }
}

abstract class InternalServerError implements DataSourceError {
  const factory InternalServerError() = _$InternalServerError;
}

/// @nodoc
abstract class _$$UnauthorizedCopyWith<$Res> {
  factory _$$UnauthorizedCopyWith(
          _$Unauthorized value, $Res Function(_$Unauthorized) then) =
      __$$UnauthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedCopyWithImpl<$Res>
    extends _$DataSourceErrorCopyWithImpl<$Res, _$Unauthorized>
    implements _$$UnauthorizedCopyWith<$Res> {
  __$$UnauthorizedCopyWithImpl(
      _$Unauthorized _value, $Res Function(_$Unauthorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unauthorized implements Unauthorized {
  const _$Unauthorized();

  @override
  String toString() {
    return 'DataSourceError.unauthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unauthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements DataSourceError {
  const factory Unauthorized() = _$Unauthorized;
}

/// @nodoc
abstract class _$$BadRequestCopyWith<$Res> {
  factory _$$BadRequestCopyWith(
          _$BadRequest value, $Res Function(_$BadRequest) then) =
      __$$BadRequestCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadRequestCopyWithImpl<$Res>
    extends _$DataSourceErrorCopyWithImpl<$Res, _$BadRequest>
    implements _$$BadRequestCopyWith<$Res> {
  __$$BadRequestCopyWithImpl(
      _$BadRequest _value, $Res Function(_$BadRequest) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BadRequest implements BadRequest {
  const _$BadRequest();

  @override
  String toString() {
    return 'DataSourceError.badRequest()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BadRequest);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) {
    return badRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) {
    return badRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class BadRequest implements DataSourceError {
  const factory BadRequest() = _$BadRequest;
}

/// @nodoc
abstract class _$$TimeoutCopyWith<$Res> {
  factory _$$TimeoutCopyWith(_$Timeout value, $Res Function(_$Timeout) then) =
      __$$TimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimeoutCopyWithImpl<$Res>
    extends _$DataSourceErrorCopyWithImpl<$Res, _$Timeout>
    implements _$$TimeoutCopyWith<$Res> {
  __$$TimeoutCopyWithImpl(_$Timeout _value, $Res Function(_$Timeout) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Timeout implements Timeout {
  const _$Timeout();

  @override
  String toString() {
    return 'DataSourceError.timeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Timeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class Timeout implements DataSourceError {
  const factory Timeout() = _$Timeout;
}

/// @nodoc
abstract class _$$ForbiddenCopyWith<$Res> {
  factory _$$ForbiddenCopyWith(
          _$Forbidden value, $Res Function(_$Forbidden) then) =
      __$$ForbiddenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForbiddenCopyWithImpl<$Res>
    extends _$DataSourceErrorCopyWithImpl<$Res, _$Forbidden>
    implements _$$ForbiddenCopyWith<$Res> {
  __$$ForbiddenCopyWithImpl(
      _$Forbidden _value, $Res Function(_$Forbidden) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Forbidden implements Forbidden {
  const _$Forbidden();

  @override
  String toString() {
    return 'DataSourceError.forbidden()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Forbidden);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) {
    return forbidden();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) {
    return forbidden?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return forbidden(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return forbidden?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (forbidden != null) {
      return forbidden(this);
    }
    return orElse();
  }
}

abstract class Forbidden implements DataSourceError {
  const factory Forbidden() = _$Forbidden;
}

/// @nodoc
abstract class _$$UnknownCopyWith<$Res> {
  factory _$$UnknownCopyWith(_$Unknown value, $Res Function(_$Unknown) then) =
      __$$UnknownCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnknownCopyWithImpl<$Res>
    extends _$DataSourceErrorCopyWithImpl<$Res, _$Unknown>
    implements _$$UnknownCopyWith<$Res> {
  __$$UnknownCopyWithImpl(_$Unknown _value, $Res Function(_$Unknown) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unknown implements Unknown {
  const _$Unknown();

  @override
  String toString() {
    return 'DataSourceError.unknown()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unknown);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() internalServerError,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
    required TResult Function() timeout,
    required TResult Function() forbidden,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? internalServerError,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
    TResult? Function()? timeout,
    TResult? Function()? forbidden,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? internalServerError,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    TResult Function()? timeout,
    TResult Function()? forbidden,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotFound value) notFound,
    required TResult Function(InternalServerError value) internalServerError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(BadRequest value) badRequest,
    required TResult Function(Timeout value) timeout,
    required TResult Function(Forbidden value) forbidden,
    required TResult Function(Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotFound value)? notFound,
    TResult? Function(InternalServerError value)? internalServerError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(BadRequest value)? badRequest,
    TResult? Function(Timeout value)? timeout,
    TResult? Function(Forbidden value)? forbidden,
    TResult? Function(Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotFound value)? notFound,
    TResult Function(InternalServerError value)? internalServerError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(BadRequest value)? badRequest,
    TResult Function(Timeout value)? timeout,
    TResult Function(Forbidden value)? forbidden,
    TResult Function(Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown implements DataSourceError {
  const factory Unknown() = _$Unknown;
}
