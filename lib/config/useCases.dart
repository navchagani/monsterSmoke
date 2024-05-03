abstract class CaseFuture<Type, Params> {
  Future<Type> call({Params params});
}
