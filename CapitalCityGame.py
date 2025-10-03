"""Capital City Guessing Game"""
import random

# Dictionary of countries and their capitals
countries = {
    "Kenya": "Nairobi",
    "Uganda": "Kampala",
    "Tanzania": "Dodoma",
    "Nigeria": "Abuja",
    "Ethiopia": "Addis Ababa",
    "Egypt": "Cairo",
    "South Africa": "Pretoria",  # Admin capital
    "Ghana": "Accra",
    "Rwanda": "Kigali",
    "United States": "Washington"
}

# Randomly select a country
country, capital = random.choice(list(countries.items()))

print("Welcome to the Capital City Guessing Game!")
print(f"Guess the capital city of {country}. You have 2 attempts.")

# Allow player 2 attempts
attempts = 2
for attempt in range(1, attempts + 1):
    guess = input(f"Attempt {attempt}: ").strip()

    if guess.lower() == capital.lower():
        print("🎉 Correct! Well done.")
        break
    else:
        if attempt < attempts:
            print("❌ Wrong answer. Try again.")
        else:
            print(f"❌ Out of attempts! The capital of {country} is {capital}.")