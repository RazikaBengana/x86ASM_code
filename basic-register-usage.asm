; You may customize this and other start-up templates;
; The location of this template is c:\emu8086\inc\0_com_template.txt


org 100h ; définit le point de départ du programme à l'adresse 100h (format .com pour DOS)


mov ah, 30  ; préparation d'une opération avec la valeur 30 dans le registre AH
            ; cependant, cette instruction est écrasée par l'instruction suivante sans être utilisée
            ; en effet, on écrit simultanément dans AH et AL avec AX (dans l'instruction suivante)


mov ax, 0xffff ; on place la valeur 0xFFFF dans le registre AX (registres AH et AL)


mov al, 0x30 ; on place la valeur 0x30 dans le registre AL, écrasant la partie basse de AX définie juste avant


lodsb ; charge le byte pointé par le registre SI dans AL
      ; nécessite que DS:SI soit correctement initialisé avant cette instruction --> pas effectué ici
      ; DS devrait pointer vers le segment de mémoire contenant les données qu'on veut lire
      ; SI devrait être initialisé à l'offset (décalage) à l'intérieur du segment de données où commence la donnée à lire


mov bx, 0xffff ; on place la valeur 0xFFFF dans le registre BX


mov bh, 0x30 ; on place la valeur 0x30 dans le registre BH, écrasant la partie haute de BX définie juste avant


ret ; retour du sous-programme
    ; si c'est le point d'entrée d'un programme .COM, cela terminera le programme et retournera le contrôle à DOS



; ce code démontre :
;
; - les interactions entre les instructions et les registres
; - l'importance de l'ordre des instructions
; - comment les données sont manipulées et stockées au bas niveau