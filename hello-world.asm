; You may customize this and other start-up templates;
; The location of this template is c:\emu8086\inc\0_com_template.txt


; org 100h --> détermine le point de départ du code en mémoire, spécifique aux programmes .COM DOS
org 100h


; jmp main --> effectue un saut à l'étiquette 'main', contournant la déclaration de données initiale
jmp main


; message: db 'Hello World!', 0 --> déclare une chaîne de caractères terminée par un zéro, utilisée comme message
message: db 'Hello World!', 0


; print: --> marque le début de la routine d'affichage du message
print:
    ; mov ah, 0eh --> prépare la fonction d'affichage de caractère en mode texte de l'interruption 10h
    mov ah, 0eh


; ._loop: --> marque le début de la boucle qui traite chaque caractère du message
._loop:
    ; lodsb --> charge le caractère suivant du message dans AL et incrémente SI
    lodsb
    ; cmp al, 0 --> compare le caractère chargé avec 0 pour vérifier la fin de la chaîne
    cmp al, 0
    ; je .done --> saute à l'étiquette '.done' si le caractère zéro est trouvé, indiquant la fin du message
    je .done
    ; int 10h --> appelle l'interruption 10h pour afficher le caractère contenu dans AL
    int 10h
    ; jmp ._loop --> saute à l'étiquette '._loop' pour continuer la boucle
    jmp ._loop


; .done: --> marque la fin de la routine d'affichage, juste avant de retourner
.done:
    ; ret --> retourne de la routine d'affichage au point d'appel
    ret


; main: --> marque le début du point d'entrée principal du programme
main:
    ; mov si, message --> initialise SI avec l'adresse du message à afficher
    mov si, message
    ; call print --> appelle la routine d'affichage pour afficher le message
    call print
    ; ret --> termine le programme et retourne le contrôle au système d'exploitation
    ret