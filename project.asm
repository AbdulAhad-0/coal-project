INCLUDE Irvine32.inc

.data
arr dword 10 dup(0)
heading byte  " ======== SORTING ALGO PROJECT =========== ",0
output byte " SORTED ARRAY IS :",0
choosed byte "enter your choice : ",0
comma byte " , ",0
divider byte " =================== END ======================= ",0
msg1 byte "Give an array of size (10):",0
msg byte "1.bubble",0,"2.merge ",0,"3.select",0,"4.quick ",0,"5.shell ",0,"6.insert",0
.code
partition PROC,
	pArray:PTR DWORD,
	loww:DWORD,
	highh:DWORD

	LOCAL pivot:DWORD, i:DWORD, j:DWORD

	MOV esi, pArray
	MOV edx, highh
	MOV eax, [esi + edx*4]
	MOV pivot, eax
	MOV eax, loww
	MOV j, eax
	DEC eax
	MOV i, eax

	forLoop:
		MOV eax, j
		CMP eax, highh
		JNL breakk
		MOV ecx, j
		MOV eax, [esi + ecx*4]
		CMP eax, pivot
		JG nextt
		INC i
		MOV edx, i
		MOV eax, [esi + edx*4]
		MOV edx, j
		MOV ebx, [esi + edx*4]
		MOV edx, i
		MOV [esi + edx*4], ebx
		MOV edx, j
		MOV [esi + edx*4], eax

	nextt:
		INC j
		JMP forLoop
	breakk:
		INC i
		MOV edx, i
		MOV eax, [esi + edx*4]
		MOV edx, j
		MOV ebx, [esi + edx*4]
		MOV [esi + edx*4], eax
		MOV edx, i
		MOV [esi + edx*4], ebx
		MOV eax, i

	ret
partition ENDP

quickSort PROC,
	pArray:PTR DWORD,
	loww:DWORD,
	highh:DWORD

	LOCAL pi:DWORD
	MOV eax, loww
	CMP eax, highh
	JGE breakk
	INVOKE partition, pArray, loww, highh
	MOV pi, eax
	DEC pi
	INVOKE quickSort, pArray, loww, pi
	ADD pi, 2
	INVOKE quickSort, pArray, pi, highh

breakk:

	ret
quickSort ENDP
main PROC
mov edx,offset heading
call writestring
call crlf
call crlf
call crlf
mov edx,offset msg1
call writestring
mov ecx,10
mov esi,0
the:
call readint
mov arr[esi],eax
add esi,4
loop the
mov ecx,6
mov edx,offset msg
that:
call writestring
add edx,9
call crlf
loop that
mov edx,offset choosed
call writestring
call readdec
cmp eax,1
je callbubble
cmp eax,2
je callmerge
cmp eax,3
je callselection
cmp eax,4
je callquick
cmp eax,5
je callshell
cmp eax,6
je callinsertion

callshell:
mov ebx,10
 mov esi, OFFSET arr
    call ShellSort           
jmp done
callquick:
	MOV ecx, LENGTHOF arr
	DEC ecx
	INVOKE quickSort, ADDR arr, 0, ecx
jmp done
callbubble:
mov esi,offset arr
mov ebx,lengthof arr
call bubblesort
jmp done
callselection:
mov eax,type arr
mov esi,offset arr
mov ecx,lengthof arr
call SelectionSort
jmp done
callinsertion:
mov ebx,type arr
mov esi,offset arr
mov ecx,lengthof arr
call Insertion_sort
jmp done
callmerge:
mov eax,type arr
mov esi,offset arr
mov ebx,0
mov edx,lengthof arr
dec edx

call MergeSort
done:

mov esi, offset arr
mov ecx, lengthof arr
call crlf
mov edx, offset output
call writestring
printthe:
mov eax, [esi]
call writeint
mov edx,offset comma
call writestring
add esi,4
loop printthe
call crlf
call crlf
mov edx,offset divider
call writestring
call crlf
call crlf

exit
main ENDP




MergeSort PROC
LOCAL mid:DWORD,lower:DWORD,higher:DWORD,typeArr:DWORD
mov typeArr,eax
mov lower,ebx
mov higher,edx
cmp ebx,edx
jl recurse
jmp endProgram
recurse:
mov eax,lower
add eax,higher
shr eax,1
mov mid,eax
mov ebx,lower
mov edx,mid
mov eax,typeArr
call MergeSort
mov ebx,mid
inc ebx
mov edx,higher
mov eax,typeArr
call MergeSort
mov ebx,lower
mov edx,higher
mov eax,typeArr
cmp eax,4
jz isDWORD
isDWORD:
mov eax,mid
call DMerge
jmp endProgram
endProgram:
ret
MergeSort ENDP


