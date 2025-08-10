import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  static final storage = const FlutterSecureStorage();

  static Future<GraphQLClient> getClient() async {
    final String? token = await storage.read(key: "accessToken");

    final HttpLink httpLink = HttpLink(
      'https://bcci-global-platform.onrender.com/graphql',
      defaultHeaders: {
        "x-client-platform": "mobile",
        if (token != null && token.isNotEmpty) "x-refresh-token": token,
      },
    );
    print("From GraphQL: $token");
    return GraphQLClient(cache: GraphQLCache(), link: httpLink);
  }
}
