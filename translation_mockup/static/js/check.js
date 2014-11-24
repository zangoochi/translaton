/*Created by: Zach Montgomery
Main Objective: This page was created to save and retrieve session variables for object detection. 
The set and get check functions are used for the state of object detection. If the administrator clicks the find
objects button on the administrator page, then this is automatically checked to True. If he then hits finished on the alert box, 
or unchecks the checkbox on the admin page, then this is set to False. The get and set id is used to trace which object is being
selected. This is only used for the select box, the id of the variable is outside of scope by the time it reaches the dialog box
and must be stored. Then you have the get object and set object. The set object first calls the get_object method to get the object array.
If the object array is empty then it creates a new array with the value of the parameter passed and does a JSON.stringify on the object
which makes it available as a string object to be passed. If it already exists the object doesnt already exist, then push the value to the 
premade object array and restringify it so that it can be passed through the session variables. The get object method uses JSON.parse to 
retrieve the array back in its original form and returns the data. Finally the clear_object is used to set the object array to null. This 
is when you start a fresh search for objects. 
*/


function set_check(value){
 	sessionStorage.setItem("check", value);
 }

 function get_check(){
 	return sessionStorage.getItem("check");
 }

 function set_id(value){
 	sessionStorage.setItem("obj_id", value);
 }

 function get_id(){
 	return sessionStorage.getItem("obj_id");
 }

 function set_object(value){
 	var objects = get_object();
 	var match = false;


 	if(objects != null){

 		for(var i=0; i<objects.length; ++i){

 			if(objects[i] == value){
 				match = true;
 			}
 		}
 	}else{
 		objects = [];
 		objects.push(value);
 		var obj = JSON.stringify(objects);
 		sessionStorage.setItem('objects', obj);
 		return;
 	}

 	if(!match){
 		objects.push(value);
 		var obj = JSON.stringify(objects);
 		sessionStorage.setItem('objects', obj);
 	}
 }

 function get_object(){
	var objs = JSON.parse(sessionStorage.getItem("objects"));
	return objs;

}

function clear_object(){
	sessionStorage.setItem('objects', null);
}
