class SocketEvents {
  // Listeners (incoming events from server)
  static const String onlineSuccess = 'driver:online_success';
  static const String onlineFailed = 'driver:online_failed';
  static const String newRide = 'ride:newRide';
  static const String rideConfirmed = 'ride:confirmed';
  static const String rideStatus = 'ride:status';
  static const String orderCancelled = 'ride:orderCancelled';
  static const String rideLocation = 'ride:location';
  static const String rideReconnected = 'ride:reconnected';
  static const String ridePaymentPending = 'ride:paymentPending';

  // Emits (outgoing events from client)
  static const String goOnline = 'user:online';
  static const String goOffline = 'driver:offline';
  static const String acceptRide = 'ride:accept';
  static const String declineRide = 'ride:decline';
  static const String updateRideLocation = 'ride:location:update';
  static const String updateDriverLocation = 'driver:location:update';
  static const String joinRoom = 'join:room';

  // Chat Listeners
  static const String chatJoinSuccess = 'chat:join_success';
  static const String chatJoinError = 'chat:join_error';
  static const String chatReceiveMessage = 'chat:receiveMessage';
  static const String chatMessage = 'chat:message';
  static const String chatMessageSent = 'chat:message_sent';
  static const String chatTyping = 'chat:typing';
  static const String chatError = 'chat:error';

  // Chat Emits
  static const String chatJoin = 'chat:join';
  static const String chatSendMessage = 'chat:sendMessage';
  static const String sendChatMessageAlt = 'sendChatMessage';
  static const String chatTypingEmit = 'chat:typing';
  static const String chatGetHistory = 'chat:getHistory';
  static const String chatLeave = 'chat:leave';
}
