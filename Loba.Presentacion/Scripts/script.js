/* Mi JavaScript */
//Esperar a que cargue jQuery
$(document).ready(function () {
    //jQuery Cargado...
    $(window).scroll(function () {
        if (this.scrollY > 0) {
            $(".navbar.navbar-default.navbar-fixed-top").addClass("scroll-line-down");
        } else {
            $(".navbar.navbar-default.navbar-fixed-top").removeClass("scroll-line-down");
        }
    });
    $('#mostrarPassword').click(function () {
        var el = $("#Contrasena")[0];
        console.log(el);
        if (el.type == "text")
            el.type = ('password');
        else
            el.type = ('text');
    });
    $("#id_categoria").change(function () {
        var id = $("#id_categoria option:selected").val();
        $.ajax({
            url: "_SubCategorias_Question?select=" + id,
            context: document.body
        }).done(function (html) {
            $("#subcat_select").empty();
            $("#subcat_select").append(html);
        });

    });
    if ($("#id_categoria option") && $("#id_sub_categoria").length==0) {
        if ($("#id_categoria option").length > 0) {
            var id = $("#id_categoria option")[0].value;
            $.ajax({
                url: "_SubCategorias_Question?select=" + id,
                context: document.body
            }).done(function (html) {
                $("#subcat_select").empty();
                $("#subcat_select").append(html);
                console.log(html);
            });
        }
    }
    $("form[name='form-comentar']").submit(function (event) {
        //alert("Handler for .submit() called.");
        event.preventDefault();
        var data = {
            r_id: $(this).find("input[name='r_id']").val(),
            contenido: $(this).find("textarea[name='contenido']").val()
        }
        
        $(this).find("#messages-" + data.r_id).empty();
        var secction = $(this).find("#messages-" + data.r_id);
        secction.hide();
        
        $.ajax({
            dataType: "json",
            url: "/Pregunta/ComentarRespuesta",
            type: "POST",
            context: document.body,
            data: data,
            success: function (data) {
                if (data.comment == true) {
                    location.reload();
                } else {
                    secction.append('<div class="alert alert-danger"><p>Coloque algo por favor...</p></div>');
                    secction.show("fast", function () {
                        setTimeout(function () {
                            secction.hide("slow");
                        },3000);
                    });
                }
            }
        });
    });
    $("form[name='form-respuesta']").submit(function (event) {
        //alert("Handler for .submit() called.");
        event.preventDefault();
        var data = {
            Id: $(this).find("input[name='Id']").val(),
            Cuerpo: $(this).find("textarea[name='Cuerpo']").val()
        }
        $(this).find("#msgResp-" + data.Id).empty();
        console.log($(this).find("#msgResp-" + data.Id));
        var secction = $(this).find("#msgResp-" + data.Id);
        secction.hide();
        $.ajax({
            dataType: "json",
            url: "/Pregunta/Responder",
            type: "POST",
            context: document.body,
            data: data,
            success: function (data) {
                console.log(data);
                if (data.comment == true) {
                    location.reload();
                } else {
                    secction.append('<div class="alert alert-danger"><p>Coloque algo por favor...</p></div>');
                    secction.show("fast", function () {
                        setTimeout(function () {
                            secction.hide("slow");
                        }, 3000);
                    });
                }
            }
        });
    });
    $("form[name='form-edit-resp']").submit(function (event) {
        //alert("Handler for .submit() called.");
        event.preventDefault();
        var data = {
            Id: $(this).find("input[name='Id']").val(),
            Cuerpo: $(this).find("textarea[name='Cuerpo']").val()
        }
        $(this).find("#msgRespEdit-" + data.Id).empty();
        console.log(data);
        var secction = $(this).find("#msgRespEdit-" + data.Id);
        secction.hide();
        $.ajax({
            dataType: "json",
            url: "/Pregunta/EditarRespuesta",
            type: "POST",
            context: document.body,
            data: data,
            success: function (data) {
                console.log(data);
                if (data.comment == true) {
                    location.reload();
                } else {
                    secction.append('<div class="alert alert-danger"><p>Coloque algo por favor...</p></div>');
                    secction.show("fast", function () {
                        setTimeout(function () {
                            secction.hide("slow");
                        }, 3000);
                    });
                }
            }
        });
    });
    $(document).on("mouseleave", ".popover.fade", function () {
        $(".user").popover('hide');
        $(".user").popover('destroy');
    });
    $(".user").mouseleave(function () {
        if ($(".popover.fade").length == 1) {
            if ($(".popover.fade").is(':hover') == false) {
                $(".user").popover('hide');
                $(".user").popover('destroy');
            }
        } else {
            $(".popover.fade").each(function (index, element) {
                if ($(element).is(':hover') == false) {
                    $(".user").popover('hide');
                    $(".user").popover('destroy');
                }
            });
        }
    });
    $(".user").mouseenter(function () {
        var item = $(this);
        var id = $(this).attr("data-user-id");
        var data = {
            Id: id
        };
        $(item).popover({
            trigger: 'click',
            container: 'body',
            placement: 'right',
            title: '<strong>Cargando..</strong>',
            //content: html,
            html: true
        });
        $(item).popover('show');
        $.ajax({
            url: "/Perfil/Mini",
            data: data,
            context: document.body
        }).done(function (html) {
            $(item).popover('destroy');
            $(item).popover({
                trigger: 'click',
                container: 'body',
                placement: 'right',
                // title: '<strong>Usuario</strong>',
                content: html,
                html: true
            });
            $(item).popover('show');
        });
    });
});