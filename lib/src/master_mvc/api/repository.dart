
import 'dart:core';
import 'package:http/http.dart';
import 'package:flutter_stan_setup/src/master_mvc/api/api_client.dart';

class Repository {
  final ApiClient postApiClient = ApiClient(
    httpClient: Client(),
  );

  Repository();




}
