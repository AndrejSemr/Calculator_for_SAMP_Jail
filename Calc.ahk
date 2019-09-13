#IfWinActive GTA:SA:MP
#NoEnv ;
SendMode Input ;
#Include %A_ScriptDir%
SetWorkingDir %A_ScriptDir% ;
#Include SAMP.ahk


;:?:/reload::
!7::
showGameText("Reload", 1000, 6)
Reload
return


F10 & 0::
pid := getIdByPed(getTargetPed())
if(pid!=-1 && pid!=""){
	playerName:=getPlayerNameById(pid)
	;//-----------------------------
	dialogInformation:= "{DCDCDC}Сумма залога игрока{B22222} " playerName " [" pid "]{DCDCDC}: `n{DCDCDC}Если вы выделили неверного игрока введите{B22222} N{DCDCDC} или {B22222}n{DCDCDC}"
	Showdialog("1", "{FFFAFA}Запись в залог", dialogInformation, "Ok")
	input, Payment, V, {Enter}
	Keywait, Enter, D
	sleep 300
	dialogInformation:=""
	addChatMessage("{B22222}[AHK]{00CD00} Скриптик сделал Сер Andrej Semr :P.")
	if(Payment="N" || Payment="n" || Payment="" )
	{
		addChatMessage("{B22222}[AHK]{00CD00} Вы {B22222}ОТМЕНИЛИ {00CD00}запись игрока.")
		return
	}
	else{
		;//-----------------------------
		FileAppend , %playerName%`t%Payment%`n, NickName(UDO).txt
		addChatMessage("{B22222}[AHK]{00CD00} Игрок {B22222}ЗАПИСАН{00CD00} в файл.")
		RPgame_UDO()
		Sleep 500
		Send,{F6}/unpunish{Space}
	}
}
else{
	addChatMessage("{B22222}[AHK]{00CD00} Игрок не выбран")
}
return

!F3::
lineNumber:=3
coutnOfWork:=0
while(lineNumber<7)
{
	lineWorkCount:=GetStrokNum(lineNumber)
	Sleep 200
	addChatMessage(lineWorkCount)
	Sleep 200
	lineNumber:=lineNumber+1
	coutnOfWork:=lineWorkCount+coutnOfWork
}
playerName:=getUsername()
str= {AA0044} [УДО] {FF6347} Andrej_Semr {32CD32}желает вам Удачного У.Д.О. Мистер {FF6347}%playeNname% {32CD32}^_^
addChatMessage(str)
str= {AA0044} [УДО] {32CD32} У заключенного {FF6347}%coutnOfWork% {32CD32}работ.
addChatMessage(str)
str=
Schot(coutnOfWork)
Sleep 500
SendChat("/time")
return


GetStrokNum(i){
	k:= getDialogLine(i)
	RegExMatch(k, "}\d+", vark)
	RegExMatch(vark, "\d+", send)
	return send
}

Schot(coutnOfWork){
	if(coutnOfWork>=500){
		addChatMessage("{AA0044} [УДО] {32CD32} Более 500 заданий - на усмотрение начальника тюрьмы, но не менее {AA0044}1.000.000$")
	}else if( (coutnOfWork>400)&&(coutnOfWork<=500) ){
		addChatMessage("{AA0044} [УДО] {32CD32} От 400 до 500 заданий - {FF6347}900.000$")
	}else if( (coutnOfWork>300)&&(coutnOfWork<=400) ){
		addChatMessage("{AA0044} [УДО] {32CD32} От 300 до 400 заданий - {FF6347}800.000$")
	}else if( (coutnOfWork>250)&&(coutnOfWork<=300) ){
		addChatMessage("{AA0044} [УДО] {32CD32} От 250 до 300 заданий - {FF6347}700.000$")
	}else if( (coutnOfWork>200)&&(coutnOfWork<=250) ){
		addChatMessage("{AA0044} [УДО] {32CD32} От 200 до 250 заданий - {FF6347}600.000$")
	}else if( (coutnOfWork>150)&&(coutnOfWork<=200) ){
		addChatMessage("{AA0044} [УДО] {32CD32} От 150 до 200 заданий - {FF6347}500.000$")
	}else if( (coutnOfWork>100)&&(coutnOfWork<=150) ){
		addChatMessage("{AA0044} [УДО] {32CD32} От 100 до 150 заданий - {FF6347}400.000$")
	}else if( (coutnOfWork>50)&&(coutnOfWork<=100) ){
		addChatMessage("{AA0044} [УДО] {32CD32}От 50 до 100 заданий - {FF6347}300.000$")
	}else{
		addChatMessage("{AA0044} [УДО] {32CD32} Менее 50 заданий - {FF6347}200.000$")
	}
	return
}


RPgame_UDO(){
	Sleep 500
	SendChat("/me зашел в базу заключенных, нашел дело заключенного")
	Sleep 2000
	SendChat("/me проверяет информацию о заключенном")
	Sleep 2000
	SendChat("/todo Что же.. Хорошо * оформляя освобождение заключенного")
}
