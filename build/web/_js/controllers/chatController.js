var timerId4EmojiScale = -1;

$("#txtMessage").keydown(function (event) {
    if (!event.shiftKey && event.keyCode === 13) {
        event.preventDefault();
    }
});

$("#spn-emoji").click(function () {
    $("#div-emoji-container").css("display", "initial");
    var top = $("#frmClient").offset().top - $("#div-emoji-container").height() - 15;
    var left = $("#spn-emoji").offset().left + 4;
    $("#div-emoji-container").css("top", top + "px");
    $("#div-emoji-container").css("left", left + "px");
});

$(window).resize(function () {
    $("#div-emoji-container").css("display", "none");
});

$(".emoji").mousedown(function (e) {
    var bImage = $(e.target).css('background-image');
    bImage = (bImage.substring(5, bImage.length - 2));
    var element = $("#txtMessage").append('<img src="' + bImage + '" height="14">');
    timerId4EmojiScale = setInterval(function (e) {
        var height = $("#txtMessage img:last-child").height();
        height += 10;
        if (height > 44) {
            clearInterval(timerId4EmojiScale);
        } else {
            $("#txtMessage img:last-child").css("height", height + "px");
        }   
    }, 100);


});

$(".emoji").mouseup(function (e) {
    clearInterval(timerId4EmojiScale);
});

$(document).click(function (e) {
    if (!$(e.target).is("#spn-emoji,#spn-emoji *") && !$(e.target).is("#div-emoji-container,#div-emoji-container *")) {
        $("#div-emoji-container").css("display", "none");
    }
});



$(document).ready(function (){
$("#spn-send").click(function () {
         alert(document.getElementById("idhid").value);
        var formData=$("#txtMessage").html();
        
        var id =document.getElementById("idhid").value;
        
        $.ajax("http://localhost:40690/PublicChat/hashMap.jsp?txtid="+id,{
            contentType: 'application/x-www-form-urlencoded',
            data:{
                txtMessage:formData,
                txtid:id
        },
            dataType: 'json',
            method:'POST'                       
        }).done(function (json) {
            //alert(json.result);       
        });
        
    });
    
    });
    
    $(window).load(function () {
    $('#myModal').modal('show');
});

$('#myModal').modal({
    backdrop: 'static',
    keyboard: false
});