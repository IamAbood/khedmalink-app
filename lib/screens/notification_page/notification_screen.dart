import 'package:flutter/material.dart';
import 'package:khedma_link/constants/helper_class/device_utils_class.dart';
import 'package:khedma_link/screens/notification_page/messages.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<int> _messageIds = List.generate(4, (index) => index + 1);

  void _deleteMessage(int id) {
    setState(() {
      _messageIds.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
            style: Theme.of(context).textTheme.headlineSmall),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) =>
                const SizedBox(height: TSizes.spaceBtwSections),
            itemCount: _messageIds.length,
            itemBuilder: (_, index) => Messages(
              id: _messageIds[index],
              onDelete: () => _deleteMessage(_messageIds[index]),
            ),
          ),
        ),
      ),
    );
  }
}
