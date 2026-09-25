import 'dart:io';

/// Gets the player's name.
String kuhaPlayerName(String player) {
  stdout.write("Enter $player: ");
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty) {
    return player;
  }

  return input.trim();
}

/// Checks if the move is valid.
String? e_validate_ang_Move(String e_validate) {
  List<String> lihok = ["rock", "paper", "scissors"];

  e_validate = e_validate.trim().toLowerCase();

  if (lihok.contains(e_validate)) {
    return e_validate;
  }

  return null;
}

/// Gets the player's move.
String getLihok(String player) {
  String? lihok;

  while (lihok == null) {
    stdout.write("$player: ");
    String? input = stdin.readLineSync();

    lihok = e_validate_ang_Move(input ?? "");

    if (lihok == null) {
      print("Invalid move.");
    }
  }

  return lihok;
}

/// Decides the winner.
String? pag_decide_sa_Winner(String lihok1, String lihok2) {
  if (lihok1 == lihok2) {
    return null;
  }

  if ((lihok1 == "rock" && lihok2 == "scissors") ||
      (lihok1 == "paper" && lihok2 == "rock") ||
      (lihok1 == "scissors" && lihok2 == "paper")) {
    return "Player 1";
  }

  return "Player 2";
}

void main() {
  print("=== ROCK PAPER SCISSORS ===");

  String player1 = kuhaPlayerName("Player 1");
  String player2 = kuhaPlayerName("Player 2");

  int score1 = 0;
  int score2 = 0;
  String again;

  do {
    print("\nNew Round");

    String lihok1 = getLihok(player1);

    // Hide Player 1's move
    for (int i = 0; i < 30; i++) {
      print("");
    }

    String lihok2 = getLihok(player2);

    print("$player1 chose $lihok1");
    print("$player2 chose $lihok2");

    String? ang_winner = pag_decide_sa_Winner(lihok1, lihok2);

    if (ang_winner == "Player 1") {
      score1++;
    } else if (ang_winner == "Player 2") {
      score2++;
    }

    print("Winner: ${ang_winner ?? "Draw"}");
    print("Score: $score1 - $score2");

    stdout.write("Play again? (y/n): ");
    String? input = stdin.readLineSync();

    again = input?.trim().toLowerCase() ?? "n";
  } while (again == "y");

  print("\nFinal Score");
  print("$player1: $score1");
  print("$player2: $score2");

  if (score1 > score2) {
    print("$player1 wins!");
  } else if (score2 > score1) {
    print("$player2 wins!");
  } else {
    print("It's a draw!");
  }
}
