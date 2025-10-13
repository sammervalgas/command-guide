Option Explicit
Randomize

Dim objShell, i, j, iterations
Set objShell = CreateObject("WScript.Shell")
iterations = 10

' --- Código Java (~1000 caracteres) ---
Dim javaCode
javaCode = "package com.marktudo.app;" & vbCrLf & _
"public class MarketService {" & vbCrLf & _
"    private String name;" & vbCrLf & _
"    private int value;" & vbCrLf & _
"    public MarketService(String name, int value) {" & vbCrLf & _
"        this.name = name;" & vbCrLf & _
"        this.value = value;" & vbCrLf & _
"    }" & vbCrLf & _
"    public void process() {" & vbCrLf & _
"        for (int i = 0; i < 10; i++) {" & vbCrLf & _
"            System.out.println(name + "" processing: "" + (value + i));" & vbCrLf & _
"        }" & vbCrLf & _
"    }" & vbCrLf & _
"    public static void main(String[] args) {" & vbCrLf & _
"        MarketService ms = new MarketService(""MarkTudo"", 100);" & vbCrLf & _
"        ms.process();" & vbCrLf & _
"    }" & vbCrLf & _
"}" & vbCrLf

' --- Abre o Bloco de Notas ---
objShell.Run "notepad", 1, False
WScript.Sleep 1000
objShell.AppActivate "Notepad"
WScript.Sleep 1000

' --- Loop principal: repete 10 vezes ---
For i = 1 To iterations
    objShell.AppActivate "Notepad"
    WScript.Sleep 500

    ' Digita caractere por caractere com pausa de 500 ms
    For j = 1 To Len(javaCode)
        Dim ch
        ch = Mid(javaCode, j, 1)
        
        ' Alguns caracteres precisam ser escapados no SendKeys
        Select Case ch
            Case "+"
                ch = "{+}"
            Case "^"
                ch = "{^}"
            Case "%"
                ch = "{%}"
            Case "~"
                ch = "{~}"
            Case "("
                ch = "("
            Case ")"
                ch = ")"
            Case "{"
                ch = "{{}"
            Case "}"
                ch = "{}}"
            Case vbCr
                ch = "{ENTER}"
            Case vbLf
                ch = ""
        End Select
        
        objShell.SendKeys ch
        WScript.Sleep 500  ' <<< PAUSA DE 500 ms ENTRE CADA TECLA
    Next

    ' --- Limpa o texto ---
    WScript.Sleep 1000
    objShell.SendKeys "^a"
    WScript.Sleep 200
    objShell.SendKeys "{DEL}"
    WScript.Sleep 1000
Next

' --- Fecha o Notepad (sem salvar) ---
objShell.AppActivate "Notepad"
WScript.Sleep 500
objShell.SendKeys "%{F4}"  ' Alt + F4
WScript.Sleep 500
objShell.SendKeys "n"      ' "Não salvar" em PT-BR

WScript.Quit
