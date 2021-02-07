// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dictionary_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchTearOff {
  const _$SearchTearOff();

// ignore: unused_element
  _Search call({String term, List<SearchResult> results}) {
    return _Search(
      term: term,
      results: results,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Search = _$SearchTearOff();

/// @nodoc
mixin _$Search {
  String get term;
  List<SearchResult> get results;

  @JsonKey(ignore: true)
  $SearchCopyWith<Search> get copyWith;
}

/// @nodoc
abstract class $SearchCopyWith<$Res> {
  factory $SearchCopyWith(Search value, $Res Function(Search) then) =
      _$SearchCopyWithImpl<$Res>;
  $Res call({String term, List<SearchResult> results});
}

/// @nodoc
class _$SearchCopyWithImpl<$Res> implements $SearchCopyWith<$Res> {
  _$SearchCopyWithImpl(this._value, this._then);

  final Search _value;
  // ignore: unused_field
  final $Res Function(Search) _then;

  @override
  $Res call({
    Object term = freezed,
    Object results = freezed,
  }) {
    return _then(_value.copyWith(
      term: term == freezed ? _value.term : term as String,
      results:
          results == freezed ? _value.results : results as List<SearchResult>,
    ));
  }
}

/// @nodoc
abstract class _$SearchCopyWith<$Res> implements $SearchCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) then) =
      __$SearchCopyWithImpl<$Res>;
  @override
  $Res call({String term, List<SearchResult> results});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> extends _$SearchCopyWithImpl<$Res>
    implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(_Search _value, $Res Function(_Search) _then)
      : super(_value, (v) => _then(v as _Search));

  @override
  _Search get _value => super._value as _Search;

  @override
  $Res call({
    Object term = freezed,
    Object results = freezed,
  }) {
    return _then(_Search(
      term: term == freezed ? _value.term : term as String,
      results:
          results == freezed ? _value.results : results as List<SearchResult>,
    ));
  }
}

/// @nodoc
class _$_Search with DiagnosticableTreeMixin implements _Search {
  const _$_Search({this.term, this.results});

  @override
  final String term;
  @override
  final List<SearchResult> results;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Search(term: $term, results: $results)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Search'))
      ..add(DiagnosticsProperty('term', term))
      ..add(DiagnosticsProperty('results', results));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Search &&
            (identical(other.term, term) ||
                const DeepCollectionEquality().equals(other.term, term)) &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(term) ^
      const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);
}

abstract class _Search implements Search {
  const factory _Search({String term, List<SearchResult> results}) = _$_Search;

  @override
  String get term;
  @override
  List<SearchResult> get results;
  @override
  @JsonKey(ignore: true)
  _$SearchCopyWith<_Search> get copyWith;
}

/// @nodoc
class _$SearchResultTearOff {
  const _$SearchResultTearOff();

// ignore: unused_element
  _SearchResult call({String definition, List<String> examples}) {
    return _SearchResult(
      definition: definition,
      examples: examples,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchResult = _$SearchResultTearOff();

/// @nodoc
mixin _$SearchResult {
  String get definition;
  List<String> get examples;

  @JsonKey(ignore: true)
  $SearchResultCopyWith<SearchResult> get copyWith;
}

/// @nodoc
abstract class $SearchResultCopyWith<$Res> {
  factory $SearchResultCopyWith(
          SearchResult value, $Res Function(SearchResult) then) =
      _$SearchResultCopyWithImpl<$Res>;
  $Res call({String definition, List<String> examples});
}

/// @nodoc
class _$SearchResultCopyWithImpl<$Res> implements $SearchResultCopyWith<$Res> {
  _$SearchResultCopyWithImpl(this._value, this._then);

  final SearchResult _value;
  // ignore: unused_field
  final $Res Function(SearchResult) _then;

  @override
  $Res call({
    Object definition = freezed,
    Object examples = freezed,
  }) {
    return _then(_value.copyWith(
      definition:
          definition == freezed ? _value.definition : definition as String,
      examples:
          examples == freezed ? _value.examples : examples as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$SearchResultCopyWith<$Res>
    implements $SearchResultCopyWith<$Res> {
  factory _$SearchResultCopyWith(
          _SearchResult value, $Res Function(_SearchResult) then) =
      __$SearchResultCopyWithImpl<$Res>;
  @override
  $Res call({String definition, List<String> examples});
}

/// @nodoc
class __$SearchResultCopyWithImpl<$Res> extends _$SearchResultCopyWithImpl<$Res>
    implements _$SearchResultCopyWith<$Res> {
  __$SearchResultCopyWithImpl(
      _SearchResult _value, $Res Function(_SearchResult) _then)
      : super(_value, (v) => _then(v as _SearchResult));

  @override
  _SearchResult get _value => super._value as _SearchResult;

  @override
  $Res call({
    Object definition = freezed,
    Object examples = freezed,
  }) {
    return _then(_SearchResult(
      definition:
          definition == freezed ? _value.definition : definition as String,
      examples:
          examples == freezed ? _value.examples : examples as List<String>,
    ));
  }
}

/// @nodoc
class _$_SearchResult with DiagnosticableTreeMixin implements _SearchResult {
  const _$_SearchResult({this.definition, this.examples});

  @override
  final String definition;
  @override
  final List<String> examples;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchResult(definition: $definition, examples: $examples)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchResult'))
      ..add(DiagnosticsProperty('definition', definition))
      ..add(DiagnosticsProperty('examples', examples));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchResult &&
            (identical(other.definition, definition) ||
                const DeepCollectionEquality()
                    .equals(other.definition, definition)) &&
            (identical(other.examples, examples) ||
                const DeepCollectionEquality()
                    .equals(other.examples, examples)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(definition) ^
      const DeepCollectionEquality().hash(examples);

  @JsonKey(ignore: true)
  @override
  _$SearchResultCopyWith<_SearchResult> get copyWith =>
      __$SearchResultCopyWithImpl<_SearchResult>(this, _$identity);
}

abstract class _SearchResult implements SearchResult {
  const factory _SearchResult({String definition, List<String> examples}) =
      _$_SearchResult;

  @override
  String get definition;
  @override
  List<String> get examples;
  @override
  @JsonKey(ignore: true)
  _$SearchResultCopyWith<_SearchResult> get copyWith;
}
