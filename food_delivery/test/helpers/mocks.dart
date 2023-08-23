import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseFirestoreDataProviderMock extends Mock
    implements FirebaseFirestoreDataProvider {}

class FirebaseAuthProviderMock extends Mock implements FirebaseAuthProvider {}

class HiveProviderMock extends Mock implements HiveProvider {}

class MockFetchAllDishesUseCase extends Mock implements FetchAllDishesUseCase {}

class MockUserModel extends Mock implements UserModel {}
