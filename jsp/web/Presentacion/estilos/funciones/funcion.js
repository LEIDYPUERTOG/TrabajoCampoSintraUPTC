function ventana(){

    $(".inline").colorbox({inline:true, width:"26%", closeButton:true});
    $(".callbacks").colorbox({
        onOpen:function(){ alert('onOpen: colorbox is about to open'); },
        onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
        onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
        onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
        onClosed:function(){ alert('onClosed: colorbox has completely closed'); },
    });
    $(this).next('#login-content2').slideToggle();
    $(this).ToggleClass('active');

};


function ventana2(){

    $(".inline").colorbox({inline:true, width:"30%", closeButton:true});
    $(".callbacks").colorbox({
        onOpen:function(){ alert('onOpen: colorbox is about to open'); },
        onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
        onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
        onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
        onClosed:function(){ alert('onClosed: colorbox has completely closed'); },
    });
    $(this).next('#login-content4').slideToggle();
    $(this).ToggleClass('active');
};

function ventana3(){

    $(".inline").colorbox({inline:true, width:"23%", closeButton:true});
    $(".callbacks").colorbox({
        onOpen:function(){ alert('onOpen: colorbox is about to open'); },
        onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
        onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
        onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
        onClosed:function(){ alert('onClosed: colorbox has completely closed'); },
    });
    $(this).next('#login-contentCancelar').slideToggle();
    $(this).ToggleClass('active');
};

function ventana4(){

    $(".inline").colorbox({inline:true, width:"23%", closeButton:true});
    $(".callbacks").colorbox({
        onOpen:function(){ alert('onOpen: colorbox is about to open'); },
        onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
        onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
        onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
        onClosed:function(){ alert('onClosed: colorbox has completely closed'); },
    });
    $(this).next('#login-contentRechazar').slideToggle();
    $(this).ToggleClass('active');
};