//save a copy of all of the oprions for filtering
var unfilteredSourceTexts = new Array();
var unfilteredGraders     = new Array();


var sourceTexts = document.getElementById('sourceText1').options;
for(var i = 0; i < sourceTexts.length; ++i)
{	
    unfilteredSourceTexts[i] = sourceTexts[i];   
}

var graders = document.getElementById('grader1').options;

for(var i = 0; i < graders.length; ++i)
{
    unfilteredGraders[i] = graders[i];        
}     
//wire up on change functions
document.getElementById("year").addEventListener('change', function(){filterSelectBox()});
document.getElementById("sourceLanguage").addEventListener('change', function(){filterSelectBox()});
document.getElementById("targetLanguage").addEventListener('change', function(){filterSelectBox()});

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

//remove all of the options, and read the ones that pass the filter
function filterSelectBox()
{
    setlanguages();

    var selectBox1 = document.getElementById('sourceText1');
    var selectBox2 = document.getElementById('sourceText2');
    var grader1    = document.getElementById('grader1');
    var grader2    = document.getElementById('grader2');
    var grader3    = document.getElementById('grader3');
    var grader4    = document.getElementById('grader4');

    removeObjectsFromSelectBox(selectBox1);
    removeObjectsFromSelectBox(selectBox2);
    removeObjectsFromSelectBox(grader1);
    removeObjectsFromSelectBox(grader2);
    removeObjectsFromSelectBox(grader3);
    removeObjectsFromSelectBox(grader4);

    //add filtered items to the source text select boxes
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

        

        if ( optionSourceText == sourceLanguage && optionTargetText == targetLanguage && optionYear == year)
        {
            selectBox1.options.add(createSourceTextOption(option));
            selectBox2.options.add(createSourceTextOption(option));
        }
    }

    //add filtered items to the grader text boxes, which will only get added if the graders are able based on 
    //their language pair
    for(var i = 0; i < unfilteredGraders.length; ++i)
    {
        var option = unfilteredGraders[i];
        var gId = option.getAttribute('data-graderId');
        
        //If the option has either the source language or target language, then add that as a viable option
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
            g3Option = createGraderOption(option, grader3.options, gId);
            if(g3Option != -1)
            {     
                grader3.options.add(g3Option);                
            }  
            g4Option = createGraderOption(option, grader4.options, gId);
            if(g4Option != -1)
            {     
                grader4.options.add(g4Option);                
            }  
        }
    }
 }

 function updateExamNumber()
 {
    document.getElementById('examNumberPDF').value = document.getElementById('examNumber').value;
 }

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
    
    //If option does not exist create new element
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
