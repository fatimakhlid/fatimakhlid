[org 0x0100]
mov bx,array
jmp start
array: db 'I am Programmer',0
count: db 0
counting: 
       add byte[count],1
       ret	   
check_alphabetic: ;if capital then convert in samll
		cmp byte[bx], 65
		jge small
ennd:  
		call check_vowels
		ret
small:
	 cmp byte[bx],90
	 jg ennd
	 mov al,[bx]
	 add al,32
	 mov [bx],al
     jmp ennd
check_vowels:
        cmp byte[bx],97 ;a
		je counting
		cmp byte[bx],101 ;e
		je counting
		cmp byte[bx],105 ;i
		je counting
		cmp byte[bx],111 ;o
		je counting
		cmp byte[bx],117 ;u
		je counting
		ret
start:
	  call check_alphabetic
	  add bx,1
	  cmp byte[bx],0
	  jne start
mov cl,[count]
mov ax,0x4c00
int 0x21


