//calls the grading rubric window
function popup(mylink, windowname)
{
if (! window.focus)return true;
var href;
if (typeof(mylink) == "string")
   href=mylink;
else
   href=mylink.href;
window.open(href, windowname, "width=1600,height=800,scrollbars=yes");
return false;
};

//function populates the error code table and dynamically populates the error values table
function populate(eCode,eValue)
{
	
	var eCode = document.getElementById(eCode);
	var eValue = document.getElementById(eValue);
	eValue.innerHTML = "";
	if(eCode.value == "A" || eCode.value == "O" || eCode.value == "T" || eCode.value == "R" || eCode.value == "F" || eCode.value == "L" || eCode.value == "FC" || eCode.value == "IND" || eCode.value == "I" || eCode.value == "AMB" || eCode.value == "UNF" || eCode.value == "ILL" || eCode.value == "OTH" || eCode.value == "MT" || eCode.value == "MU" || eCode.value == "a" || eCode.value == "o" || eCode.value == "t" || eCode.value == "r" || eCode.value == "f" || eCode.value == "l" || eCode.value == "fc" || eCode.value == "ind" || eCode.value == "i" || eCode.value == "amb" || eCode.value == "unf" || eCode.value == "ill" || eCode.value == "oth" || eCode.value == "mt" || eCode.value == "mu")
		{
		var optionArray = ["|","1|1","2|2","4|4","8|8","16|16"];
		} 
	else if(eCode.value == "G" || eCode.value == "SY" || eCode.value == "P" || eCode.value == "D" || eCode.value == "C" || eCode.value == "WF" || eCode.value == "U" || eCode.value == "ST" || eCode.value == "g" || eCode.value == "sy" || eCode.value == "p" || eCode.value == "d" || eCode.value == "c" || eCode.value == "wf" || eCode.value == "u" || eCode.value == "st" )
		{
		var optionArray = ["|","1|1","2|2","4|4"];
		}
	else if(eCode.value == "SP" || eCode.value == "sp" )
		{
		var optionArray = ["|","1|1","2|2"];
		}
	for (var option in optionArray)
		{
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		eValue.options.add(newOption);
		}
};
//confirmation window function
function confirmEnd()
{	
		var agree=confirm("You are about to finalize your grading?\nOnce finalized, changes cannot be made.\nAre you sure?");
		if (agree)
		{	
			//lock down the exam in the database
			$.ajax
			({
				url: 'finalize/',
				type: 'POST',
				data: {csrfmiddlewaretoken: getCookie('csrftoken')},
				success: function(data)
				{
					window.location.href = "/";
				}
			});	
		}
		else return false;
};

function confirmAdd()
{
		var agree=confirm("Are you sure you want to add this error?");
		if (agree)
		 {return true;}	      
		else
		{return false;}
	
};

function confirmAddQty()
{
		var agree=confirm("Are you sure you want to add quality ponts?");
		if (agree) 
		{return true;}
		else
		{return false;}
	
};


function confirmDel()
{	
		var agree=confirm("Are you sure you want to delete?");
		if (agree)
		{return true;}
		else 
		{return false;}
};

function showAddError()
{
	document.getElementById("add_error").style.display = "block";
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById("add_error_menu").style.display = "none";
	document.getElementById("quality_pts").style.display = "none";
	document.getElementById("quality_pts_menu").style.display = "none";
	document.getElementById("delete_error").style.display = "none";
	document.getElementById("comment_table").style.display = "none";
	document.getElementById("start_high").disabled = false;
	document.getElementById("end_high").disabled = true;
};

function showAddErrorMenu()
{			
	document.getElementById("add_error_menu").style.display = "block";	
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById("add_error").style.display = "none";
	document.getElementById("quality_pts").style.display = "none";
	document.getElementById("quality_pts_menu").style.display = "none";
	document.getElementById("delete_error").style.display = "none";
	document.getElementById("comment_table").style.display = "none";

};

