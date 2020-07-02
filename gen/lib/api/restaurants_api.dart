part of openapi.api;



class RestaurantsApi {
  final ApiClient apiClient;

  RestaurantsApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// Create dish served by restaurant with HTTP info returned
  ///
  /// 
  Future<Response> createDishWithHttpInfo(String restaurantId, CreateDishInput createDishInput) async {
    Object postBody = createDishInput;

    // verify required params are set
    if(restaurantId == null) {
     throw ApiException(400, "Missing required param: restaurantId");
    }
    if(createDishInput == null) {
     throw ApiException(400, "Missing required param: createDishInput");
    }

    // create path and map variables
    String path = "/api/restaurants/{restaurantId}/dishes".replaceAll("{format}","json").replaceAll("{" + "restaurantId" + "}", restaurantId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Create dish served by restaurant
  ///
  /// 
  Future<DishDTO> createDish(String restaurantId, CreateDishInput createDishInput) async {
    Response response = await createDishWithHttpInfo(restaurantId, createDishInput);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'DishDTO') as DishDTO;
    } else {
      return null;
    }
  }

  /// Create new restaurant with HTTP info returned
  ///
  /// 
  Future<Response> createRestaurantWithHttpInfo(CreateRestaurantInput createRestaurantInput) async {
    Object postBody = createRestaurantInput;

    // verify required params are set
    if(createRestaurantInput == null) {
     throw ApiException(400, "Missing required param: createRestaurantInput");
    }

    // create path and map variables
    String path = "/api/restaurants".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Create new restaurant
  ///
  /// 
  Future<Restaurant> createRestaurant(CreateRestaurantInput createRestaurantInput) async {
    Response response = await createRestaurantWithHttpInfo(createRestaurantInput);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Restaurant') as Restaurant;
    } else {
      return null;
    }
  }

  ///  with HTTP info returned
  ///
  /// 
  Future<Response> finishPreparingOrderWithHttpInfo(String restaurantId, String orderId, { OrderStatus status }) async {
    Object postBody;

    // verify required params are set
    if(restaurantId == null) {
     throw ApiException(400, "Missing required param: restaurantId");
    }
    if(orderId == null) {
     throw ApiException(400, "Missing required param: orderId");
    }

    // create path and map variables
    String path = "/api/restaurants/{restaurantId}/orders/{orderId}/finishPreparing".replaceAll("{format}","json").replaceAll("{" + "restaurantId" + "}", restaurantId.toString()).replaceAll("{" + "orderId" + "}", orderId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(status != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "status", status));
    }

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// 
  ///
  /// 
  Future<Order> finishPreparingOrder(String restaurantId, String orderId, { OrderStatus status }) async {
    Response response = await finishPreparingOrderWithHttpInfo(restaurantId, orderId,  status: status );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Order') as Order;
    } else {
      return null;
    }
  }

  ///  with HTTP info returned
  ///
  /// 
  Future<Response> orders1WithHttpInfo(String restaurantId, { OrderStatus status }) async {
    Object postBody;

    // verify required params are set
    if(restaurantId == null) {
     throw ApiException(400, "Missing required param: restaurantId");
    }

    // create path and map variables
    String path = "/api/restaurants/{restaurantId}/orders".replaceAll("{format}","json").replaceAll("{" + "restaurantId" + "}", restaurantId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(status != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "status", status));
    }

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// 
  ///
  /// 
  Future<List<Order>> orders1(String restaurantId, { OrderStatus status }) async {
    Response response = await orders1WithHttpInfo(restaurantId,  status: status );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Order>') as List).map((item) => item as Order).toList();
    } else {
      return null;
    }
  }

  ///  with HTTP info returned
  ///
  /// 
  Future<Response> ownRestaurantWithHttpInfo() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/restaurants/me".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// 
  ///
  /// 
  Future<Restaurant> ownRestaurant() async {
    Response response = await ownRestaurantWithHttpInfo();
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Restaurant') as Restaurant;
    } else {
      return null;
    }
  }

  /// Get restaurant info with HTTP info returned
  ///
  /// 
  Future<Response> restaurantWithHttpInfo(String restaurantId) async {
    Object postBody;

    // verify required params are set
    if(restaurantId == null) {
     throw ApiException(400, "Missing required param: restaurantId");
    }

    // create path and map variables
    String path = "/api/restaurants/{restaurantId}".replaceAll("{format}","json").replaceAll("{" + "restaurantId" + "}", restaurantId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Get restaurant info
  ///
  /// 
  Future<Restaurant> restaurant(String restaurantId) async {
    Response response = await restaurantWithHttpInfo(restaurantId);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Restaurant') as Restaurant;
    } else {
      return null;
    }
  }

  /// Get restaurant dishes with HTTP info returned
  ///
  /// 
  Future<Response> restaurantDishesWithHttpInfo(String restaurantId) async {
    Object postBody;

    // verify required params are set
    if(restaurantId == null) {
     throw ApiException(400, "Missing required param: restaurantId");
    }

    // create path and map variables
    String path = "/api/restaurants/{restaurantId}/dishes".replaceAll("{format}","json").replaceAll("{" + "restaurantId" + "}", restaurantId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Get restaurant dishes
  ///
  /// 
  Future<List<DishDTO>> restaurantDishes(String restaurantId) async {
    Response response = await restaurantDishesWithHttpInfo(restaurantId);
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<DishDTO>') as List).map((item) => item as DishDTO).toList();
    } else {
      return null;
    }
  }

  /// Get list of restaurants with HTTP info returned
  ///
  /// 
  Future<Response> restaurantsWithHttpInfo() async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/api/restaurants".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// Get list of restaurants
  ///
  /// 
  Future<List<Restaurant>> restaurants() async {
    Response response = await restaurantsWithHttpInfo();
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return (apiClient.deserialize(_decodeBodyBytes(response), 'List<Restaurant>') as List).map((item) => item as Restaurant).toList();
    } else {
      return null;
    }
  }

  ///  with HTTP info returned
  ///
  /// 
  Future<Response> startPreparingOrderWithHttpInfo(String restaurantId, String orderId, { OrderStatus status }) async {
    Object postBody;

    // verify required params are set
    if(restaurantId == null) {
     throw ApiException(400, "Missing required param: restaurantId");
    }
    if(orderId == null) {
     throw ApiException(400, "Missing required param: orderId");
    }

    // create path and map variables
    String path = "/api/restaurants/{restaurantId}/orders/{orderId}/startPreparing".replaceAll("{format}","json").replaceAll("{" + "restaurantId" + "}", restaurantId.toString()).replaceAll("{" + "orderId" + "}", orderId.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(status != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "status", status));
    }

    List<String> contentTypes = [];

    String nullableContentType = contentTypes.isNotEmpty ? contentTypes[0] : null;
    List<String> authNames = [];

    if(nullableContentType != null && nullableContentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'POST',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             nullableContentType,
                                             authNames);
    return response;
  }

  /// 
  ///
  /// 
  Future<Order> startPreparingOrder(String restaurantId, String orderId, { OrderStatus status }) async {
    Response response = await startPreparingOrderWithHttpInfo(restaurantId, orderId,  status: status );
    if(response.statusCode >= 400) {
      throw ApiException(response.statusCode, _decodeBodyBytes(response));
    } else if(response.body != null) {
      return apiClient.deserialize(_decodeBodyBytes(response), 'Order') as Order;
    } else {
      return null;
    }
  }

}
