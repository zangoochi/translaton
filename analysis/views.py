from django.http import HttpResponse, HttpResponseRedirect
from texts.models import Language, SourceText, Exam, Grader
from records.models import Record
from django.core import serializers
from django.template import RequestContext
from django.core.context_processors import csrf
from django.shortcuts import get_object_or_404, render, render_to_response
from django import forms
from django.template import RequestContext
from django.forms import ModelForm
from rpy2.robjects import r
from rpy2 import robjects as ro
from django.db.models import Q
from analysis.models import RFunctions, RParamaters, RFunctionForm
import imp, os, re
import json
from itertools import chain

#KeywordManager = imp.load_source('KeywordManager', os.getcwd() + '/keyword/KeywordManager.py')
#k = KeywordManager.KeywordManager()


# This function can generate random sample data
# When the page is reflashed, the data will be replaced by new ones
r("""totalError <- function( fileName)
{
	library(RMySQL)
	connectionObject <-  dbConnect(MySQL(), user="root", password="", dbname= "translation", host="localhost")
	#Query to be run on connectionObject
	#	*Currently utilizes tables texts_exam and texts_language
	#	*Currently utilizes fields texts_exam.sourceLanguage_id, texts_exam.targetLanguage_id, texts_language.id, and texts_language.language
	queryCommand <- paste("
	SELECT
		source_Language.displayName AS Language_Source,
		target_Language.displayName AS Language_Target,
		COUNT(*) AS Count

		FROM texts_exam AS Exams
			INNER JOIN texts_language AS source_Language
			INNER JOIN texts_language AS target_Language
			INNER JOIN texts_error AS errors

		WHERE
			Exams.sourceLanguage_id = source_Language.id
			AND Exams.targetLanguage_id = target_Language.id
			AND Exams.id = errors.exam_id

		GROUP BY Language_Source, Language_Target

		ORDER BY Language_Source DESC, Language_Target DESC
		;")

	#Run and store result of query into queryResult variable
	queryResult <- dbSendQuery(connectionObject,queryCommand)

	#Change resulting query from query result to data.frame through fetch()
	#	*"n = #" specifies number of rows to store in the frame, "n = -1" will retrieve all rows
	dataFetched <- fetch(queryResult, n = -1)

	#Combine columns Language_Source and Language_Target into a single column named Language
	dataFetched$Language <- paste(dataFetched$Language_Source, dataFetched$Language_Target, sep = " to ")

	#Remove columns Language_Source and Language_Target
	dataFetched$Language_Source <- NULL
	dataFetched$Language_Target <- NULL

	#Begin recording of graphing
	png(fileName)

	#Specifies margins and graphing specifications
	#	*Increased left margin size to accommodate y-axis names (the languages)		[mar=c(5,10,4,2)+0.1]
	#	*Default margins for labels							[mgp=c(3,1,0)]
	#	*All text horizontal								[las=1]
	par(mar=c(5.1,10.1,4.1,2.1),mgp=c(3,1,0),las=1)

	#Color palette for graph
	graphColors = c("firebrick3", "firebrick4")

	#Make the barplot (horizontal specified)
	barplot(xlab = "Number of Errors", main = "Errors to Translation Set", horiz=TRUE, col=graphColors)

	#Close connection to file (prevent further writing to same file)
	dev.off()
}""")
r(""" Sample_Data <- function(n)

      sample(1:100,n,replace=F)


  """)

