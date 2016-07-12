//Bootstrap-popover
//鼠标经过弹出框
$(function(){
        $("[rel=popover]").popover({
            trigger:'manual', //触发方式
            placement : 'left', //placement of the popover. also can use top, bottom, left or right
            html: 'true', //needed to show html of course
            animation: true
        }).on("mouseenter", function () {
                    var _this = this;
                    $(this).popover("show");
                    $(this).siblings(".popover").on("mouseleave", function () {
                        $(_this).popover('hide');
                    });
                }).on("mouseleave", function () {
                    var _this = this;
                    setTimeout(function () {
                        if (!$(".popover:hover").length) {
                            $(_this).popover("hide")
                        }
                    }, 100);
                });
    });