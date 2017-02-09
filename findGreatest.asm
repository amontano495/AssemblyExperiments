.data
   IntArray: .word 0x5, 0x9, 0x4, 0xFF, 0xFE, 0xFA, 0x7, 0x3, 0x8, 0xFD
   size: .word 10
   result: .space 4

.text

main:
   lw   $t3, size
   addi $t0, $t3, -1     #Use to stop loop
   li   $t1, 0         	 #Very small number, easy to be greater than
   li   $t2, 0           #idex, (i = 0)
   li   $t4, 0           #offset start at 0
   j loop                #go to loop

loop:
   beq  $t2, $t0, end      #while i < size, ends when t2 is size - 1
   lw   $t5, IntArray($t4) #store value of array at result
   bgt  $t5, $t1, set      #if t5 > t1, go to set label

   addi $t4, $t4, 4        #increases offset by 4
   addi $t2, $t2, 1        #i++
   j loop                  #start loop over

end:
   li   $v0, 10              #ends program
   syscall

set:
   lw   $t1, IntArray($t4)    #sets t1 to array value
   sw   $t1, result           #sets result to t1
   j loop                     #gets back to called procedure
