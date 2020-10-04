;))))))))))))))))))))))))))))))))))))))))))))))))))))
; LEO ALEXANDER HERNANDEZ RAMIREZ    7B
; Display 7 segmentos
;))))))))))))))))))))))))))))))))))))))))))))))))))))
PROCESSOR 16F887
#include <xc.inc>
;////////////////////////////////////////////////////
CONFIG FOSC=INTRC_NOCLKOUT
CONFIG WDTE=OFF
CONFIG PWRTE=ON
CONFIG MCLRE=OFF
CONFIG CP=OFF
CONFIG CPD=OFF
CONFIG BOREN=OFF
CONFIG IESO=OFF
CONFIG FCMEN=ON
CONFIG DEBUG=ON

CONFIG BOR4V=BOR40V
CONFIG WRT=OFF
;/////////////////////////////////////////////////////////
PSECT udata
reg3:
    DS 1
reg2:
    DS 1
reg1:
    DS 1
;////////////////////////////////////////////////////////
PSECT resetVec,class=CODE,delta=2
resetVec:
PAGESEL numeros
goto numeros
;/////////////////////////////////////////////////////////
PSECT code
retardo:    
MOVLW    50       ; W se carga con el número  (Comienza la llamada)
MOVWF    reg3          ; y se pasa a reg3
externo:   
MOVLW     50        ; W se carga con el número 
MOVWF    reg2          ; y se pasa a reg2
mitad:    
MOVLW    65       ; W se carga con el número 
MOVWF    reg1          ; y se pasa a reg1
interno:    
DECFSZ   reg1,1       ; Le resta una unidad a reg1
GOTO     interno       ; sigue decrementando hasta que reg1 llegue a 0
DECFSZ   reg2,1       ; Le resta una unidad a reg2 cuando reg1 llegue a 0
GOTO        mitad         ; vuelve a cargar reg1 y se repite la rutina interna
DECFSZ   reg3,1       ; Le resto una unidad a reg3 cuando reg2 llegue a 0
GOTO        externo      ; vuelve a cargar reg2 y reg1, se repite la rutina de la mitad
RETURN                      ; Termina la llamada y regresa
		
limpieza:
    BANKSEL ANSEL
    clrf ANSEL
    BANKSEL PORTA
    clrf PORTA
    BANKSEL TRISA
    clrf TRISA
    return
num0:
    BANKSEL PORTA
    movlw 0b11111100
    movwf PORTA
   return
num1:
    BANKSEL PORTA
    movlw 0b01100000
    movwf PORTA
   return   
num2:
    BANKSEL PORTA
    movlw 0b11011010
    movwf PORTA
   return  
num3:
    BANKSEL PORTA
    movlw 0b11110010
    movwf PORTA
   return
num4:
    BANKSEL PORTA
    movlw 0b01100110
    movwf PORTA
   return
num5:
    BANKSEL PORTA
    movlw 0b10110110
    movwf PORTA
   return
num6:
    BANKSEL PORTA
    movlw 0b10111110
    movwf PORTA
   return
num7:
    BANKSEL PORTA
    movlw 0b11100000
    movwf PORTA
   return
num8:
    BANKSEL PORTA
    movlw 0b11111110
    movwf PORTA
   return
num9:
    BANKSEL PORTA
    movlw 0b11100110
    movwf PORTA
   return
numeros:
   call limpieza
   call num0
   call retardo
   call limpieza
   call num1
   call retardo
   call limpieza
   call num2
   call retardo
   call limpieza
   call num3
   call retardo
   call limpieza
   call num4
   call retardo
   call limpieza
   call num5
   call retardo
   call limpieza
   call num6
   call retardo
   call limpieza
   call num7
   call retardo
   call limpieza
   call num8
   call retardo
   call limpieza
   call num9
   call retardo
   call limpieza
    END