r("""totalTest <- function(fileName)
{
	library(RMySQL)
	connectionObject <-  dbConnect(MySQL(), user="root", password="geranium2", dbname= "translation", host="localhost")

		queryCommand <- paste("
	SELECT
		source_Language.displayName AS Language_Source,
		target_Language.displayName AS Language_Target,
		COUNT(*) AS Count

		FROM texts_exam AS Exams
			INNER JOIN texts_language AS source_Language
			INNER JOIN texts_language AS target_Language

		WHERE
			Exams.sourceLanguage_id = source_Language.id
			AND Exams.targetLanguage_id = target_Language.id

		GROUP BY Language_Source, Language_Target

		ORDER BY Language_Source DESC, Language_Target DESC
		;")

	#Run and store result of query into queryResult variable
	queryResult <- dbSendQuery(connectionObject,queryCommand)

	#Change resulting query from query result to data.frame through fetch()
	#	*"n = #" specifies number of rows to store in the frame, "n = -1" will retrieve all rows
	dataFetched <- fetch(queryResult, n = -1)

	#Combine columns Language_Source and Language_Target into a single column named Language
	dataFetched$Language <- paste(dataFetched$Language_Source, dataFetched$Language_Target, sep = " to ")

	#Remove columns Language_Source and Language_Target
	dataFetched$Language_Source <- NULL
	dataFetched$Language_Target <- NULL

	#Begin recording of graphing
	png(fileName)

	#Specifies margins and graphing specifications
	#	*Increased left margin size to accommodate y-axis names (the languages)		[mar=c(5,10,4,2)+0.1]
	#	*Default margins for labels							[mgp=c(3,1,0)]
	#	*All text horizontal								[las=1]
	par(mar=c(5.1,10.1,4.1,2.1),mgp=c(3,1,0),las=1)

	#Color palette for graph
	graphColors = c("steelblue3", "steelblue4")

	#Make the barplot (horizontal specified)
	barplot(5, names = "dataFetched$Language", xlab = "Number of Exams", main = "Exams to Translation Set", horiz=TRUE, col=graphColors)

	#Close connection to file (prevent further writing to same file)
	dev.off()

}""")




# This is a line-graph generation function for average score
r("""averageScore <- function(filename, title, scores, years, exams, passages) {

   if (length(years) > 1){

        All_Exams <- vector()
        for (i in 1:length(years)){
          All_Exams <- append(All_Exams,c(mean(Sample_Data(1 + i))))
        }

      g_range  <- range(0,100)

      png(file=filename, width=800, height=480)
      plot(All_Exams,type="o",col="blue",ylim=g_range,axes=FALSE,ann=FALSE)
      axis(1,at=1:length(years),lab=c(years))
      axis(2,las=1,at=10*0:g_range[2])

      box()

      title(main="Avg. Score",col.main="red",font.main=4)
      title(xlab="Years",col.lab=rgb(0,0.5,0))
      title(ylab="Score",col.lab=rgb(0,0.5,0))

      cl <- rainbow(length(unique(c(title))))
      legend(1, g_range[2], unique(title), cex=0.8,
        col=c(cl), pch=21:22, lty=1:2);

        for (i in 1:length(years)){
        text(i, All_Exams[i]+5, labels=round(All_Exams[i],1))
        }

      dev.off()
   }else{

      All_Exams <- rep(c(mean(Sample_Data(length(exams)))), times = length(exams))

      g_range  <- range(0,100)

      png(file=filename, width=800, height=480)
      plot(All_Exams,type="o",col="blue",ylim=g_range,axes=FALSE,ann=FALSE)
      axis(1,at=1:length(exams),lab=c(exams))
      axis(2,las=1,at=10*0:g_range[2])

      box()

      title(main="Avg. Score",col.main="red",font.main=4)
      title(xlab="Exams",col.lab=rgb(0,0.5,0))
      title(ylab="Score",col.lab=rgb(0,0.5,0))

      legend(1, g_range[2], unique(c(paste(title, years, sep=" "))), cex=0.8,
      col=c("blue"), pch=21:22, lty=1:2);

        for (i in 1:length(All_Exams)){
        text(i, All_Exams[i]+5, labels=round(All_Exams[i],1))
        }

      dev.off()


   }
    }""")



