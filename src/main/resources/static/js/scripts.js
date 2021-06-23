$(function()    {
    $('tr').click(function(e)   {
        //ловим элемент, по которому кликнули
        var t = e.target || e.srcElement;
        //получаем название тега
        var elm_name = t.tagName.toLowerCase();
        //если это инпут - ничего не делаем
        if(elm_name == 'input') {return false;}
        var val = $(this).html();
        var code = '<input type="text" id="edit" value="'+val+'" />';
        $(this).empty().append(code);
        $('#edit').focus();
        $('#edit').blur(function()  {
            var val = $(this).val();
            $(this).parent().empty().html(val);
        });
    });
});

$(window).keydown(function(event){
    //ловим событие нажатия клавиши
    if(event.keyCode == 13) {   //если это Enter
        $('#edit').blur();  //снимаем фокус с поля ввода
    }
});