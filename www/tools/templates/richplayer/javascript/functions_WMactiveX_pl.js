var player_video = null ;
var timerStyle ;
var current_playlist ;
var texte_action = "";
var TimerDirect = null;
var isDirect = false;
function redim()
{             
    ok=0;
    if (document.all) {
        document.body.scrollLeft=2;
        if ((document.body.scrollLeft>0) && (ww<(screen.width-step))) {
            ww+=step;
            self.window.resizeTo(ww,hh);
            ok=1;
        }
        document.body.scrollTop=2;
        if (document.body.scrollTop>0) {
            hh+=step;
            self.window.resizeTo(ww,hh);
            ok=1;
        }
        if(ok==1){setTimeout('redim();',10);}
    }
}
function redim_gecko()
{
    if (document.width>ww ||document.height>hh) {
        ww=(document.width>ww) ? (document.width+10):ww;
        hh=(document.height>hh) ? (document.height+10):hh;
        self.window.resizeTo(ww,hh);
        setTimeout('redim_gecko();',10);
    }
}
function setTimer()
{
    window.clearTimeout(timerStyle);
    timerStyle = window.setTimeout("alterStyle()",150);
}
function displayState(texte){
    if(document.getElementById("state_player_wm"))
    document.getElementById("state_player_wm").innerHTML = texte;
}
function startPlayback()
{
    try{
        player_video.controls.play();
        alterStyle();
        return true;
    }
    catch(e){return false}
}
function getTc()
{
    try{
        var tc = player_video.controls.currentPosition;
        return tc;
    }
    catch(e){}
}
function setTc(TC)
{
    try{
        player_video.controls.currentPosition = TC;
    }catch(e){
    }
}
function stopPlayBack()
{
    try{
        //unStyleAll('nrunning');
        //window.clearTimeout(timerStyle);
        player_video.controls.stop();
        //unStyleAll('nrunning');
    }catch(e){}
}
function pausePlayBack()
{
    try{player_video.controls.pause();}
    catch(e){
    }
}

function previousFileInPlayBack()
{
    try{
        player_video.controls.previous();}
        catch(e){
        }
}
function nextFileInPlayBack()
{
    try{
        player_video.controls.next();
    }catch(e){
    }
}
function mutePlayer(state)
{
    try{
        player_video.settings.mute = state;
    }catch(e){
    }
}
function setVolumePlayer(Volume)
{
    try{
        player_video.settings.volume = Volume;
    }catch(e){
    }
}
function fastForward()
{
    try{
        if (player_video.controls.isAvailable('FastForward'))
        player_video.controls.fastForward();
    }catch(e){
    }
}
function getPlayingPas()
{
    try{
        var name = player_video.currentMedia.name;
    }
    catch(e){
    }
    return name;
}
function setLangueById(id) {
       
    try{
      player_video.controls.currentAudioLanguageIndex = id;    
    }catch(e){
    }
}
function setLangueByLCID(lcid) {

    try{
        player_video.controls.currentAudioLanguage = lcid;    
    }catch(e){
    }
}


function setTimePosition(sec)
{
    try{
        player_video.controls.currentPosition = sec;
    }catch(e){

    }
}
function PlayerState()
{
    try{
        var state = (player_video.playState);
        switch (state){
            case 0: texte_action = "0";break;
            case 1: texte_action = "1";break;
            case 2: texte_action = "2";break;
            case 3: texte_action = "3";break;
            case 4: texte_action = "4";break;
            case 5: texte_action = "5";break;
            case 6: texte_action = "6";break;
            case 7: texte_action = "7";break;
            case 8: texte_action = "8";break;
            case 9: texte_action = "9";break;
            default :;
        }
        displayState(texte_action);
        return state;
    }
    catch(e){}
}
var state = false;
function PlayAt(pas,sec)
{
	
    //document.getElementById('PlayerWmEmbeded').controls.stop();
    try{
        media = document.getElementById('PlayerWmEmbeded').currentPlaylist.item(pas);
        var name = media.name;
        if(document.getElementById('tag-' + name + '-' + sec)){
            //unStyleAll('nrunning');
            styleDiv('tag-' + name + '-' + sec,'running');
        }
        if(media.name != document.getElementById('PlayerWmEmbeded').currentMedia.name ){
            document.getElementById('PlayerWmEmbeded').controls.playItem(media);
        }
        else
        {
            document.getElementById('PlayerWmEmbeded').controls.play();
        }
        document.getElementById('PlayerWmEmbeded').controls.play();
        setTimePosition(sec);
        alterStyle();
    }
    catch(e){
        player_video.URL = UrlPlaylist;
        player_video.controls.play();
        setTimeout("PlayAt("+pas+","+sec+")",1000);
    }
}
function init(){

    var player;
    var plugin;
    var hasActiveX=false;
    try{
        if(window.ActiveXObject)
        {
            hasActiveX = true;
            player = new ActiveXObject("WMPlayer.OCX.7");
            AllIsGood = true;
        }
        else if (window.GeckoActiveXObject)
        {
            hasActiveX = true;
            AllIsGood = true;
            player = new GeckoActiveXObject("WMPlayer.OCX.7");
        }
    }
    catch(oError) { }
    try{
        if(navigator.mimeTypes)
        {
            plugin = navigator.mimeTypes['application/x-mplayer2'].enabledPlugin;
            AllIsGood = true;
        }
    }
    catch (oError) {}
    setTimer();
    var message = "<font class='" + (hasActiveX ? "plGood" : "plFalse") + "'>Your browser "+ (hasActiveX ? "does" : " does not") +" support ActiveX. \n</font><br />";
    message += "<font class='" + (player ? "plGood" : "plFalse") + "'>The WMP ActiveX control is"+ ( player ? "" : " not") +" installed. \n</font><br />";
    message += "<font class='" + (plugin ? "plGood" : "plFalse") + "'>The WMP Plugin "+ (plugin ? "is" : "is not") +" installed. \n</font><br />";

    if(document.getElementById("advert") )
    {
        if(!hasActiveX || !player ){
             try{
                    noPlugin();
            }
              catch (oError) {}    
        }
    }
    player_video = document.getElementById('PlayerWmEmbeded');
    player_video.enableContextMenu =true;
    player_video.ShowStatusBar=true;
    setTimer();
    startPlayback();
    stopPlayBack();
}
function alterStyle()
{
    var state = PlayerState();
    // playing
    if(state==3){
        if(document.getElementById( 'PlayerWmEmbeded' )){
            var running = getTc();
            //document.getElementById("debug").innerHTML += "" + running + "";    
            var name = getPlayingPas();
            current_name = name;
            running = Math.floor(running);
            //document.getElementById("debug").innerHTML += " = " + running + "<br/>";
            if(running == 1) running = 0;
            tagname = 'tag-' + name + '-' + running;
            if(document.getElementById(tagname)){
                ///$.log(tagname);
                styleDiv(tagname,'running',name);
            }
        }
    }
    setTimer();               
}
function unStyleAll(unStyle)
{
    for (i=0;i<listdiv.length;i++){
        document.getElementById(listdiv[i]).className = unStyle;
    }
}
function styleDiv(divToStyle,unStyle,name)
{
	
        try{
            actionOnDiv(divToStyle,name);
        }
        catch(exception){}

}
function pausecomp(millis)
{
    var date = new Date();
    var curDate = null;

    do { curDate = new Date(); }
    while(curDate-date < millis);
}