# This is a line-graph generation function for pass fail rates
r("""passFail <- function(filename, title, scores, years, exams, passages) {
   if (length(years) > 1){
        All_Exams <- vector()
        for (i in 1:length(years)){
          All_Exams <- append(All_Exams,c(mean(Sample_Data(1 + i))))
        }

      #All_Exams <- rep(c(mean(Sample_Data(1)), mean(Sample_Data(5)), mean(Sample_Data(6))))
      g_range <- range(0,100)
      png(file=filename, width=800, height=480)
      plot(All_Exams,type="o",col="blue",ylim=g_range,axes=FALSE,ann=FALSE)
      axis(1,at=1:length(years),lab=c(years))
      axis(2,las=1,at=5*0:g_range[2])

      title(main="Pass Rate %",col.main="red",font.main=4)
      title(xlab="Years",col.lab=rgb(0,0.5,0))
      title(ylab="% of Passing Tests",col.lab=rgb(0,0.5,0))
      box()


      cl <- rainbow(length(unique(c(title))))
      legend(1, g_range[2], unique(c(title)), cex=0.8,
        col=c(cl), pch=21:22, lty=1:2);

      for (i in 1:length(years)){
        text(i, All_Exams[i]+5, labels=round(All_Exams[i],1))
        }


      dev.off()
   } else{
        All_Exams <- rep(c(mean(Sample_Data(length(exams)))), times = length(exams))
      g_range <- range(0,100)
      png(file=filename, width=800, height=480)
      plot(All_Exams,type="o",col="blue",ylim=g_range,axes=FALSE,ann=FALSE)
      axis(1,at=1:length(exams),lab=c(exams))
      axis(2,las=1,at=5*0:g_range[2])
      title(main="Pass Rate %",col.main="red",font.main=4)
      title(xlab="Exams",col.lab=rgb(0,0.5,0))
      title(ylab="% of Passing Tests",col.lab=rgb(0,0.5,0))
      box()

      legend(1, g_range[2], unique(c(paste(title, years, sep=" "))), cex=0.8,
      col=c("blue"), pch=21:22, lty=1:2);

       for (i in 1:length(All_Exams)){
        text(i, All_Exams[i]+5, labels=round(All_Exams[i],1))
        }

      dev.off()
   }
  }""")

# This is a bar-graph generation function for error breakdown
r("""errorBreakdown <- function(filename, title, format, exams) {
   if (format == "byHalf"){
   A <- matrix(c(3,5,7,1,9,4,6,5,2,12,2,1,7,6,8),nrow=2,ncol=length(exams),byrow=TRUE)
   png(file=filename, width=800, height=480)
   barplot(A,width=0.8,main=paste(title,"Errors By Half",sep=" "),col.main="red",font.main=4,names.arg=c(exams),
   xlab="Exams",ylab="Errors",col.lab=rgb(0,0.5,0),col=c("tan2","blue"), xlim=c(0,length(exams)))
   legend("topleft",c("1st half","2nd half"),cex=.8,
   col=c("tan2","blue"),pch=c(22,0,0))
   box()
   dev.off()

   }else if (format == "byQuarter"){
   A <- matrix(c(3,5,7,1,9,4,6,5,2,12,2,1,7,6,8),nrow=4,ncol=length(exams),byrow=TRUE)
   png(file=filename, width=800, height=480)
   barplot(A,width=0.8,main=paste(title,"Errors By Quarter",sep=" "),col.main="red",font.main=4,names.arg=c(exams),
   xlab="Exams",ylab="Errors",col.lab=rgb(0,0.5,0),col=c("tan2","blue","darkslategray3", "red"), xlim=c(0,length(exams)))
   legend("topleft",c("1st qtr","2nd qtr","3rd qtr", "4th qtr"),cex=.8,
   col=c("tan2","blue","darkslategray3", "red"),pch=c(22,0,0))
   box()
   dev.off()

   }else if (format =="HalfwithScore"){
    a <- c(3,5,7,1,9,4,6,5,2,12,2,1,7,6,8)
  A <- matrix(a,nrow=2,ncol=length(exams),byrow=TRUE)

  png(file=filename, width=800, height=480)
  bp <-barplot(A, beside = TRUE,width=0.8,main=paste(title,"Errors By Half",sep=" "),col.main="red",font.main=4,names.arg=c(exams),
  xlab="Exams",ylab="Errors",col.lab=rgb(0,0.5,0),col=c("tan2","blue"), ylim=c(0,20))
  legend("topleft",c("1st half","2nd half"),cex=.8,
  col=c("tan2","blue"),pch=c(22,0,0))

  text(bp, 0, round(A, 1),cex=2,pos=3)
    box()
    dev.off()

   }else if (format == "QuarterwithScore"){
     a <- c(3,5,7,1,9,4,6,5,2,12,2,1,7,6,8)
     A <- matrix(a,nrow=4,ncol=length(exams),byrow=TRUE)
     png(file=filename, width=800, height=480)

     bp <- barplot(A, beside = TRUE, width=0.8,main=paste(title,"Errors By Quarter",sep=" "),col.main="red",font.main=4,names.arg=c(exams),
    xlab="Exams",ylab="Errors",col.lab=rgb(0,0.5,0),col=c("tan2","blue","darkslategray3", "red"), ylim=c(0,20))

    legend("topleft",c("1st qtr","2nd qtr","3rd qtr", "4th qtr"),cex=.8,
    col=c("tan2","blue","darkslategray3", "red"),pch=c(22,0,0))
    text(bp, 0, round(A, 1),cex=2,pos=3)
    box()
    dev.off()

   }

  }""")


