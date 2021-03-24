part of 'services.dart';

class MessageServices {
  static CollectionReference _messagesCollection =
      FirebaseFirestore.instance.collection("messages");

  static Stream<QuerySnapshot> getMessageByGroupChatId({String groupChatId}) {
    int _limit = 20;

    return _messagesCollection
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy('timestamp', descending: true)
        .limit(_limit)
        .snapshots();
  }

  static Stream<QuerySnapshot> getMessageListByUserId({String groupChatId}) {
    int _limit = 20;

    return _messagesCollection.snapshots(includeMetadataChanges: true);
  }
}
