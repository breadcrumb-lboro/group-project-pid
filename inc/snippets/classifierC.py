training_set = nltk.classify.apply_features(extract_features, content)
classify = nltk.NaiveBayesClassifier.train(training_set)
