import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/utils/constants/strings.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../utils/constants/constants.dart';
import '../../widgets/chat_assistant/message_widget.dart';

class ChatAssistantScreen extends StatefulWidget {
  const ChatAssistantScreen({super.key});
  @override
  State<ChatAssistantScreen> createState() => _ChatAssistantScreenState();
}

class _ChatAssistantScreenState extends State<ChatAssistantScreen> {
  late final GenerativeModel _model;
  late final ChatSession _chatSession;
  final FocusNode _textFieldFocus = FocusNode();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(model: 'gemini-pro', apiKey: geminiApiKey);
    _chatSession = _model.startChat();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _sendChatMessage(String message) async {
      setState(() {
        _loading = true;
      });

      try {
        final response = await _chatSession.sendMessage(Content.text(message));
        final text = response.text;
        if (text == null) {
          _showError('No response from API');
          return;
        } else {
          setState(() {
            _loading = false;
            _scrollDown();
          });
        }
      } catch (e) {
        _showError(e.toString());
        setState(() {
          _loading = false;
        });
      } finally {
        _textController.clear();
        setState(() {
          _loading = false;
        });
        _textFieldFocus.requestFocus();
      }
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: Constants.appBarGradient),
            ),
            title: const Text('Chat Assistant'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: _chatSession.history.length,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        final Content content =
                            _chatSession.history.toList()[index];
                        final text = content.parts
                            .whereType<TextPart>()
                            .map<String>((e) => e.text)
                            .join('');
                        return MessageWidget(
                            text: text, isFromUser: content.role == 'user');
                      })),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                        autofocus: true,
                        focusNode: _textFieldFocus,
                        decoration: textFieldDecoration(),
                        controller: _textController,
                        onSubmitted: _sendChatMessage),
                  )
                ]),
              )
            ],
          ),
        ));
  }

  InputDecoration textFieldDecoration() {
    return InputDecoration(
      hintText: 'Ask anything...',
      contentPadding: EdgeInsets.symmetric(horizontal: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      suffixIcon: const Icon(Icons.arrow_circle_right_rounded),
    );
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.easeOutCirc,
        duration: const Duration(milliseconds: 750),
      );
    });
  }

  void _showError(String message) {
    showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Something went wrong!'),
              content: SingleChildScrollView(child: SelectableText(message)),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                )
              ],
            ));
  }
}