def index(request):
    langs = Language.objects.all()
    graders = Grader.objects.all()
    c = {}
    c.update(csrf(request))
    # ... view code here
    return render(request,'analysis/index.html', {'langs': langs, 'graders': graders})

#Pass objects to rDesigner.html for individual processing
def rDesigner(request):
  return rDesignerWithArgs(request, None);

def rDesignerWithArgs(request, fileList):
  rfunctions = RFunctions.objects.all()
  rparameters = RParamaters.objects.all().order_by('RFunction','SequenceNumber');
  return render(request, 'analysis/rDesigner.html', {'rfunctions': rfunctions, 'rparameters': rparameters, 'rform': RFunctionForm, 'fileList': fileList});

#Form POST R function deletion
def rDeletion(request):
  todel = request.POST.getlist("todelete")
  RFunctions.objects.filter(id__in=todel).delete();
  return HttpResponseRedirect('..')

def relParms(functionId):
  return RParamaters.objects.filter(id=functionId);

def rEdit(request):
  item = RFunctions.objects.get(id=request.POST["id"])
  item.Name = request.POST["Name"]
  item.Description = request.POST["Description"]
  item.ReturnType = request.POST.get('ReturnType', 'IMG')
  item.Body = request.POST["Body"]
  item.save()
  saveParms(item, request)
  return HttpResponseRedirect('..')

def saveParms(rFunction, request):
  RParamaters.objects.filter(RFunction=rFunction.id).delete();

  parms = request.POST.getlist('parm')
  i = 0
  for parm in parms:
    RParamaters.objects.get_or_create(RFunction = rFunction, SequenceNumber = i, parameter = parm)
    i += 1
  print request.POST

def rCreate(request):
  item, p = RFunctions.objects.get_or_create(Name = request.POST["Name"], Description = request.POST["Description"], Body = request.POST["Body"])
  #item.save()
  print("saving parms pre")
  saveParms(item, request)
  return HttpResponseRedirect('..')

def bound_form():
 	item = RFunctions.objects.get(id=1)
  	if item == None:
		item = RFunctions()
  		form = RFunctionForm(initial={  'id': item.id,
                                  		'Name': item.Name,
                                  		'Description': item.Description,
                                  		'Body': item.Body,
                                  		'ReturnType': item.ReturnType})
	return form

def getFunctionParms(request):
  json_data = serializers.serialize('json', RParamaters.objects.filter(RFunction=request.GET["value"]))
  #objs = simplejson.loads( serialized_obj )
  #json_data = simplejson.dumps( {'funcs':objs} )
  print json_data
  return HttpResponse(json_data, content_type="application/json")

def getFileList(dir):
  fileList = "";
  for file in os.listdir(dir):
      fileList = fileList + file + ":"
  return fileList;

