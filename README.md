# Coding Problems Repository

This project is designed to centralize coding problem solutions implemented in various programming languages. It serves as a personal reference for solving specific tasks across different languages, to learn, practice, and revisit programming concepts efficiently.

## Run a Solution

You can run a solution using the automation script. Specify the language and problem name:

```bash
./utils/scripts/run_solution.sh <problem-name> <language>
```

Example:

```bash
./utils/scripts/run_solution.sh two-sum python
```

**Supported languages include:**

- python
- java
- javascript
- go

## Run Tests

To validate a solution, use the provided test files. This requires the appropriate testing tools for each language (e.g., unittest for Python, go test for Go).

Example:

```bash
# Run Python tests

cd problems/two-sum/solution-python
python3 -m unittest discover tests

# Run Go tests

cd problems/two-sum/solution-go
go test

# Run Java tests

cd problems/two-sum/solution-java
mvn test
```

## Adding a New Problem

1. Create a new directory under problems/ with the problem's name:

```bash
mkdir -p problems/<problem-name>
```

2. Add subdirectories for each language:

```bash
mkdir -p problems/<problem-name>/solution-python
mkdir -p problems/<problem-name>/solution-go
```

3. Use the templates provided in utils/templates/ to structure your solutions:

```bash
cp utils/templates/python/* problems/<problem-name>/solution-python/
cp utils/templates/go/* problems/<problem-name>/solution-go/
```

4. Implement your solution in the appropriate main file and add tests.
