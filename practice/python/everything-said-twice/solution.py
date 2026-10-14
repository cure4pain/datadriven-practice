from collections import Counter

def word_counts(text: str) -> dict:

  words = text.strip().split()
  count = Counter(words)

  return count
