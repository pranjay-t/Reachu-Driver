import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_text_styles.dart';
import '../../../core/utils/app_logger.dart';
import '../../../core/utils/app_snackbar.dart';
import '../../../shared/widgets/app_cached_image.dart';
import '../models/ride_message_model.dart';
import '../providers/ride_chat_provider.dart';

class RideChatScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic>? rideData;

  const RideChatScreen({super.key, this.rideData});

  @override
  ConsumerState<RideChatScreen> createState() => _RideChatScreenState();
}

class _RideChatScreenState extends ConsumerState<RideChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late String _rideId;
  String _fallbackRiderName = 'Booker';
  String? _fallbackRiderPhone;

  @override
  void initState() {
    super.initState();
    _rideId = (widget.rideData?['orderId'] ??
            widget.rideData?['rideId'] ??
            widget.rideData?['_id'] ??
            '')
        .toString();

    _fallbackRiderName = widget.rideData?['riderName']?.toString() ??
        widget.rideData?['rider']?['name']?.toString() ??
        'Booker';

    _fallbackRiderPhone = widget.rideData?['riderNumber']?.toString() ??
        widget.rideData?['rider']?['phone']?.toString();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
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

    ref.read(rideChatProvider(_rideId).notifier).sendMessage(text);
    _messageController.clear();

    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
  }

  void _sendQuickReply(String text) {
    ref.read(rideChatProvider(_rideId).notifier).sendMessage(text);
    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
  }

  Future<void> _makePhoneCall(String? phoneNumber) async {
    final phone = phoneNumber ?? _fallbackRiderPhone;
    if (phone == null || phone.isEmpty) {
      AppSnackBar.show(
        context,
        message: 'Phone number not available',
        type: SnackBarType.warning,
      );
      return;
    }

    final uri = Uri.parse('tel:$phone');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        if (mounted) {
          AppSnackBar.show(
            context,
            message: 'Could not launch dialer',
            type: SnackBarType.error,
          );
        }
      }
    } catch (e) {
      AppLogger.e('Error launching dialer: $e');
    }
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
    final scaffoldBgColor = isDark
        ? AppColors.darkSurface01
        : AppColors.lightSurface01;
    final cardBgColor = isDark
        ? AppColors.darkSurface02
        : AppColors.lightSurface00;
    final dividerColor = isDark ? AppColors.neutral800 : AppColors.neutral200;

    final chatState = ref.watch(rideChatProvider(_rideId));

    // Listen for state updates to handle errors & list scrolling
    ref.listen<RideChatState>(rideChatProvider(_rideId), (prev, next) {
      if (prev?.messages.length != next.messages.length) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      }
      if (next.error != null) {
        AppSnackBar.show(
          context,
          message: next.error!,
          type: SnackBarType.error,
        );
        ref.read(rideChatProvider(_rideId).notifier).clearError();
      }
    });

    final quickReplies = [
      "I'm on my way",
      "I have arrived at your location",
      "Okay",
      "Please share the OTP",
      "I'm stuck in traffic",
    ];

    final String displayName = chatState.riderName ?? _fallbackRiderName;
    final String? displayPhone = chatState.riderPhone ?? _fallbackRiderPhone;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: cardBgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        leadingWidth: 40.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: primaryTextColor),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18.r,
              backgroundColor: isDark ? AppColors.neutral800 : AppColors.neutral200,
              child: chatState.riderImage != null && chatState.riderImage!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(18.r),
                      child: AppCachedImage(
                        imageUrl: chatState.riderImage!,
                        width: 36.r,
                        height: 36.r,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.person_rounded,
                      color: isDark ? AppColors.neutral400 : AppColors.neutral600,
                      size: 20.r,
                    ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: primaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Rider  •  Order #$_rideId',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: secondaryTextColor,
                      fontSize: 10.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_rounded, color: AppColors.primary500),
            onPressed: () => _makePhoneCall(displayPhone),
            tooltip: 'Call Customer',
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Messages Area
            Expanded(
              child: chatState.isLoading && chatState.messages.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary500,
                      ),
                    )
                  : chatState.messages.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat_bubble_outline_rounded,
                                size: 48.sp,
                                color: secondaryTextColor,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                'No messages yet.\nStart the conversation.',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: secondaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          controller: _scrollController,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          itemCount: chatState.messages.length,
                          itemBuilder: (context, index) {
                            final msg = chatState.messages[index];
                            return _buildMessageTile(
                              msg,
                              chatState.driverId,
                              isDark,
                              primaryTextColor,
                              secondaryTextColor,
                              cardBgColor,
                            );
                          },
                        ),
            ),

            // Divider
            Divider(height: 1.h, color: dividerColor),

            // Bottom controls
            Container(
              padding: EdgeInsets.only(bottom: 8.h, top: 8.h),
              color: cardBgColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Quick templates
                  SizedBox(
                    height: 38.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      itemCount: quickReplies.length,
                      itemBuilder: (context, index) {
                        final reply = quickReplies[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: GestureDetector(
                            onTap: () => _sendQuickReply(reply),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? AppColors.primary500.withValues(alpha: 0.1)
                                    : AppColors.primary50.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  color: isDark
                                      ? AppColors.primary400.withValues(alpha: 0.25)
                                      : AppColors.primary200.withValues(alpha: 0.5),
                                  width: 1,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                reply,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: isDark ? AppColors.primary300 : AppColors.primary600,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // Message Input Row
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.neutral900
                                  : AppColors.neutral50,
                              borderRadius: BorderRadius.circular(24.r),
                              border: Border.all(
                                color: isDark
                                    ? AppColors.neutral800
                                    : AppColors.neutral200,
                              ),
                            ),
                            child: TextField(
                              controller: _messageController,
                              minLines: 1,
                              maxLines: 5,
                              textCapitalization: TextCapitalization.sentences,
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: primaryTextColor,
                              ),
                              decoration: InputDecoration(
                                hintText: "Type message...",
                                hintStyle: AppTextStyles.bodyMedium.copyWith(
                                  color: secondaryTextColor,
                                ),
                                // Explicitly override the global inputDecorationTheme that causes double-textfield look
                                filled: false,
                                fillColor: Colors.transparent,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 10.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: _sendMessage,
                          child: Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: const BoxDecoration(
                              color: AppColors.primary500,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 18.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(
    RideMessage msg,
    String? driverId,
    bool isDark,
    Color primaryTextColor,
    Color secondaryTextColor,
    Color cardBgColor,
  ) {
    // Check if I am the sender
    final bool isMe = msg.userRole.toLowerCase() == 'driver' || 
                     (driverId != null && msg.senderId == driverId) ||
                     msg.senderId == 'self';

    final formattedTime = DateFormat('hh:mm a').format(msg.createdAt.toLocal());

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 0.72.sw),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
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
          SizedBox(height: 3.h),
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
                    msg.status == 'read'
                        ? Icons.done_all_rounded
                        : msg.status == 'delivered'
                            ? Icons.done_all_rounded
                            : msg.status == 'failed'
                                ? Icons.error_outline_rounded
                                : Icons.done_rounded,
                    size: 12.sp,
                    color: msg.status == 'failed'
                        ? AppColors.errorLight
                        : msg.status == 'read'
                            ? AppColors.successLight
                            : AppColors.neutral400,
                  ),
                ],
              ],
            ),
          ),
        ],
      ).animate().fade(duration: 150.ms),
    );
  }
}
