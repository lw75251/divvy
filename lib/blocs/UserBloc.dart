import 'package:divvy/models/user.dart';
import 'package:divvy/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject<User>();

  Observable<User> get user => _userFetcher.stream;
  fetchUser(uid) async {
    User user = await _repository.fetchUser(uid);
    _userFetcher.sink.add(user);
  }

  dispose() {
    _userFetcher.close();
  }
}

final userBloc = UserBloc();