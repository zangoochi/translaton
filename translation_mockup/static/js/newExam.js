//Save a copy of all of the oprions for filtering
var unfilteredSourceTexts = new Array();
var unfilteredGraders     = new Array();


var sourceTexts = document.getElementById('sourceText1').options;
for(var i = 0; i < sourceTexts.length; ++i)
{	
    unfilteredSourceTexts[i] = sourceTexts[i];   
}

/* On form load, grader1 will include all the graders by default, so this sets 
unfilteredGraders to be the list of graders before removing the graders that do
not include the correct language in their languagepairs */
var graders = document.getElementById('grader1').options;

for(var i = 0; i < graders.length; ++i)
{
    unfilteredGraders[i] = graders[i];        
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
    removeObjectsFromSelectBox(grader1);
    removeObjectsFromSelectBox(grader2);
    removeObjectsFromSelectBox(grader3);
    removeObjectsFromSelectBox(grader4);

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

    /* Add filtered items to the grader text boxes, which will only get added if the graders are able based on 
    their language pair */
    for(var i = 0; i < unfilteredGraders.length; ++i)
    {
        var option = unfilteredGraders[i];
        var gId = option.getAttribute('data-gId');
        
        //If the option (aka grader) has either the source language or target language, then add that grader as a viable option
        if((option.getAttribute('data-language') == sourceLanguage || option.getAttribute('data-language') == targetLanguage))
        {            
            //If return is an object then add grader to options
            g1Option = createGraderOption(option, grader1.options, gId);
            if(g1Option != -1)
            {     
                grader1.options.add(g1Option);                
            }  
            g2Option = createGraderOption(option, grader2.options, gId);
            if(g2Option != -1)
            {     
                grader2.options.add(g2Option);                
            }  
            /* As of previous database design, grader 3 and grader 4 must have a value, so give them the 
            value of the first grader. If checking for graders, only input the graders that you need. 
            Just because grader 3 and grader 4 exist, does not mean that they were assigned. To change 
            database to fix this, must delete Exam, and all the other tables that Exam link to such as 
            graders, targetText, sourceText etc.  */
            if(grader3cb.checked){
                g3Option = createGraderOption(option, grader3.options, gId);
                if(g3Option != -1)
                {     
                  grader3.options.add(g3Option);                
                } 
            }
           if(!grader3cb.checked)
            {
                var eOption = new Option("null", g1Option.value);
                grader3.options.add(eOption);
            }
            if(grader4cb.checked){
                g4Option = createGraderOption(option, grader4.options, gId);
                if(g4Option != -1)
                {     
                  grader4.options.add(g4Option);                
                } 
            }
           if(!grader4cb.checked)
            {
                var eOption = new Option("null", g1Option.value);
                grader4.options.add(eOption);
            }
        }
    }
 }

 function updateExamNumber()
 {
    document.getElementById('examNumberPDF').value = document.getElementById('examNumber').value;
 }

//Zach Montgomery: edited in iteration 2 week 4
 function createGraderOption(option, graderOptions, graderId)
 {
    var check = false;
    //check if grader already exists in options
    for(i=0; i<graderOptions.length; ++i)
    {        
        if(option.text == graderOptions[i].text){
            check = true;              
        }
    }
    var result = null;
    
    //If option does not exist, create new element
    //If option exists return -1
    if(check == false){
        if(document.createElement('option')){
        result = document.createElement('option');
        result.value = graderId;
        result.text = option.text;
        return result;}
    }else{
        result = -1;
    }
    return result;
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
