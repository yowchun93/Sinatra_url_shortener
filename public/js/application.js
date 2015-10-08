$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

 $('form#target').submit(function(event){
 	event.preventDefault();

 	var url = $(this).attr("action");
 	var serialize = $(this).serialize();
 	posting = $.post(url,serialize,function(data,status){
 		// We get json string in return 
 		console.log(data);
 		var obj = JSON.parse(data);
 		console.log(obj);
 		console.log(obj.url);
 		// console.log(data.toString());
 		//var short_url    = response.shortened_url;
 		$('.url').append("<li>obj.url</li>");
 	});
 });
 
	// var data = {"id":27,"url":"http://www.youtube.com/watch?v=g25QXnhVijQ","shortened_url":"UXgGvQ==","created_at":"2015-10-06T01:38:45.338Z","updated_at":"2015-10-06T01:38:45.338Z","clicks":0}
	// console.log(data.url);
	// console.log("data url" + data.url);

});
