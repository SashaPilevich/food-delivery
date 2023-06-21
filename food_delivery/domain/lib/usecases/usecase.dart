abstract class Usecase<Input, Output> {
  Future<Output> execute(Input input);
}

abstract class FutureUseCase<Input, Output> {
  Future<Output> execute(Input input);
}

class NoParams {
  const NoParams();
}
