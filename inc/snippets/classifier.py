def get_words_in_content(content):
	all_words = []
	for (words, sentiment in content):
		all_words.extend(words)
	return all_words

def get_word_features(wordlist):
	wordlist = nltk.FreqDist(wordlist)
	word_features = wordlist.keys()
	return word_features

word_features  = get_word_features(get_words_in_content(content))
