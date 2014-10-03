
#return an html string of modified words where the differences are highlihgted
def findDifferenceInTexts(originalText, modifiedText):
	originalWords = originalText.split(' ')
	modifiedWords = modifiedText.split(' ')

	for i in range(len(modifiedWords)):
		#checking for words that were misspelled
		if i < len(originalWords):
			if modifiedWords[i].strip() != originalWords[i].strip():
				modifiedWords[i] = highlightWord(modifiedWords[i], "yellow")
		#checking for words that were added
		else:
				modifiedWords[i] = highlightWord(modifiedWords[i], "red")

	return ' ' .join(modifiedWords)

def highlightWord(word, color):
	return '<span style="background-color:{0};">{1}</span>'.format(color, word)