// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$().ready(function(){
    $(function() {
        $("input").watermark({
            placeholder: function() {
                return $(".formRow label[for=" + this.id + "]").hide().text();
            }
        });
    });
})