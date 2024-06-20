import 'dart:async';

class EmailValidator {
  Future<void> checkEmail({required String email}) async {
    final completer = Completer<void>();

    if (email.isEmpty) {
      completer.completeError('email esta vazio');
      return completer.future;
    }

    final matches = RegExp(
            r'^(([\w-]+\.)+[\w-]+|([a-zA-Z]|[\w-]{2,}))@((([0-1]?'
            r'[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.'
            r'([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
            r')|([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$')
        .allMatches(email);

    final isValid =
        matches.any((match) => match.start == 0 && match.end == email.length);

    if (!isValid) {
      completer.completeError('Formato do email nao bate');
    } else {
      completer.complete();
    }

    return completer.future;
  }
}
