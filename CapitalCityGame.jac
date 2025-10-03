"""A Capital City Guessing Game with AI Hints"""

import random;
import from byllm.llm { Model }

# Pick the LLM model (Gemini or GPT-4o etc.)
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

"""Provide a fun hint if guess is incorrect"""
def give_hint(guess: str, correct_capital: str, country: str) -> str by llm();

walker CapitalGame {
    has guess: str = "";       # ✅ default prevents spawn error
    has attempts: int = 2;

    can start with `root entry;
    can process_guess with turn entry;
}

node turn {
    has country: str;
    has capital: str;
}

# Run when in CLI mode
with entry:__main__ {
    root spawn CapitalGame();   # ✅ now works
}

impl CapitalGame.start {
    countries = {
        "Kenya": "Nairobi",
        "Uganda": "Kampala",
        "Tanzania": "Dodoma",
        "Nigeria": "Abuja",
        "Ethiopia": "Addis Ababa",
        "Egypt": "Cairo",
        "South Africa": "Pretoria",
        "Ghana": "Accra",
        "Rwanda": "Kigali",
        "United States": "Washington"
    };

    # Randomly pick a country-capital pair
    pair = random.choice(list(countries.items()));
    next = root ++> turn(pair[0], pair[1]);

    print("Welcome to the AI-Powered Capital City Guessing Game!");
    print("Guess the capital city of " + pair[0] + ". You have " + str(self.attempts) + " attempts.");

    visit next;
}

impl CapitalGame.process_guess {
    guess = input("Your guess: ");

    if guess.lower() == here.capital.lower() {
        print("Correct! Well done.");
        disengage;
    } else {
        self.attempts -= 1;

        # 🤖 Ask AI for a hint
        hint = give_hint(guess, here.capital, here.country);
        print("Wrong answer. Hint: " + hint);

        if self.attempts > 0 {
            print("Attempts left: " + str(self.attempts));
            visit here;   # retry same country
        } else {
            print("Out of attempts! The capital of " + here.country + " is " + here.capital + ".");
            disengage;
        }
    }
}
















