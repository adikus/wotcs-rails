$(function(){

    $('.js-region ul a').click(function(){
        var $parent = $(this).parents('.js-region');
        $parent.find('.value').html($(this).html());
        $parent.find('li').removeClass('active');
        $(this).parent().addClass('active');
        $(this).parent().click();
        $(this).parents('form').find('[id$="region"]').val($(this).data('region'));
        return false;
    });

});

