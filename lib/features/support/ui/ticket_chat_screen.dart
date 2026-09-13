import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/utils/app_snackbar.dart';
import '../models/support_message_model.dart';
import '../models/ticket_model.dart';
import '../providers/support_controller.dart';
import '../repositories/support_repository.dart';
import '../../../core/network/result.dart';

class TicketChatScreen extends ConsumerStatefulWidget {
  final String ticketId;

  const TicketChatScreen({super.key, required this.ticketId});

  @override
  ConsumerState<TicketChatScreen> createState() => _TicketChatScreenState();
}

class _TicketChatScreenState extends ConsumerState<TicketChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  Timer? _typingDebounce;
  bool _hasPromptedRating = false;

  @override
  void initState() {
    super.initState();
    _messageController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _messageController.removeListener(_onTextChanged);
    _messageController.dispose();
    _scrollController.dispose();
    _typingDebounce?.cancel();
    super.dispose();
  }

  void _onTextChanged() {
    final notifier = ref.read(supportChatProvider(widget.ticketId).notifier);
    if (_messageController.text.isNotEmpty) {
      notifier.setTyping(true);
      _typingDebounce?.cancel();
      _typingDebounce = Timer(const Duration(seconds: 2), () {
        notifier.setTyping(false);
      });
    } else {
      notifier.setTyping(false);
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    ref.read(supportChatProvider(widget.ticketId).notifier).sendMessage(text);
    _messageController.clear();
    FocusScope.of(context).unfocus();

    // Scroll down after sending
    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
  }

  void _showRatingDialog(SupportTicket ticket) {
    if (_hasPromptedRating) return;
    _hasPromptedRating = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _TicketRatingDialog(
          ticketId: widget.ticketId,
          ticketNumber: ticket.ticketNumber,
          onSubmit: (rating, comment) async {
            final repository = ref.read(supportRepositoryProvider);
            final result = await repository.rateTicket(
              ticketId: widget.ticketId,
              rating: rating,
              comment: comment,
            );

            switch (result) {
              case Success(:final data):
                if (data) {
                  AppSnackbar.showSuccess(
                    message: "Thank you for your feedback!",
                  );
                }
              case Failure():
                break;
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final secondaryTextColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final dividerColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    final chatState = ref.watch(supportChatProvider(widget.ticketId));
    final chatNotifier = ref.read(
      supportChatProvider(widget.ticketId).notifier,
    );

    // Find ticket info from SupportTickets list
    final ticketsList = ref.watch(supportTicketsProvider).value ?? [];
    final ticket = ticketsList.firstWhere(
      (t) => t.id == widget.ticketId,
      orElse: () => SupportTicket(
        id: widget.ticketId,
        ticketNumber: 'Loading...',
        userId: '',
        category: '',
        subject: '',
        status: 'open',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    // Scroll to bottom on new message
    ref.listen(supportChatProvider(widget.ticketId), (prev, next) {
      if (next.hasValue) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      }
    });

    // Handle Rating Dialog if resolved
    final String rawStatus = ticket.status
        .toLowerCase()
        .replaceAll('-', '')
        .replaceAll('_', '')
        .replaceAll(' ', '');
    final bool isOpen = rawStatus == 'open';
    final bool isInProgress = rawStatus == 'inprogress';
    final bool isResolved = rawStatus == 'resolved';
    final bool isClosed = rawStatus == 'closed';

    if (isResolved) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showRatingDialog(ticket);
      });
    }

    final bool isClosedOrResolved = isResolved || isClosed;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkSurface01
          : AppColors.lightSurface01,
      appBar: AppBar(
        backgroundColor: cardBgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ticket.ticketNumber,
              style: AppTextStyles.bodyMedium.copyWith(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              ticket.subject,
              style: AppTextStyles.bodySmall.copyWith(
                color: secondaryTextColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isOpen
                      ? AppColors.primary500.withValues(alpha: 0.08)
                      : isInProgress
                      ? AppColors.warningLight.withValues(alpha: 0.08)
                      : isResolved
                      ? AppColors.successLight.withValues(alpha: 0.08)
                      : AppColors.neutral500.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color:
                        (isOpen
                                ? AppColors.primary500
                                : isInProgress
                                ? AppColors.warningDark
                                : isResolved
                                ? AppColors.successDark
                                : AppColors.neutral500)
                            .withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        color: isOpen
                            ? AppColors.primary500
                            : isInProgress
                            ? AppColors.warningDark
                            : isResolved
                            ? AppColors.successDark
                            : AppColors.neutral500,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      ticket.status.toUpperCase(),
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: isOpen
                            ? AppColors.primary500
                            : isInProgress
                            ? AppColors.warningDark
                            : isResolved
                            ? AppColors.successDark
                            : AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: chatState.when(
                data: (messages) {
                  if (messages.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 64.sp,
                            color: secondaryTextColor.withValues(alpha: 0.3),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            "No messages yet",
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: primaryTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Type your first message below.",
                            style: AppTextStyles.bodySmall.copyWith(
                              color: secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.all(16.w),
                    itemCount:
                        messages.length + (chatNotifier.isAgentTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length) {
                        // Render typing indicator
                        return _buildTypingIndicator(
                          cardBgColor,
                          secondaryTextColor,
                          isDark,
                        );
                      }

                      final msg = messages[index];
                      return _buildMessageTile(
                        msg,
                        isDark,
                        primaryTextColor,
                        secondaryTextColor,
                        cardBgColor,
                      );
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: AppColors.primary500),
                ),
                error: (err, stack) => Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          size: 48.sp,
                          color: AppColors.errorLight,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Failed to load messages",
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          err.toString(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // ── Message Input Bar ──
            if (!isClosedOrResolved)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: cardBgColor,
                  border: Border(top: BorderSide(color: dividerColor)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurface01
                              : AppColors.lightSurface01,
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: dividerColor),
                        ),
                        child: TextField(
                          controller: _messageController,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: primaryTextColor,
                          ),
                          minLines: 1,
                          maxLines: 5,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: "Type your message...",
                            hintStyle: AppTextStyles.bodyMedium.copyWith(
                              color: secondaryTextColor,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    GestureDetector(
                      onTap: _sendMessage,
                      child: Container(
                        height: 44.h,
                        width: 44.h,
                        decoration: const BoxDecoration(
                          color: AppColors.primary500,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                          size: 20.w,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                color: isDark
                    ? AppColors.darkSurface02
                    : AppColors.lightSurface02,
                child: Text(
                  isResolved
                      ? "This ticket has been marked as resolved."
                      : "This ticket has been closed and cannot accept new replies.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: secondaryTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(
    SupportMessage msg,
    bool isDark,
    Color primaryTextColor,
    Color secondaryTextColor,
    Color cardBgColor,
  ) {
    final bool isSystem =
        msg.isSystem ||
        msg.messageType == 'system' ||
        msg.senderType == 'system';
    if (isSystem) {
      final systemBgColor = isDark
          ? AppColors.infoSurface.withValues(alpha: 0.2)
          : AppColors.infoLight.withValues(alpha: 0.15);
      final systemTextColor = isDark ? AppColors.infoLight : AppColors.infoDark;
      final systemBorderColor = isDark
          ? AppColors.infoLight.withValues(alpha: 0.2)
          : AppColors.infoLight.withValues(alpha: 0.5);

      return Container(
        margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: systemBgColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: systemBorderColor, width: 0.8),
          ),
          child: Text(
            msg.message,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmall.copyWith(
              color: systemTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ).animate().fade(duration: 200.ms);
    }

    final bool isMe = msg.senderType == 'user';
    final formattedTime = DateFormat('hh:mm a').format(msg.createdAt.toLocal());

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isMe
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 0.7.sw),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: isMe ? AppColors.primary500 : cardBgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                    bottomLeft: isMe ? Radius.circular(16.r) : Radius.zero,
                    bottomRight: isMe ? Radius.zero : Radius.circular(16.r),
                  ),
                  border: isMe
                      ? null
                      : Border.all(
                          color: isDark
                              ? AppColors.neutral800
                              : AppColors.neutral200,
                        ),
                ),
                child: Text(
                  msg.message,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: isMe ? Colors.white : primaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  formattedTime,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: secondaryTextColor,
                    fontSize: 9.sp,
                  ),
                ),
                if (isMe) ...[
                  SizedBox(width: 4.w),
                  Icon(
                    msg.status == 'sent'
                        ? Icons.done_rounded
                        : msg.status == 'failed'
                        ? Icons.error_outline_rounded
                        : Icons.done_all_rounded,
                    size: 11.sp,
                    color: msg.status == 'failed'
                        ? AppColors.errorLight
                        : AppColors.primary500,
                  ),
                ],
              ],
            ),
          ),
        ],
      ).animate().fade(duration: 150.ms),
    );
  }

  Widget _buildTypingIndicator(
    Color cardBgColor,
    Color secondaryTextColor,
    bool isDark,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: cardBgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
              border: Border.all(
                color: isDark ? AppColors.neutral800 : AppColors.neutral200,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Agent is typing",
                  style: AppTextStyles.bodySmall.copyWith(
                    color: secondaryTextColor,
                  ),
                ),
                SizedBox(width: 6.w),
                SizedBox(
                  width: 12.w,
                  height: 12.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      secondaryTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TicketRatingDialog extends StatefulWidget {
  final String ticketId;
  final String ticketNumber;
  final Function(double rating, String comment) onSubmit;

  const _TicketRatingDialog({
    required this.ticketId,
    required this.ticketNumber,
    required this.onSubmit,
  });

  @override
  State<_TicketRatingDialog> createState() => _TicketRatingDialogState();
}

class _TicketRatingDialogState extends State<_TicketRatingDialog> {
  double _rating = 5.0;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final secondaryTextColor = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final dividerColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      backgroundColor: cardBgColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.successLight.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  color: AppColors.successDark,
                  size: 36.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Ticket Resolved",
                style: AppTextStyles.titleMedium.copyWith(
                  color: primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                "Your ticket ${widget.ticketNumber} has been marked as resolved. How would you rate Reachusupport?",
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: secondaryTextColor,
                ),
              ),
              SizedBox(height: 20.h),

              // Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  final starVal = index + 1.0;
                  final bool isSelected = _rating >= starVal;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _rating = starVal;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Icon(
                        isSelected
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: Colors.amber,
                        size: 36.sp,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16.h),

              // Comment field
              Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSurface01
                      : AppColors.lightSurface01,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: dividerColor),
                ),
                child: TextField(
                  controller: _commentController,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: primaryTextColor,
                  ),
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Add a comment (Optional)...",
                    hintStyle: AppTextStyles.bodyMedium.copyWith(
                      color: secondaryTextColor,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(12.w),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // Submit buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: dividerColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        "Skip",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: secondaryTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onSubmit(
                          _rating,
                          _commentController.text.trim(),
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary500,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        elevation: 0,
                      ),
                      child: Text(
                        "Submit",
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
