import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

import 'credantial.dart';
import 'user.dart';

main() {
  INetworkManager networkManager;
  setUp(() {
    networkManager = NetworkManager(
        isEnableLogger: true,
        // onRefreshFail: () {  Navigate to login },
        onRefreshToken: (error, newService) async {
          // final refreshToken = await newService.fetch<Credantial, Credantial>("/token",
          //     parseModel: Credantial(), method: RequestType.GET);
          // error.request.headers = {HttpHeaders.authorizationHeader: "Bearer ${refreshToken.data.token}"};
          return error;
        },
        options: BaseOptions(baseUrl: "http://localhost:3000"));
  });

  test("Json Place Holder Todos", () async {
    final response = await networkManager.fetch<User, User>("/user", parseModel: User(), method: RequestType.GET);

    final response2 = await networkManager.fetch<User, User>("/user", parseModel: User(), method: RequestType.GET);

    expect(response.data, isNotNull);
  });
}
