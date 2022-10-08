import 'dart:math';

List<List<dynamic>> randLists() {
  List<double> numList = [];
  List<String> expList = [];
  List<String> expressions = ["+", "-", "x", "/"];
  Random rng = Random();

  for (int i = 0; i < 4; i++) {
    numList.add(rng.nextInt(9) + 1);
  }

  for (int i = 0; i < 3; i++) {
    expList.add(expressions[rng.nextInt(3)]);
  }

  for (int i = 0; i < numList.length - 1; i++) {
    if (numList[i] % numList[i + 1] == 0 && rng.nextInt(2) == 1) {
      expList[i] = "/";
    }
  }

  return [numList, expList];
}

double calculate(List<dynamic> orgNums, List<dynamic> orgExps) {
  double total = 0;
  int c = 0;
  List<dynamic> nums = List.from(orgNums);
  List<dynamic> exps = List.from(orgExps);

  while (exps.isNotEmpty) {
    if (exps[c] == "") {
      break;
    }

    if (exps[c] == "x" || exps[c] == "/") {
      if (exps[c] == "x") {
        total = nums[c] * nums[c + 1];
      } else {
        total = nums[c] / nums[c + 1];
      }

      nums.removeAt(c);
      nums.removeAt(c);
      nums.insert(c, total);
      exps.removeAt(c);
      c = 0;
    } else if (!exps.contains("x") && !exps.contains("/")) {
      if (exps[c] == "+") {
        total = nums[c] + nums[c + 1];
      } else {
        total = nums[c] - nums[c + 1];
      }

      nums.removeAt(c);
      nums.removeAt(c);
      nums.insert(c, total);
      exps.removeAt(c);
      c = 0;
    } else {
      if (c < exps.length - 1) {
        c += 1;
      } else {
        c = 0;
      }
    }
  }
  nums.clear();
  exps.clear();

  print(orgNums);
  print(orgExps);
  print(total);
  return total;
}
