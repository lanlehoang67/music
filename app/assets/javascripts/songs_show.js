
 function initSinglePlayer1(song, song_counter)
  {

    var a = "<%= asset_path('miku.mp3') %>";
 var b =a.slice(0,8);
    if($(".jp-jplayer").length)
    {
      $(`#jplayer_${song_counter+1}`).jPlayer({

        ready: function () {
          $(this).jPlayer("setMedia", {
            title:"Better Days",
              artist:"Bensound",
              mp3: b+song
          });
        },
        play: function() { // To avoid multiple jPlayers playing together.
          $(this).jPlayer("pauseOthers");
        },
        swfPath: b+'jquery.jplayer.swf',
        supplied: "mp3",
        cssSelectorAncestor: `#jp_container_${song_counter+1}`,
        wmode: "window",
        globalVolume: false,
        useStateClassSkin: true,
        autoBlur: false,
        smoothPlayBar: true,
        keyEnabled: true,
        solution: 'html',
        preload: 'metadata',
        volume: 0.2,
        muted: false,
        backgroundColor: '#000000',
        errorAlerts: false,
        warningAlerts: false
      });
    }

  }
