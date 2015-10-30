content = "You're so annoying"
print classifier.classify(extract_features(content.split()))
# $ negative

content = "I really love you"
print classifier.classify(extract_features(content.split()))
# $ positive