def executeRFunction(request):
  outputDirectory = os.getcwd() + "/translation_mockup/static/img/" + request.session.session_key;
  if not os.path.exists(outputDirectory):
    os.makedirs(outputDirectory);
  for existingFile in os.listdir(outputDirectory):
    filePath = os.path.join(outputDirectory, existingFile)
    try:
      if os.path.isfile(filePath):
        os.unlink(filePath)
    except Exception, e:
      print e

  item = RFunctions.objects.get(id=request.POST["FunctionID"])
  rawR = item.Body
  rawR = rawR.replace("\r", "");
  rawR = "outputDir = '" + outputDirectory + "/'\n" + rawR
  rToExecute = """{0}"""
  ro.r(rToExecute.format(rawR))

  fileList = json.dumps(getFileList(outputDirectory));
  return rDesignerWithArgs(request, fileList);

def getFunctionData(request):
  json_data = serializers.serialize('json', RFunctions.objects.filter(id=request.GET["value"]))
  #objs = simplejson.loads( serialized_obj )
  #json_data = simplejson.dumps( {'funcs':objs} )
  print json_data
  return HttpResponse(json_data, content_type="application/json")

#  return HttpResponse('test', mimetype="text/plain") 
def getParams(request):

    if request.GET["type"] == "Years":
        source = list(request.GET["source"].split(","))
        target = list(request.GET["target"].split(","))
        years = []
        for y in Record.objects.raw('SELECT year, id FROM records_record WHERE source_language in %s and target_language in %s group by year ' ,[source, target] ):
            years.insert(y.id, (y.year, y.year))
        response = render_to_response("analysis/params_list.html", {'params': years})
        return response

    elif request.GET["type"] == "Exams":
            years = list(request.GET["year"].split(","))
            source = list(request.GET["source"].split(","))
            target = list(request.GET["target"].split(","))
            grader = list(request.GET["grader"].split(","))
            exams = []
            for e in Record.objects.raw('SELECT exam_number, id FROM records_record where year in %s and source_language in %s and target_language in %s group by exam_number', [years, source, target]):
                exams.insert(e.id, (e.exam_number , e.exam_number))
            response = render_to_response("analysis/params_list.html", {'params': exams })
            return response

    elif request.GET["type"] == "Passages":
            exams =  list(request.GET["value"].split(","))
            passages = []
            passages.insert(0,('A','A'))
            for p in Record.objects.raw('select second_passage, id from records_record where exam_number in %s group by second_passage', [exams]):
                passages.insert(p.id, (p.second_passage, p.second_passage))
            response = render_to_response("analysis/params_list.html", {'params': passages })
            return response


