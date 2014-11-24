//calls the grading rubric window
function popup(mylink, windowname){
	
	if (! window.focus)
		return true;
	
	var href;
	if (typeof(mylink) == "string")
   		href=mylink;
	else
   		href=mylink.href;
	
	window.open(href, windowname, "width=1600,height=800,scrollbars=yes");
	return false;
};





//confirmation window function for grading page
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



//Error add confirmation popup
function confirmAdd()
{
		var agree=confirm("Are you sure you want to add this error?");
		if (agree)
		 {return true;}	      
		else
		{return false;}
	
};


//Quality points add confirmation popup
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




//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//Add function to show buttons in correct order




function showAddError()
{
	document.getElementById("add_error").style.display = "block";
	// document.getElementById("add_error").focus();
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById("add_error_menu").style.display = "none";
	// vstepona 10 30 2014 due to removal of qty button
	// document.getElementById("quality_pts").style.display = "none";
	// document.getElementById("quality_pts_menu").style.display = "none";
	document.getElementById("delete_error").style.display = "none";
	document.getElementById("comment_table").style.display = "none";
	// document.getElementById("start_high").disabled = false;
	document.getElementById("start_high").style.display = "";
	// document.getElementById("start_high").click();
	document.getElementById("start_high").focus();
	document.getElementById("end_high").style.display = "none";

	//Turn on the highlighting vstepona 11/11/2014
	document.getElementById("start_high").click();
};

function setSelectValue (id, val) {
    document.getElementById(id).value = val;
    // document.getElementById(id).value = document.getElementById("slct1").value;
}


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

	if (elem.style.display == "")
	{
		elem.style.display = "none";
	}
	else
	{
		elem.style.display = "";
	}


	elem = document.getElementById("end_high");
	if (elem.style.display == "none")
	{
		elem.style.display = "";
	}
	else 
	{
		elem.style.display = "none";
	}
	elem.disabled =  false;

};



//RESEST ALL TO INITIAL STATES
function reset_highlight()
{
	document.getElementById("control_buttons").style.display = "none";
	document.getElementById('start_high').disabled = false;
	document.getElementById('end_high').disabled = true;
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

