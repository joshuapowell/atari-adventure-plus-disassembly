LDA  VSYNC   
STA $00

LDA  VBLANK  
STA $01                                                                                                     

LDA  WSYNC   
STA $02                                                                                                     

LDA  RSYNC   
STA $03                                                                                                     

LDA  NUSIZ0  
STA $04                                                                                                     

LDA  NUSIZ1  
STA $05                                                                                                     

LDA  COLUP0  
STA $06                                                                                                     

LDA  COLUP1  
STA $07                                                                                                     

LDA  COLUPF  
STA $08                                                                                                     

LDA  COLUBK  
STA $09                                                                                                     

LDA  CTRLPF  
STA $0A                                                                                                     

LDA  PF0     
STA $0D                                                                                                     

LDA  PF1     
STA $0E                                                                                                     

LDA  PF2     
STA $0F                                                                                                     

LDA  RESP0   
STA $10                                                                                                     

LDA  AUDC0   
STA $15                                                                                                     

LDA  AUDF0   
STA $17                                                                                                     

LDA  AUDV0   
STA $19                                                                                                     

LDA  AUDV1   
STA $1A                                                                                                     

LDA  GRP0    
STA $1B                                                                                                     

LDA  GRP1    
STA $1C                                                                                                     

LDA  ENAM0   
STA $1D                                                                                                     

LDA  ENAM1   
STA $1E                                                                                                     

LDA  ENABL   
STA $1F                                                                                                     

LDA  HMP0    
STA $20                                                                                                     

LDA  VDEL01  
STA $26                                                                                                     

LDA  HMOVE   
STA $2A                                                                                                     

LDA  HMCLR   
STA $2B                                                                                                     

LDA  CXCLR   
STA $2C                                                                                                     

LDA  CXP0FB  
STA $32                                                                                                     

LDA  CXP1FB  
STA $33                                                                                                     

LDA  CXM0FB  
STA $34                                                                                                     

LDA  CXM1FB  
STA $35                                                                                                     

LDA  CXBLPF  
STA $36                                                                                                     

LDA  CXPPMM  
STA $37                                                                                                     

LDA  INPT4   
STA $3C                                                                                                     

LDA  SWCHA   
STA $0280                                                                                                   

LDA  SWCHB   
STA $0282                                                                                                   

LDA  INTIM   
STA $0284

LDA  TIM64T  
STA $0296

START:                                                                                                             
       JMP    StartGame

PrintDisplay:                                                                                                             
       STA    HMCLR               ; Clear horzontal motion.                                                  ;3    
       LDA    $86                 ; Position Player00 Sprite To                                              ;3    
       LDX    #$00                ; the X Coordinate of Object1.                                             ;2    
       JSR    PosSpriteX                                                                                     ;6    
                                                                                                                   
       LDA    $88                 ;Position Player01 Sprite to                                               ;3    
       LDX    #$01                ;      the X Coordinate of Object2.                                        ;2    
       JSR    PosSpriteX                                                                                     ;6    
                                                                                                                   
       LDA    $8B                 ;Position Ball Strite to                                                   ;3    
       LDX    #$04                ;      the X Coordinate of the Man.                                        ;2    
       JSR    PosSpriteX                                                                                     ;6    
                                                                                                                   
       STA    WSYNC               ;Wait for horizontal Blank.                                                ;3    
       STA    HMOVE               ;Apply Horizontal Motion.                                                  ;3    
       STA    CXCLR               ;Clear Collision Latches.                                                  ;3    
                                                                                                                   
       LDA    $8C                 ;Get the Y Coordinate of the Man.                                          ;3    
       SEC                                                                                                   ;2    
       SBC    #$04                ;And Adjust it (By Four Scan Lines)                                        ;2    
       STA    $8D                 ;      for printing (so Y Coordinate Specifies Middle)                     ;3    
