import 'package:lab4_code/lab4_code.dart' as lab4_code;

void main(List<String> arguments) {
  List<String> strs = ['flower', 'flow', 'flight'];
  int smalllength = strs[0].length;
  String compareStr = strs[0];
  var result;

  for (var element in strs) {
    if (element.length < smalllength) {
      smalllength = element.length;
    } else {
      smalllength = smalllength;
    }
  }

  for (int k = 0; k < strs.length; k++) {
    for (int i = 0; i <= smalllength; i++) {
      if (compareStr.substring(0, i) == strs[k].substring(0, i)) {
        result = strs[k].substring(0, i);
      } else {
        break;
      }
    }
  }

  if (result != '') {
    print(' $result');
  } else {
    print('\"\"');
    print('there is no common prefix among the input strings.');
  }
}
