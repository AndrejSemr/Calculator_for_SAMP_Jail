#IfWinActive GTA:SA:MP 
#NoEnv ; 
SendMode Input ;
#Include %A_ScriptDir% 
SetWorkingDir %A_ScriptDir% ;
#Include SAMP.ahk

:?:/reload:: 
showGameText("Reload", 1000, 6)
Reload
return


!F3::
a:=GetStrokNum1()
b:=GetStrokNum2()
c:=GetStrokNum3()
d:=GetStrokNum4()
	addChatMessage("{32CD32} Andrej Semr ������ ��� �������� ��������� ^_^")
	Sleep, 500
	addChatMessage1(a)
	Showdialog("1", "{FFFAFA}�������?", "������:", "Ok")
	input, rabotijasik, V, {Enter}
	Keywait, Enter, D
	sleep 300
	if(rabotijasik<0 || rabotijasik=""){
		return
	}
	addChatMessage2(b)
	Showdialog("1", "{FFFAFA}�������?", "���:", "Ok")
	input, rabotieda, V, {Enter}
	Keywait, Enter, D
	sleep 300
	if(rabotieda<0 || rabotieda=""){
		return
	}
	addChatMessage3(c)
	Showdialog("1", "{FFFAFA}�������?", "������:", "Ok")
	input, rabotiodezda, V, {Enter}
	Keywait, Enter, D
	sleep 300
	if(rabotiodezda<0 || rabotiodezda=""){
		return
	}
	addChatMessage4(d)
	Showdialog("1", "{FFFAFA}�������?", "������:", "Ok")
	input, rabotimusor, V, {Enter}
	Keywait, Enter, D
	sleep 300
	if(rabotimusor<0 || rabotimusor=""){
		return
	}
	otv:=(rabotijasik)+(rabotieda)+(rabotiodezda)+(rabotimusor)
	Schot(otv)
return

GetStrokNum1(){
k:= getDialogLine(3)
k:= SubStr(k,13,19)
return k
}
GetStrokNum2(){
k:= getDialogLine(4)
k:= SubStr(k,15,18)
return k
}
GetStrokNum3(){
k:= getDialogLine(5)
k:= SubStr(k,15,18)
return k
}
GetStrokNum4(){
k:= getDialogLine(6)
k:= SubStr(k,31,19)
return k
}

Schot(otv){
	OtvetRezult(otv)
	if(otv>=500){
		addChatMessage("{32CD32} ����� 500 ������� - �� ���������� ���������� ������, �� �� ����� {32CD32}1.000.000$")
	}else if( (otv>400)&&(otv<=500) ){
		addChatMessage("{32CD32} �� 400 �� 500 ������� - {32CD32}900.000$")
	}else if( (otv>300)&&(otv<=400) ){
		addChatMessage("{32CD32} �� 300 �� 400 ������� - {32CD32}800.000$")
	}else if( (otv>250)&&(otv<=300) ){
		addChatMessage("{32CD32} �� 250 �� 300 ������� - {32CD32}700.000$")
	}else if( (otv>200)&&(otv<=250) ){
		addChatMessage("{32CD32} �� 200 �� 250 ������� - {32CD32}600.000$")
	}else if( (otv>150)&&(otv<=200) ){
		addChatMessage("{32CD32} �� 150 �� 200 ������� - {32CD32}500.000$")
	}else if( (otv>100)&&(otv<=150) ){
		addChatMessage("{32CD32} �� 100 �� 150 ������� - {32CD32}400.000$")
	}else if( (otv>50)&&(otv<=100) ){
		addChatMessage("{32CD32}�� 50 �� 100 ������� - {32CD32}300.000$")
	}else{
		addChatMessage("{32CD32} ����� 50 ������� - {32CD32}200.000$")
	}
	return

}
OtvetRezult(otv){
	addChatMessage("{32CD32}=====================================")
	wText := "" "{32CD32} {32CD32} � ������ ������: {32CD32}" otv " "

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}

addChatMessage1(a) {
    wText := "" "{32CD32} � ������ ������ � ������ " a "{32CD32} ������."

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}
addChatMessage2(b){
    wText := "" "{32CD32} � ������ ������ ������ ���� ����������� " b "{32CD32} ���."

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}

addChatMessage3(c) {
    wText := "" "{32CD32} � ������ ������ ������ ���� ��������� " c " {32CD32}������."

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}

addChatMessage4(d) {
    wText := "" "{32CD32} � ������ ������ ������ ���� ������� " d "{32CD32} ������."

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}
