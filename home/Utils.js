var iconPath = "/home/slimani/QTPROJECT/CarIVI/images/"
var newIndex
var newpath
var volume

function milliSecondsToString(milliSeconds){
    milliSeconds = milliSeconds>0?milliSeconds:0
    var timeInSeconds = Math.floor(milliSeconds/1000)
    var minutes = Math.floor(timeInSeconds/60)
    var minutesString = minutes<10?"0"+ minutes:minutes
    var seconds = Math.floor(timeInSeconds%60)
    var secondsString = seconds<10?"0"+seconds:seconds

    return minutesString+":"+secondsString
}

function milliSecondsToMinutes(milliSeconds){
    milliSeconds = milliSeconds>0?milliSeconds:0
    var timeInSeconds = Math.floor(milliSeconds/1000)
    var minutes = Math.floor(timeInSeconds/60)
    var minutesString = minutes<10?"0"+ minutes:minutes
    var seconds = Math.floor(timeInSeconds%60)
    var secondsString = seconds<10?"0"+seconds:seconds

    return minutesString
}

function test(chaine){
    if(chaine.lastIndexOf('/')>1)
        return true
    else
        return false
}

function retour(path){
    var pointer = path.lastIndexOf('/')
    var res = path.substring(0,pointer)
    return res
}

function forwar(){
    return usb.get(path,"filePath")
}

function getName(str){
    //var l = str.toStdString()//                        console.log(n)
    var n = str.lastIndexOf('/') + 1
    var m= str.length
    return str.substring(n,m)
}

function rewind(){
    return usb.get(path,"filePath")
}
