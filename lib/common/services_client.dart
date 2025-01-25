import 'dart:io';

import 'package:ditonton/common/utils.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/io_client.dart';

class ServicesClient {
  static ServicesClient? _servicesClient;
  ServicesClient._instance() {
    _servicesClient = this;
  }

  factory ServicesClient() => _servicesClient ?? ServicesClient._instance();

  Future<SecurityContext> get _globalContext async {
    final sslCert = await rootBundle.load('certificates/certificates.pem');
    SecurityContext securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
    return securityContext;
  }

  Future<Response> get({
    required Uri url,
    Map<String, String>? headers,
  }) async {
    try {
      HttpClient client = HttpClient(context: await _globalContext);
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => false;
      IOClient ioClient = IOClient(client);

      return ioClient.get(url, headers: headers);
    } catch (e) {
      LogUtility.writeLog("error : ${e}");
      rethrow;
    }
  }
}
