import redis
from texts.models import TargetText, SourceText
from sets import Set

class KeywordManager:
	_connection = redis.StrictRedis(host='localhost', port=6379)

	#add the document (aka sourcetext / target text) to the keyword
	def addDocumentToKeyword(self, document, keywords):
		return self.addDocumentToKeywords(document, [keywords])

	#add the document to all of the keywords
	def addDocumentToKeywords(self, document, keywords):
		documentClassName = document.__class__.__name__
		documentKey = "{0}:{1}".format(documentClassName, document.pk)
		pipe = self._connection.pipeline()
		
		for word in keywords:	
			keywordKey = u"keyword:{0}".format(word)
			pipe.lpush(keywordKey, documentKey)

		return pipe.execute()

	#get the actual dbobject from the redis ket (aka SourceText:1)
	def getDocumentFromKey(self, documentKey):
		split = documentKey.split(':')
		documentType = split[0]
		documentPK = split[1]

		if documentType == "TargetText":
			result = TargetText.objects.get(pk = documentPK)
		else:
			result = SourceText.objects.get(pk = documentPK)

		return result

	def getDocumentsForKeyword(self, keyword):
		keywordKey = "keyword:{0}".format(keyword)
		return map(self.getDocumentFromKey , self._connection.lrange(keywordKey, 0, -1))

	def addKeywordsFromDocument(self, document):
		wordsProcessed = Set()
		for word in document.text.split(' '):
			if not word in wordsProcessed:
				wordsProcessed.add(word)

		self.addDocumentToKeywords(document, wordsProcessed)

		