function showQtyPts()
{
	document.getElementById("quality_pts").style.display = "block";
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById("add_error").style.display = "none";
	document.getElementById("add_error_menu").style.display = "none";
	document.getElementById("quality_pts_menu").style.display = "none";
	document.getElementById("delete_error").style.display = "none";
	document.getElementById("comment_table").style.display = "none";
	document.getElementById("qty_start_high").disabled = false;
	document.getElementById("qty_end_high").disabled = true;
};

function showQtyPtsMenu()
{			
	document.getElementById("quality_pts_menu").style.display = "block";	
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById("add_error").style.display = "none";
	document.getElementById("add_error_menu").style.display = "none";
	document.getElementById("quality_pts").style.display = "none";
	document.getElementById("delete_error").style.display = "none";
	document.getElementById("comment_table").style.display = "none";
};


function showDeleteError()
{
	document.getElementById("delete_error").style.display = "block";
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById("add_error").style.display = "none";
	document.getElementById("add_error_menu").style.display = "none";
	document.getElementById("quality_pts").style.display = "none";
	document.getElementById("quality_pts_menu").style.display = "none";
	document.getElementById("comment_table").style.display = "none";
};

function showCommentTable()
{
	document.getElementById("comment_table").style.display = "block";
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById("add_error").style.display = "none";
	document.getElementById("add_error_menu").style.display = "none";
	document.getElementById("quality_pts").style.display = "none";
	document.getElementById("quality_pts_menu").style.display = "none";
	document.getElementById("delete_error").style.display = "none";
};

//ENABLES DISABLES START/END HIGHLIGHT OPPOSITE OF EACH OTHER
function highlight_buttons()
{

	
	var elem = document.getElementById("start_high");
	elem.disabled = (elem.disabled == true) ? false : true;
	elem = document.getElementById("end_high");
	elem.disabled = (elem.disabled == true) ? false : true;
};

function qty_highlight_buttons()
{

	
	var elem = document.getElementById("qty_start_high");
	elem.disabled = (elem.disabled == true) ? false : true;
	elem = document.getElementById("qty_end_high");
	elem.disabled = (elem.disabled == true) ? false : true;
};
//RESEST ALL TO INITIAL STATES
function reset_highlight()
{
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById('start_high').disabled = false;
	document.getElementById('end_high').disabled = true;
};

//RESEST ALL TO INITIAL STATES
function qty_reset_highlight()
{
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById('qty_start_high').disabled = false;
	document.getElementById('qty_end_high').disabled = true;
};

//FUNCTION USED TO HIDING THE COMMENTS TABLE
function close_table()
{
	document.getElementById("control_buttons").style.display = "block";
	document.getElementById("comment_table").style.display = "none";
};

//ONCE CANCEL BUTTON IS PUSHED SETS OBJECTS BACK TO INITIAL STATES
function cancel()
{
	document.getElementById("control_buttons").style.display = "block";
	document.getElementById("add_error").style.display = "none";
	document.getElementById("add_error_menu").style.display = "none";
	document.getElementById("quality_pts").style.display = "none";
	document.getElementById("quality_pts_menu").style.display = "none";
	document.getElementById("delete_error").style.display = "none";
	document.getElementById("comment_table").style.display = "none";
};

//ONCE RESET BUTTON IS PUSHED SETS OBJECTS BACK TO INITIAL STATES
//FUNCTION ALLOWS ONCLICK TO PERFORM MULTIPLE EVENTS
function reset_delete()
{
	
		document.getElementById("control_buttons").style.display = "none";	
};

function addError()
{
	var errorNumber = document.getElementById("add_errorNumber").value;
	var errorCodeSelection  = document.getElementById("slct1");
	var errorCode = errorCodeSelection.options[errorCodeSelection.selectedIndex].value;

	console.log(errorCode);
	return false;
}

//return a formatted string that represents the error
function formatError(error)
{

}

//VAR FOR SCOREBOARD
var temp = "0";

//returns the cookie with the specified name
function getCookie(name) 
{
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
