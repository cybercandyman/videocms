/**
* @author Erik Karlsson, www.nonobtrusive.com
*/
function Dispatcher(){
	this.events=[];
}
Dispatcher.prototype.addEventlistener=function(event,callback){
	this.events[event] = this.events[event] || [];
	if ( this.events[event] ) {
		this.events[event].push(callback);
	}
}
Dispatcher.prototype.removeEventlistener=function(event,callback){
	if ( this.events[event] ) {
		var listeners = this.events[event];
		for ( var i = listeners.length-1; i>=0; --i ){
			if ( listeners[i] === callback ) {
				listeners.splice( i, 1 );
				return true;
			}
		}
	}
	return false;
}
Dispatcher.prototype.dispatch=function(event){
	if ( this.events[event] ) {
		var listeners = this.events[event], len = listeners.length;
		while ( len-- ) {
			listeners[len](this);	//callback with self
		}		
	}
}
 
 
/** Below is some test-code to verify the most basic functionality **/
function SomeClass(){
	Dispatcher.call(this);
}
SomeClass.prototype = new Dispatcher();
 
SomeClass.prototype.sendSomeEvent=function(){
	this.dispatch("test");
}
 
var foo = new SomeClass();
foo.addEventlistener( "test", function(){ alert("bah"); } )
foo.sendSomeEvent();