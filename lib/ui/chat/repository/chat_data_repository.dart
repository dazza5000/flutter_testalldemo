import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lyc_clinic/utils/configs.dart';
import 'package:lyc_clinic/ui/chat/repository/chat_repository.dart';
import 'package:lyc_clinic/ui/chat/data/chat.dart';
import 'package:lyc_clinic/ui/chat/data/message.dart';

class ChatDataRepository implements ChatRepository {
  String URL = Configs.LYC_URL + Configs.VERSION_NO + "/";
  JsonDecoder _decoder = new JsonDecoder();

  @override
  Future<Chat> getChatHistory(String accessCode) async {
    http.Response response = await http.get(URL + accessCode + '/chat/list?');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);

    var chat = new Chat.fromJson(jsonBody);
    return chat;
  }

  @override
  void updateReadStatus(String accessCode, int messageId) async {
    http.Response response = await http
        .post(URL + accessCode + '/chat/' + messageId.toString() + '/read');
    final responseBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return;
    }

    print('Response is' + response.body);
  }

  @override
  void sendChatSection(String accessCode, int chatSession) async {
    http.Response response =
        await http.post(URL + accessCode + '/chat/section');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
      return;
    }
  }

  @override
  Future<Message> sendImage(String accessCode, String filePath, int articleId,
      int doctorId, int serviceId) async {
    http.Response response =
        await http.post(URL + accessCode + '/chat/send', body: {});
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final jsonBody = _decoder.convert(responseBody);

    var message = new Message.fromJson(jsonBody);

    return message;
  }

  @override
  Future<Message> sendMessage(String accessCode, String mesg, int articleId,
      int doctorId, int serviceId) async {
    print('Article $articleId Doctor $doctorId Service $serviceId');
    http.Response response = await http.post(URL + accessCode + '/chat/send',
        body: {
          "mesg": mesg,
          //"article": articleId,
          //"doctor": doctorId,
          //"service": serviceId
        });
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }
    final jsonBody = _decoder.convert(responseBody);

    var message = new Message.fromJson(jsonBody);
    print('Send Message $message');
    return message;
  }

  @override
  Future<Chat> getMoreChatHistory(String accessCode, int page) async {
    http.Response response = await http.get(URL + accessCode + '/chat/list?');
    final responseBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || responseBody == null) {
      //throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.error}]");
      print(statusCode);
    }

    final jsonBody = _decoder.convert(responseBody);

    var chat = new Chat.fromJson(jsonBody);
    return chat;
  }
}
