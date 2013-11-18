$(function(){
    if($('#clan_member_changes').length > 0){

        cfg.changesLoaded = 0;
        loadMemberChanges();


        $('#clan_member_changes_wrapper').scroll(function() {
            if($(this).scrollLeft() + $(this).width() == $('#clan_member_changes').width()){
                loadMemberChanges();
            }
        });

    }
});

function loadMemberChanges() {
    $.get(
        'http://clanapi.wotcs.com/clans/'+cfg.clan_id+'/changes/'+cfg.changesLoaded,
        {previous: true, next: true},
        function(data) {
            if(cfg.changesLoaded === 0){
                $('#clan_member_changes').css('width',data.changes.length*200+100+'px');
            }else{
                $('#clan_member_changes').css('width',data.changes.length*200+$('#clan_member_changes').width()+'px');
            }
            cfg.changesLoaded++;
            for(var i in data.changes){
                addChange(data.changes[i]);
            }
        },
        'json'
    );
}

function addChange(change){
    var html = '<a class="'+(change.change > 0 ? 'joined' : 'left')+'" href="/players/'+change.player_id+'">'+(change.name || '???');
    html += '<span class="datetime">'+change.updated_at+'</span></a>'
    if(change.previous){
        var prevName = change.previous.clan ? '['+change.previous.clan.tag+'] '+change.previous.clan.name : '???';
        html = '<a class="previous" href="/clans/'+change.previous.clan_id+'">'+prevName+'</a>' + html;
    }
    if(change.next){
        var prevName = change.next.clan ? '['+change.next.clan.tag+'] '+change.next.clan.name : '???';
        html += '<a class="next" href="/clans/'+change.next.clan_id+'">'+prevName+'</a>';
    }
    html = '<div class="member-change pull-left">'+html+'</div>';
    $('#clan_member_changes').append(html);
}