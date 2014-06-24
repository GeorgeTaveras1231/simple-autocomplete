$(document).ready(function(){

  $('#search input[type="text"]').on('keyup', function( e ){
    var input = $(this).val(),
        JSONPath = '/names/' + input + '.json',
        $list = $('#list');

    $list.html('');
    if(!input)
      return; 

    $.getJSON(JSONPath, function( response ){
      response.forEach(function( obj ){
        var template = '<li>' + obj.name + '</li>';
        
        $list.append(template);
      });
    });

  });
});