def generateGraph(request):
    source = list(request.GET["source"].split(","))
    target = list(request.GET["target"].split(","))
    years = list(request.GET["year"].split(","))
    exams =  list(request.GET["exam"].split(","))
    passages = list(request.GET["passage"].split(","))
    languagePair = ''
    if request.GET["type"] == "userAnalysis":
      r.totalError("translation_mockup/static/img/totalError.png")
      return HttpResponse('<img src="/static/img/totalError.png" />')
    if request.GET["type"] == "mainAnalysis":
	r.totalTest("translation_mockup/static/img/totalTest.png")
	return HttpResponse('<img src="/static/img/totalTest.png" />')
    if request.GET["type"] == "passFail":
        langs = []
        scores = []
        if len(source) > 1:
            for l in Language.objects.raw('select id, displayName from texts_language where id in %s', [target]):
                languagePair = "_" + l.displayName

            for s in Record.objects.raw('select 100 - SUM(texts_error.pointsDeducted) + records_record.global_quality_pts as Score, texts_error.id, displayName from texts_error left outer join records_record on texts_error.exam_id = records_record.id left outer join texts_language on records_record.source_language = texts_language.id where records_record.source_language in %s and records_record.target_language in %s and records_record.year in %s and records_record.exam_number in %s and texts_error.passageLetter in %s group by texts_error.exam_id',[source, target, years, exams, passages]):
                scores.append(s.Score)
                langs.append(s.displayName + languagePair)

        elif len(target) > 1:
            for l in Language.objects.raw('select id, displayName from texts_language where id in %s', [source]):
                languagePair = l.displayName + "_"

            for s in Record.objects.raw('select 100 - SUM(texts_error.pointsDeducted) + records_record.global_quality_pts as Score, texts_error.id, displayName from texts_error left outer join records_record on texts_error.exam_id = records_record.id left outer join texts_language on records_record.target_language = texts_language.id where records_record.source_language in %s and records_record.target_language in %s and records_record.year in %s and records_record.exam_number in %s and texts_error.passageLetter in %s group by texts_error.exam_id',[source, target, years, exams, passages]):
                scores.append(s.Score)
                langs.append(languagePair + s.displayName)

        r.passFail("translation_mockup/static/img/passFail.png",langs, ro.IntVector(scores), years, exams, passages)
        return HttpResponse('<img src="/static/img/passFail.png" />')

    elif request.GET["type"] == "avgScore":
        langs = []
        scores = []
        if len(source) > 1:
            for l in Language.objects.raw('select id, displayName from texts_language where id in %s', [target]):
                languagePair = "_" + l.displayName

            for s in Record.objects.raw('select 100 - SUM(texts_error.pointsDeducted) + records_record.global_quality_pts as Score, texts_error.id, displayName from texts_error left outer join records_record on texts_error.exam_id = records_record.id left outer join texts_language on records_record.source_language = texts_language.id where records_record.source_language in %s and records_record.target_language in %s and records_record.year in %s and records_record.exam_number in %s and texts_error.passageLetter in %s group by texts_error.exam_id',[source, target, years, exams, passages]):
                scores.append(s.Score)
                langs.append(s.displayName + languagePair)

        elif len(target) > 1:
            for l in Language.objects.raw('select id, displayName from texts_language where id in %s', [source]):
                languagePair = l.displayName + "_"

            for s in Record.objects.raw('select 100 - SUM(texts_error.pointsDeducted) + records_record.global_quality_pts as Score, texts_error.id, displayName from texts_error left outer join records_record on texts_error.exam_id = records_record.id left outer join texts_language on records_record.target_language = texts_language.id where records_record.source_language in %s and records_record.target_language in %s and records_record.year in %s and records_record.exam_number in %s and texts_error.passageLetter in %s group by texts_error.exam_id',[source, target, years, exams, passages]):
                scores.append(s.Score)
                langs.append(languagePair + s.displayName)

        r.averageScore("translation_mockup/static/img/avgScore.png", langs, ro.IntVector(scores), years, exams, passages)
        return HttpResponse('<img src="/static/img/avgScore.png" />')

    elif request.GET["type"] == "errorBreakdown":
            r.errorBreakdown("translation_mockup/static/img/errorBreakdown.png", languagePair, request.GET["format"], exams)
            return HttpResponse('<img src="/static/img/errorBreakdown.png" />')



#return the marked up html for the keywords in their original context
def getKeywords(request, query):
  offsetLength = 30
  match = k.getDocumentsForKeyword(query)[0]

  #get the error in context as it appears in the source yexy
  hilightedResult = '<span style="background-color:LightBlue;">' + query + '</span>'
  queryPosition = match.text.find(query)
  finalHTML = match.text[queryPosition - offsetLength : queryPosition] + hilightedResult + match.text[queryPosition + len(query) : queryPosition + offsetLength]

  #get all of the errors that have the query in the source phrase for any of the exams that have the souce text as one of the fields
  examsWithSourceText = Exam.objects.filter(Q(sourceText1__pk = match.pk) | Q(sourceText2__pk = match.pk))
  errorsWithQuery = []
  for exam in examsWithSourceText:
    errorsWithQuery.extend(map(lambda e: e.as_json(), exam.error_set.filter(sourcePhrase__contains = query)))

  result =  {'sourceTextHTML': finalHTML, 'errors': errorsWithQuery}
  return HttpResponse(json.dumps(result), mimetype="application/json")

#line chart

#def generateLineGraph(request):
   # r.generate_line("translation_mockup/static/img/Avg_Line.png", "Random data ", "mm")
   # return HttpResponse('<img src="/static/img/Avg_Line.png" />')