DMerge PROC
LOCAL i:DWORD,j:DWORD,k:DWORD,lower:DWORD,mid:DWORD,higher:DWORD,a[100]:SDWORD
mov i,ebx
mov k,ebx
mov j,eax
inc j
mov mid,eax
mov higher,edx
mov lower,ebx
mov ecx,0
startLoop:
mov edx,mid
cmp i,edx
jg outsideFirst
mov edx,higher
cmp j,edx
jg outsideFirst
mov ebx,i
mov eax,[esi + ebx * 4]
mov ebx,j
cmp eax,[esi + ebx * 4]
jl firstConditionTrue
jmp secondConditionTrue
firstConditionTrue:
mov ebx,i
mov edx,k
mov eax,[esi + ebx * 4]
mov [a + edx * 4],eax
inc k
inc i
jmp continueLoop
secondConditionTrue:
mov ebx,j
mov edx,k
mov eax,[esi + ebx * 4]
mov [a + edx * 4],eax
inc k
inc j
continueLoop:
loop startLoop
outsideFirst:
mov ecx,0
secondLoop:
mov eax,mid
cmp i,eax
jg outsideSecond
mov ebx,i
mov edx,k
mov eax,[esi + ebx * 4]
mov [a + edx * 4],eax
inc k
inc i
loop secondLoop
outsideSecond:
thirdLoop:
mov eax,higher
cmp j,eax
jg outsideThird
mov ebx,j
mov edx,k
mov eax,[esi + ebx * 4]
mov [a + edx * 4],eax
inc k
inc j
loop thirdLoop
outsideThird:
mov eax,lower
mov i,eax
mov ecx,0
finalLoop:
mov eax,k
cmp i,eax
jge outsideFinal
mov ebx,i
mov eax,[a + ebx * 4]
mov [esi + ebx * 4],eax
inc i
loop finalLoop
outsideFinal:
ret
DMerge ENDP
ShellSort PROC 

local gap:DWORD
local len:DWORD
local temp:DWORD




mov edx,0
mov eax,ebx
mov len,ebx
mov ebx,2

div ebx
mov gap,eax
mov eax,0
mov ecx,0
mov edi,esi

GAPLOOP:

	mov eax,gap

	INNERLOOP:
	
		mov ebx,[esi + eax * 4]
		mov temp,ebx
		mov edx,eax

		FORLOOP3:

			cmp edx,gap
			jnae OUTOFFORLOOP3

			mov ebx,edx
			sub ebx,gap
			mov ebx,[esi + ebx * 4]
			cmp ebx,temp
			jl OUTOFFORLOOP3

			mov [edi + edx * 4],ebx
			sub edx,gap

		loop FORLOOP3

		OUTOFFORLOOP3:

			mov ebx,temp
			mov [esi + edx * 4],ebx
			inc eax
			cmp eax,len

	jl INNERLOOP

	mov edx,0
	mov eax,gap
	mov ebx,2
	div ebx
	mov gap,eax
	cmp gap,0

	je FINISH

jne GAPLOOP

FINISH:


ret 
ShellSort endp




BubbleSort proc
mov edi,esi
mov ecx,ebx
dec ecx
mov ebx,0
mov eax,0
outerLoop:
push ecx
mov esi,edi
innerLoop:
mov eax,[esi]
mov ebx,[esi + 4]
cmp eax,ebx
jg swapElements
continueLoop:
add esi,4
loop innerLoop
pop ecx
loop outerLoop
jmp endProgram
swapElements:
mov eax,[esi]
mov ebx,[esi + 4]
xchg eax,ebx
mov [esi],eax
mov [esi + 4],ebx
jmp continueLoop
endProgram:
ret 
BubbleSort ENDP




Insertion_sort PROC USES eax ecx edx
LOCAL x:DWORD, i:DWORD, j:DWORD,lengthArr:DWORD
mov eax, 1
mov i, eax
mov eax, 0
mov j, eax
mov lengthArr,ecx
mov ecx, lengthArr
dec ecx
D1:
push ecx
mov ecx, ebx
mov edx, i
mov eax, [esi+edx*4]
mov x, eax
push ecx
mov ecx, 0
mov eax, i
mov j, eax
dec j
mov ebx, 0
D2:
mov ebx, 0
mov edx, j
cmp j, ebx
JL D3
mov ebx, [esi+edx*TYPE esi]
cmp ebx, x
JLE D3
inc edx
mov [esi+edx*TYPE esi], ebx
dec j
loop D2
D3:
pop ecx
mov eax, x
mov edx, j
inc edx
mov [esi+edx*TYPE esi], eax
inc i
pop ecx
loop D1
return:
ret
Insertion_sort ENDP




SelectionSort PROC
LOCAL i:DWORD,j:DWORD,min:DWORD,sizeOfArray:DWORD
mov eax,0
mov sizeOfArray,ecx
mov i,eax
mov j,eax
mov min,eax
mov ecx,sizeOfArray
dec ecx
outerLoop:
mov ebx,i
mov min,ebx
push ecx
mov edx,i
mov j,edx
innerLoop:
inc j
mov edx,j
mov eax,[esi + edx * 4]
mov edx,min
mov ebx,[esi + edx * 4]
cmp eax,ebx
jl markNewMin
jmp continueLoop
markNewMin:
mov edx,j
mov min,edx
continueLoop:
loop innerLoop
mov eax,i
mov ebx,[esi + eax * 4]
mov edx,min
xchg ebx,[esi + edx * 4]
mov [esi + eax * 4],ebx
pop ecx
inc i
loop outerLoop
ret
SelectionSort ENDP


END main
