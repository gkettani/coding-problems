#!/usr/bin/env bash
# Run solution in a specific language

PROBLEM=$1
LANG=$2

if [ -z "$LANG" ] || [ -z "$PROBLEM" ]; then
  echo "Usage: $0 <problem> <language>"
  exit 1
fi

if [ ! -d "problems/$PROBLEM" ]; then
  echo "Problem directory 'problems/$PROBLEM' does not exist."
  exit 1
fi

case $LANG in
  python)
    if [ -f "problems/$PROBLEM/solution-python/main.py" ]; then
      python3 problems/$PROBLEM/solution-python/main.py
    else
      echo "Python solution file not found."
      exit 1
    fi
    ;;
  java)
    if [ -d "problems/$PROBLEM/solution-java" ]; then
      pushd problems/$PROBLEM/solution-java > /dev/null
      if mvn compile exec:java -Dexec.mainClass="com.example.Main"; then
        echo "Java program executed successfully."
      else
        echo "Failed to execute Java program."
      fi
      popd > /dev/null
    else
      echo "Java solution directory not found."
      exit 1
    fi
    ;;
  go)
    if [ -f "problems/$PROBLEM/solution-go/main.go" ]; then
      pushd problems/$PROBLEM/solution-go > /dev/null
      if go run main.go; then
        echo "Go program executed successfully."
      else
        echo "Failed to execute Go program."
      fi
      popd > /dev/null
    else
      echo "Go solution file not found."
      exit 1
    fi
    ;;
  javascript)
    if [ -f "problems/$PROBLEM/solution-javascript/index.js" ]; then
      node problems/$PROBLEM/solution-javascript/index.js
    else
      echo "JavaScript solution file not found."
      exit 1
    fi
    ;;
  *)
    echo "Unsupported language: $LANG"
    exit 1
    ;;
esac
