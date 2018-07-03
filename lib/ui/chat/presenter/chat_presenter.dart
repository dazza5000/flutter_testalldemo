import 'package:lyc_clinic/injector.dart';
import 'package:lyc_clinic/ui/chat/contract/chat_contract.dart';
import 'package:lyc_clinic/ui/chat/repository/chat_repository.dart';

class ChatPresenter {
  ChatContract _view;
  ChatRepository _repository;

  ChatPresenter(this._view) {
    _repository = new Injector().chatRepository;
  }

  void getChatHistory(String accessCode) {
    _repository.getChatHistory(accessCode).then((c) {
      _view.showChatHistory(c.data);
      _view.setPagination(c.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void getMoreChatHistory(String accessCode, int page) {
    _repository.getMoreChatHistory(accessCode, page).then((c) {
      _view.showMoreChatHistroy(c.data);
      _view.setPagination(c.pagination);
    }).catchError((e) => print(e.toString()));
  }

  void sendMessage(String accessCode, String mesg, int articleId, int doctorId,
      int serviceId) {
    _repository
        .sendMessage(accessCode, mesg, articleId, doctorId, serviceId)
        .then((m) => _view.showNewMessage(m))
        .catchError((e) => print('Send Message Error ${e.toString()}'));
  }

  void sendImage(String accessCode, String filePath, int articleId,
      int doctorId, int serviceId) {
    _repository
        .sendImage(accessCode, filePath, articleId, doctorId, serviceId)
        .then((m) => _view.showNewMessage(m))
        .catchError((e) => print(e.toString()));
  }

  void sendChatSession(String accessCode, int chatSession) {
    _repository.sendChatSection(accessCode, chatSession);
  }

  void updateReadStatus(String accessCode, int messageId) {
    _repository.updateReadStatus(accessCode, messageId);
  }
}
