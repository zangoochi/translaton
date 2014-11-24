/* 
#=====================================================================================================
#Description:
#Javascript used to sort source texts and target texts
#=====================================================================================================

#Edited by: Zach Montgomery
#Date:11/11/14
#Contact Info: zmontgom@kent.edu
#Changes made: Removed all code associated with setting graders as options in entering a new Legacy Exam

#=====================================================================================================
*/


//Save a copy of all of the oprions for filtering
var unfilteredSourceTexts = new Array();

var sourceTexts = document.getElementById('sourceText1').options;
for(var i = 0; i < sourceTexts.length; ++i)
{	
    unfilteredSourceTexts[i] = sourceTexts[i];   
}
   
/* Wire up on change functions by adding an even listener. If the event listener is called
then the filterSelectBox() function is called. Want to listen to year, source language 
and target language for limiting the options of the graders and source text files and also
wants to listen to the grader 3 and 4 checkboxes because if they are not checked then there 
should be no values for them. */
document.getElementById("year").addEventListener('change', function(){filterSelectBox()});
document.getElementById("sourceLanguage").addEventListener('change', function(){filterSelectBox()});
document.getElementById("targetLanguage").addEventListener('change', function(){filterSelectBox()});
document.getElementById("grader3cb").addEventListener('change', function(){filterSelectBox()});
document.getElementById("grader4cb").addEventListener('change', function(){filterSelectBox()});

//if one of the source or target languages is not english, set the other one to english
function setlanguages()
{
    if(document.getElementById('sourceLanguage').value != "eng")
    {
        document.getElementById('targetLanguage').value = "eng";
    }

    if(document.getElementById('targetLanguage').value != "eng")
    {
        document.getElementById('sourceLanguage').value = "eng";
    }
}

//Remove all of the options, and read the ones that pass the filter
function filterSelectBox()
{
    setlanguages();

    // Get all the variable from enter_exam.html in records templates
    var selectBox1 = document.getElementById('sourceText1');
    var selectBox2 = document.getElementById('sourceText2');

    var grader1    = document.getElementById('grader1');
    var grader2    = document.getElementById('grader2');
    var grader3    = document.getElementById('grader3');
    var grader4    = document.getElementById('grader4');

    var grader3cb  = document.getElementById('grader3cb');
    var grader4cb  = document.getElementById('grader4cb');

    /*Removes all the objects from the options. This is why we previously saved
     the data in unfilteredGraders and unfilteredSourceTexts*/
    removeObjectsFromSelectBox(selectBox1);
    removeObjectsFromSelectBox(selectBox2);


    //Add filtered items to the source text select boxes
    var year = document.getElementById('year').value;
    var sourceLanguage = document.getElementById('sourceLanguage').value;
    var targetLanguage = document.getElementById('targetLanguage').value;
    for(var i = 0; i < unfilteredSourceTexts.length; ++i)
    {           
        //only add if the year and languge pairs match (one other than eng will be in the language pair)
        var option = unfilteredSourceTexts[i];        
        var optionSourceText = option.text.substring(0,3);
        var optionTargetText = option.text.substring(4,7);
        var optionYear       = option.text.substring(8, 12);

        
        //Only add to the select box if the sourceText, targetText and year all match
        if ( optionSourceText == sourceLanguage && optionTargetText == targetLanguage && optionYear == year)
        {
            selectBox1.options.add(createSourceTextOption(option));
            selectBox2.options.add(createSourceTextOption(option));
        }
    }
 }

 function updateExamNumber()
 {
    document.getElementById('examNumberPDF').value = document.getElementById('examNumber').value;
 }

 function createSourceTextOption(option)
 {
    var result = document.createElement('option');
    result.value = option.value;
    result.text = option.text;

    return result;
 }
      
 function removeObjectsFromSelectBox(selectBox)
 {
    for(var i = selectBox.options.length ; i >= 0; i--)
    {
     selectBox.remove(i);
    }
 }
