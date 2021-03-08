# Network Handling with Dio and management with Riverpod

A new Application with network handle with future provider.


<div align="center">
    <img src="/snapshot/screenshot.png" width="250px"</img> 
</div>

## Getting Started

```
    flutter_riverpod: ^0.12.4.  //riverpod
    dio: ^3.0.10                // dio for network
    cached_network_image: ^2.5.0  // Network Image
  ```


### Fetch Flowers from API

```
    Future<List<Flower>> getFlowers() async {
    var dio = Dio();

    try {
      var response = await dio.get(ApiUrl.baseUrl + ApiUrl.flowers);
      return FlowerList.fromJson(response.data).flowerLists;
    } on DioError catch (e) {
      print(getDioException(e));
      throw Exception(getDioException(e));
    }
  }
 ```
 
 ### Future Provider
 
 ```
    final flowerProvider = FutureProvider.autoDispose<List<Flower>>((ref) {
  return ApiServices().getFlowers();
});
```

### Consumer

```
    Consumer(builder: (context, watch, _) {
        var a = watch(flowerProvider);
        return a.when(
            data: (d) => buildListViews(d),
            loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
            error: (e, st) => Text("error ${e}"));
      })
```

