# Number Guessing Game

This project consists of developing a number guessing game using Bash and PostgreSQL to store player history. The goal is to provide an interactive experience where users try to guess a randomly generated secret number between 1 and 1000.

## Game Functionality

1. **User Login**
   - When executing the script, a username is requested.
   - If the user has played before, their game history is displayed, including the number of games played and their best performance.
   - If the user is new, they are welcomed and registered in the database.

2. **Game Logic**
   - A random secret number between 1 and 1000 is generated.
   - The user must enter numbers until they guess the secret number.
   - After each attempt, feedback is provided indicating whether the entered number is higher or lower than the secret number.
   - If the user enters a non-numeric value, an error message is displayed, and they are asked to try again.
   - When the user guesses correctly, the number of attempts made is displayed, and the result is stored in the database.

## Database

The game uses PostgreSQL to store player data. Two tables are implemented: one stores the username, and the other stores the secret number to be guessed, the number of attempts taken to guess it, and the foreign key to the users table.

## Versioning and Change Control

- Git was used for version control, ensuring a clean and structured history with at least five significant commits.
- Commits follow a descriptive format with tags such as `feat:`, `fix:`, `refactor:`, etc.

## Project Execution

1. Clone the repository:
   ```bash
   git clone <REPOSITORY_URL>
   cd number_guessing_game
   ```
2. Grant execution permissions to the script:
   ```bash
   chmod +x number_guess.sh
   ```
3. Run the game:
   ```bash
   ./number_guess.sh
   ```

## Database Backup and Restoration

To back up the database:

```bash
pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql
```

To restore it:

```bash
psql -U postgres < number_guess.sql
```

## Learnings and Applications

This project strengthens skills in:

- **Bash scripting**, handling user input and output.
- **PostgreSQL**, SQL queries, and persistent data storage.
- **Version control with Git**, best practices for commits and repository organization.

This game is an excellent starting point for projects that combine **terminal interactivity and data persistence**, with possibilities for expansion such as a graphical interface or integration with other languages.

*A project completed as part of the freeCodeCamp.org Relational Database Certification.*
