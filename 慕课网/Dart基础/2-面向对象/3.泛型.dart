import '1.面向对象.dart';

class TestGeneric {
  void start() {
    Cache<String> cache = Cache();
    cache.setItem('cache1', 'cache1');
    String str = cache.getItem('cache1');
    print(str);

    Member member = Member(Student('清华', "xiaohong", 18));
    print(member.fixedName());
  }
}

//泛型
//泛型主要是解决类、接口、方法的复用性、以及对不特定数据类型的支持。
class Cache<T> {
  static final Map<String, Object> _cached = Map();

  void setItem(String key, T value) {
    _cached[key] = value as Object;
  }

  ///泛型方法
  T getItem(String key) {
    return _cached[key] as T;
  }
}

//有时候你在实现类似通用接口的泛型中，期望的类型是某些特定类型时，这时可以使用类型约束
class Member<T extends Person> {
  T _person;

  Member(this._person);

  String fixedName() {
    return 'fixed:${_person.name}';
  }
}
