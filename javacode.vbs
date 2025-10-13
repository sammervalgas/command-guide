' marktudo_typing.vbs
' Abre o Notepad, escreve uma classe Java (~1000 caracteres) em blocos com pausas humanizadas,
' apaga e repete 10 vezes, depois fecha o Notepad sem salvar.

Option Explicit

Randomize

Dim objShell, fso, tempFolder, tempFile, i, iterations
Set objShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
tempFolder = objShell.ExpandEnvironmentStrings("%TEMP%")
iterations = 10

' Texto da classe Java (~1000 caracteres)
Dim javaClass
javaClass = ""
javaClass = javaClass & "package com.marktudo.app;" & vbCrLf & vbCrLf
javaClass = javaClass & "/** Classe de exemplo gerada pelo script para simular digitação. */" & vbCrLf
javaClass = javaClass & "public class ExampleService {" & vbCrLf
javaClass = javaClass & "    private final String name;" & vbCrLf & vbCrLf
javaClass = javaClass & "    public ExampleService(String name) {" & vbCrLf
javaClass = javaClass & "        this.name = name;" & vbCrLf
javaClass = javaClass & "    }" & vbCrLf & vbCrLf
javaClass = javaClass & "    public String greet(int times) {" & vbCrLf
javaClass = javaClass & "        StringBuilder sb = new StringBuilder();" & vbCrLf
javaClass = javaClass & "        for (int i = 0; i < times; i++) {" & vbCrLf
javaClass = javaClass & "            sb.append(\"Hello, \").append(name).append(\"!\\n\");" & vbCrLf
javaClass = javaClass & "        }" & vbCrLf
javaClass = javaClass & "        return sb.toString();" & vbCrLf
javaClass = javaClass & "    }" & vbCrLf & vbCrLf
javaClass = javaClass & "    // Método utilitário de exemplo" & vbCrLf
javaClass = javaClass & "    public static int sum(int... nums) {" & vbCrLf
javaClass = javaClass & "        int total = 0;" & vbCrLf
javaClass = javaClass & "        for (int n : nums) total += n;" & vbCrLf
javaClass = javaClass & "        return total;" & vbCrLf
javaClass = javaClass & "    }" & vbCrLf & vbCrLf
javaClass = javaClass & "    @Override" & vbCrLf
javaClass = javaClass & "    public String toString() {" & vbCrLf
javaClass = javaClass & "        return \"ExampleService{name='\" + name + \"'}\";" & vbCrLf
javaClass = javaClass & "    }" & vbCrLf
javaClass = javaClass & "}" & vbCrLf

' Divide o texto em blocos para colar em partes (humanizado)
Function SplitIntoChunks(text, chunkSize)
    Dim arr(), pos, n
    pos = 1
    n = 0
    ReDim arr(0)
    Do While pos <= Len(text)
        n = n + 1
        ReDim Preserve arr(n-1)
        arr(n-1) = Mid(text, pos, chunkSize)
        pos = pos + chunkSize
    Loop
    SplitIntoChunks = arr
End Function

' Escreve dado texto num arquivo temporário e coloca no clipboard via clip.exe
Sub PutTextToClipboard(txt)
    Dim tpath, tf
    tpath = tempFolder & "\" & "marktudo_tmp_" & Replace(CStr(Timer), ".", "_") & ".txt"
    Set tf = fso.CreateTextFile(tpath, True, False) ' ASCII
    tf.Write txt
    tf.Close
    ' Usa clip para enviar o conteúdo do arquivo para a área de transferência
    objShell.Run "cmd /c type """ & tpath & """ | clip", 0, True
    ' opcional: apagar o arquivo temporário
    On Error Resume Next
    fso.DeleteFile tpath, True
    On Error GoTo 0
End Sub

' Pausa aleatória entre min e max (ms)
Sub RandomSleep(minMs, maxMs)
    Dim r
    r = Int((maxMs - minMs + 1) * Rnd + minMs)
    WScript.Sleep r
End Sub

' --- Início do processo ---
' Abre o Notepad (sem aguardar fechar)
objShell.Run "notepad", 1, False

' Espera até que o Notepad esteja ativo (máx ~10s)
Dim ready, tryCount
ready = False
tryCount = 0
Do While Not ready And tryCount < 100
    On Error Resume Next
    ready = objShell.AppActivate("Sem Título - Bloco de Notas") Or objShell.AppActivate("Untitled - Notepad")
    On Error GoTo 0
    If Not ready Then
        WScript.Sleep 100
        tryCount = tryCount + 1
    End If
Loop

If Not ready Then
    ' Tentar ativar qualquer janela do Notepad
    objShell.AppActivate("Notepad")
    WScript.Sleep 300
End If

' Prepara os blocos (tamanho de bloco ajustável; 80-120 funciona bem)
Dim chunks, chunkSize
chunkSize = 90
chunks = SplitIntoChunks(javaClass, chunkSize)

Dim runIndex, j
For runIndex = 1 To iterations
    ' Garante que o Notepad está em foco
    objShell.AppActivate("Notepad")
    WScript.Sleep 150

    ' Para cada bloco: colocar no clipboard e colar, com pequenas pausas aleatórias
    For j = 0 To UBound(chunks)
        PutTextToClipboard chunks(j)
        ' cola (Ctrl+V)
        objShell.SendKeys "^v"
        ' pausa humanizada entre 150ms e 600ms
        RandomSleep 150, 600
    Next

    ' Pequena pausa ao concluir o texto
    WScript.Sleep 500

    ' Seleciona tudo e deleta (Ctrl+A, Del)
    objShell.SendKeys "^a"
    WScript.Sleep 120
    objShell.SendKeys "{DEL}"
    WScript.Sleep 400

    ' Opcional: pequena pausa entre repetições
    RandomSleep 500, 1200
Next

' Fecha o Notepad e descarta alterações (Alt+F4, depois "n" para "Não salvar")
objShell.AppActivate("Notepad")
WScript.Sleep 200
objShell.SendKeys "%{F4}"  ' Alt+F4
WScript.Sleep 300
' Em português, botão "Não" normalmente pode ser acionado com "n" (ou setas/Tab + Enter).
' Vamos enviar "n" para responder "Não salvar".
objShell.SendKeys "n"

' Encerra o script
WScript.Quit
