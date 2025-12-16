import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as io;

class PersistentConnection extends io.IOClient {
  @override
  Future<io.IOStreamedResponse> send(http.BaseRequest request) async {
    request.persistentConnection = false;
    return super.send(request);
  }
}
