function targetpair(){
if(sourceText != '' && targetText != ''){
   window.frames["sourcetargetpair"].document.getElementById("text").innerHTML += sourceText + " ---> " + targetText + "\n";
	sourceText = '';
	targetText = '';  
   }
   else {
   	alert("No matching pair selected");
   		}
        
}
function stylizeHighlightedString() 
{
    var range = window.getSelection().getRangeAt(0);
    var selectionContents = range.extractContents();
    var span = document.createElement("span");
    var frame = window.frameElement.getAttribute("Name");
    span.appendChild(selectionContents);         

	if (frame == "source"){
		top.sourceText=span.innerHTML;
	}
	else if (frame == "target"){
	     top.targetText = span.innerHTML;
		}

	
	
    if (getSelectionParentElement().className == "") span.className="highlight";
    else if (getSelectionParentElement().className == "highlight") span.className="unhighlight";
    else if (getSelectionParentElement().className == "unhighlight") span.className="highlight";

 	range.insertNode(span);    
  saveHighHTML(frame);

}

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie != '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) == (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
function csrfSafeMethod(method) {
    // these HTTP methods do not require CSRF protection
    return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
}

function saveHighHTML(frameId) {
  var html = document.getElementById(frameId).innerHTML;
  alert(html);
  //var html = $("\"#"+frameId+"\"").html();
  var csrftoken = getCookie('csrftoken');
  $.ajaxSetup({
    crossDomain: false, // obviates need for sameOrigin test
    beforeSend: function(xhr, settings) {
        if (!csrfSafeMethod(settings.type)) {
            xhr.setRequestHeader("X-CSRFToken", csrftoken);
        }
    }
});
  $.ajax({
    type: "POST",
    url:  "/grade/exam/1/A/saveHtml/",
    data: {html: html, frameId: frameId}
  })
    .done(function(){
      alert("success");
    })
    .fail(function(){
      alert("failed");
    });
}

function getSelectionParentElement() {
    var parentEl = null, sel;
    if (window.getSelection) {
        sel = window.getSelection();
        if (sel.rangeCount) {
            parentEl = sel.getRangeAt(0).commonAncestorContainer;
            if (parentEl.nodeType != 1) {
                parentEl = parentEl.parentNode;
            }
        }
    } else if ( (sel = document.selection) && sel.type != "Control") {
        parentEl = sel.createRange().parentElement();
    }
    return parentEl;
}

function onloadHandler()
{
    var body = document.body;
   if (window.getSelection){
   		body.onmouseup = stylizeHighlightedString;
   	}
}
