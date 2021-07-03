import 'api_manager.dart';

Future<dynamic> postCall() => ApiManager.instance.makeApiCall(
      callName: 'post',
      apiDomain: 'gkassam.in',
      apiEndpoint: 'wp-json/wp/v2/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnResponse: true,
    );
