class LoadMore {
  int index = 0;
  int get offset => index * limit;
  int limit;
  bool isAllLoaded = false;
  bool isFetching = true;

  LoadMore({this.limit = 50});

  void reset() {
    index = 0;
    isAllLoaded = false;
    isFetching = true;
  }
}