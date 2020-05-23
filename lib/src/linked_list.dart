import 'package:equatable/equatable.dart';

class Node<T> {
  GenericLinkedList<T> list;
  T? _content;
  late Node<T> _previous;
  late Node<T> _next;
  final bool _isEnd;

  Node<T> get previous => _previous;

  Node<T> get next => _next;

  T get content {
    if (_isEnd) throw LinkedListException.endNoContent();
    return _content as T;
  }

  bool get isBegin => _previous == this;

  bool get isEnd => _next == this;

  bool get isFirst => !isBegin && _previous == list.begin;

  bool get isLast => !isEnd && _next == list.end;

  Node<T> insertBefore(T element) {
    if (isBegin) throw LinkedListException.cannotInsertBeforeBegin();
    final newNode = Node._(list, element, previous: _previous, next: this);
    _previous._next = newNode;
    _previous = newNode;
    list._length++;
    return newNode;
  }

  Node<T> insertAfter(T element) {
    if (isEnd) throw LinkedListException.cannotInsertAfterEnd();
    final newNode = Node._(list, element, previous: this, next: _next);
    _next._previous = newNode;
    _next = newNode;
    list._length++;
    return newNode;
  }

  Node<T> remove() {
    if (_isEnd) throw LinkedListException.cannotRemoveEnd();
    _next._previous = _previous;
    _previous._next = _next;
    list._length--;
    return next;
  }

  Node._(this.list, this._content, {Node<T>? previous, Node<T>? next}) : _isEnd = false {
    _previous = previous ?? this;
    _next = next ?? this;
  }

  Node._end(this.list) : _isEnd = true {
    _next = this;
  }

  Node._begin(this.list) : _isEnd = true {
    _previous = this;
  }
}

class GenericLinkedList<E> {
  int _length = 0;
  late Node<E> begin;
  late Node<E> end;

  Node<E> get first => begin.next;

  Node<E> get last => end.previous;

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  Iterable<E> get content sync* {
    for (var node = first; node != end; node = node.next) {
      yield node.content;
    }
  }

  void _initialize() {
    _length = 0;
    begin = Node._begin(this);
    end = Node._end(this);
    begin._next = end;
    end._previous = begin;
  }

  GenericLinkedList.empty() {
    _initialize();
  }

  GenericLinkedList.fromIterable(Iterable<E> contents) {
    _initialize();
    Node<E> previousNode = begin;
    for (final element in contents) {
      previousNode = previousNode.insertAfter(element);
    }
  }

  GenericLinkedList.from(GenericLinkedList<E> from) : this.fromIterable(from.content);

  GenericLinkedList<T> map<T>(T Function(E e) transform) => GenericLinkedList.fromIterable(content.map(transform));

  GenericLinkedList<E> where<T>(bool Function(E e) test) => GenericLinkedList.fromIterable(content.where(test));

  bool contains(E element) {
    for (var node = first; node != end; node = node.next) {
      if (node.content == element) return true;
    }
    return false;
  }

  E reduce(E Function(E value, E element) combine) {
    if (isEmpty) throw LinkedListException.noElement();
    var node = first;
    E value = node.content;
    for (; node != end; node = node.next) {
      value = combine(value, node.content);
    }
    return value;
  }

  T fold<T>(T initialValue, T Function(T value, E element) combine) {
    T value = initialValue;
    for (var node = first; node != end; node = node.next) {
      value = combine(value, node.content);
    }
    return value;
  }

  List<E> toList() => content.toList();

  Set<E> toSet() => content.toSet();

  bool any(bool Function(E) test) {
    for (var node = first; node != end; node = node.next) {
      if (test(node.content)) return true;
    }
    return false;
  }

  bool every(bool Function(E) test) {
    for (var node = first; node != end; node = node.next) {
      if (!test(node.content)) return false;
    }
    return true;
  }

  Node<E> firstWhere(bool Function(E) test, {bool orEnd = false}) {
    for (var node = first; node != end; node = node.next) {
      if (test(node.content)) return node;
    }
    if (orEnd) return end;
    throw LinkedListException.noElement();
  }

  Node<E> lastWhere(bool Function(E) test, {bool orBegin = false}) {
    for (var node = last; node != begin; node = node.previous) {
      if (test(node.content)) return node;
    }
    if (orBegin) return begin;
    throw LinkedListException.noElement();
  }
}

class LinkedListException extends Equatable {
  final String message;

  @override
  List<Object> get props => [message];

  LinkedListException(this.message);

  LinkedListException.noElement() : this('No element');

  LinkedListException.cannotRemoveEnd() : this('An end node cannot be removed');

  LinkedListException.endNoContent() : this('End node has no content');

  LinkedListException.cannotInsertBeforeBegin() : this('A node cannot be inserted before begin node');

  LinkedListException.cannotInsertAfterEnd() : this('A node cannot be inserted after end node');
}
