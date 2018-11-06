

  .data
  first: .asciiz "input x1:"
  second: .asciiz "input x2"
  third: .asciiz "input y1"
  fourth: .asciiz "input y2"



  .text

main2:
          li $v0, 4
          la $a0, first
          syscall

          li $v0, 5
          syscall

          #this is the first value
          move $s0, $v0

          li $v0, 4
          la $a0, second
          syscall

          li $v0,5
          syscall

          #second value
          move $s1, $v0

          li $v0, 4
          la $a0, third
          syscall

          li $v0, 5
          syscall

          #this is the first value
          move $s2, $v0

          li $v0, 4
          la $a0, fourth
          syscall

          li $v0,5
          syscall

          #second value
          move $s3, $v0

          sub $t1, $s0, $s2
          mul $s4, $t1, $t1

          sub $t2, $s1, $s3
          mul $s5, $t2, $t2

          add $s6, $s4, $s5


          #the square root of $s6
          li $s7, 1 #initilaize a counter and use it to divide
          li $t0, 0
          beq $s6, $t0, zerocase


          loop2: 
          
          div $s1, $s6, $s7
          beq $s1, $s7, finalvalue

          addi $s7, $s7, 1
          
         j loop2


      
  finalvalue:
          addi $a0, $s1, 0
          li $v0, 1
          syscall
          j main2


  zerocase:
          addi $a0, $s6, 0
          li $v0, 1
          syscall
          j main2


    exit1:

        #exit program
          li  $v0, 10
          syscall
