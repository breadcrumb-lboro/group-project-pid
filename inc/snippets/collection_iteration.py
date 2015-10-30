content = []

for (words, sentiment) in positive_content + negative_content + neutral_content:
    words_filtered = [e.lower() for e in words.split() if len(e) >= 3]
    content.append((words_filtered, sentiment))
