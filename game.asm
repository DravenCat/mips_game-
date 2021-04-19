###############################################################################
#
# CSCB58 Winter 2021 Assembly Final Project
# University of Toronto, Scarborough
#
# Author: Dezhi Ren
#
# Bitmap Display Configuration: 
# - Unit width in pixels: 8 
# - Unit height in pixels: 8 
# - Display width in pixels: 512
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp) 
#
# Which milestones have been reached in this submission?
# - Milestone 4
#
# Features in milestone 4: 
# 1. A: Different levels
# 2. B: Increase difficulty
# 3. E: Enemy ship
#
# Link to video demonstration:
# - YouTube:  https://youtu.be/fDPrMXWOLEI
#
#################################################################################

.eqv    BASE_ADDRESS    0x10008000
.eqv    Refresh_rate    40
.eqv    Head            0xffff00  #Yellow
.eqv    Tail            0x20b2aa  #LightSeaGreen
.eqv    Body            0x0000ff  #Blue
.eqv    Red             0xff0000  #Red
.eqv    Ivory3          0xcdcdc1  #Ivory3
.eqv    Ivory4          0x8b8b83  #Ivory4

.data   
                          #Address of space ship (set in initial state)
space_ship:      .word    0x10008f18, 0x10008f1c, 0x1000901c, 0x10009020, 0x10009118, 0x1000911c
ob_v:            .word    0x100085d8, 0x100086dc, 0x100087e0, 0x100088e4  #obstacle v
ob_z:            .word    0x100090ac, 0x100091a8, 0x100091ac, 0x100092a8  #obstacle z
ob_a:            .word    0x10009a84, 0x10009a88, 0x10009b84, 0x10009b88  #obstacle a
ob_u:            .word    0:5 #obstacles u, lv2
ob_t:            .word    0:5 #obstacles t, lv3
alien:           .word    0:7 #Enemy ship, lv2
alien2:          .word    0:7 #Enemy ship, lv4

.text
.globl main
main:   
        #initialize the ship
Init:   li $t1, Head  #Yellow, head
        li $t2, Tail  #LightSeaGreen, tail
        li $t3, Body  #Blue, body
        sw $t2, 3864($gp) #Tail
        sw $t3, 3868($gp)
        sw $t3, 4124($gp)
        sw $t1, 4128($gp) #Shooting head
        sw $t2, 4376($gp) #Tail
        sw $t3, 4380($gp)
        la $t4, space_ship
        addi $t5, $gp, 3864
        sw $t5, 0($t4) #Unit 1
        addi $t5, $gp, 3868
        sw $t5, 4($t4) #Unit 2
        addi $t5, $gp, 4124
        sw $t5, 8($t4) #Unit 3
        addi $t5, $gp, 4128
        sw $t5, 12($t4) #Unit 4
        addi $t5, $gp, 4376
        sw $t5, 16($t4) #Unit 5
        addi $t5, $gp, 4380
        sw $t5, 20($t4) #Unit 6
        
        li $t1, Ivory3
        li $t2, Ivory4        
        #initialize obstacles v
        sw $t2, 1496($gp)
        sw $t1, 1756($gp)
        sw $t2, 2016($gp)
        sw $t1, 2276($gp)
        la $t4, ob_v
        addi $t5, $gp, 1496
        sw $t5, 0($t4) #Unit 1
        addi $t5, $gp, 1756
        sw $t5, 4($t4) #Unit 2
        addi $t5, $gp, 2016
        sw $t5, 8($t4) #Unit 3
        addi $t5, $gp, 2276
        sw $t5, 12($t4) #Unit 4
        
        #initialize obstacles z
        sw $t1, 4268($gp)
        sw $t2, 4520($gp)
        sw $t2, 4524($gp)
        sw $t1, 4776($gp)
        la $t4, ob_z
        addi $t5, $gp, 4268
        sw $t5, 0($t4) #Unit 1
        addi $t5, $gp, 4520
        sw $t5, 4($t4) #Unit 2
        addi $t5, $gp, 4524
        sw $t5, 8($t4) #Unit 3
        addi $t5, $gp, 4776
        sw $t5, 12($t4) #Unit 4
        
        #initialize obstacles a
        sw $t2, 6788($gp)
        sw $t2, 6792($gp)
        sw $t2, 7044($gp)
        sw $t2, 7048($gp)
        la $t4, ob_a
        addi $t5, $gp, 6788
        sw $t5, 0($t4) #Unit 1
        addi $t5, $gp, 6792
        sw $t5, 4($t4) #Unit 2
        addi $t5, $gp, 7044
        sw $t5, 8($t4) #Unit 3
        addi $t5, $gp, 7048
        sw $t5, 12($t4) #Unit 4
        
        #initialize alien ship
        la $t4, alien
        sw $zero, 0($t4)
        sw $zero, 4($t4)
        sw $zero, 8($t4)
        sw $zero, 12($t4)
        sw $zero, 16($t4)
        sw $zero, 20($t4)
        sw $zero, 24($t4)
        
        #initialize alien2 ship
        la $t4, alien2
        sw $zero, 0($t4)
        sw $zero, 4($t4)
        sw $zero, 8($t4)
        sw $zero, 12($t4)
        sw $zero, 16($t4)
        sw $zero, 20($t4)
        sw $zero, 24($t4)
        
        #intialize obstacle u
        la $t4, ob_u
        sw $zero, 0($t4)
        sw $zero, 4($t4)
        sw $zero, 8($t4)
        sw $zero, 12($t4)
        sw $zero, 16($t4)
        
        #initialize obstacle t
        la $t4, ob_u
        sw $zero, 0($t4)
        sw $zero, 4($t4)
        sw $zero, 8($t4)
        sw $zero, 12($t4)
        sw $zero, 16($t4)
        
        #Initialize health
        li $t1, Red 
       
        sw $t1, 7716($gp) #Health 3
        sw $t1, 7724($gp)
        sw $t1, 7976($gp) 
        sw $t1, 7700($gp) #Health 2
        sw $t1, 7708($gp)
        sw $t1, 7960($gp)
        sw $t1, 7684($gp) #Health 1
        sw $t1, 7692($gp)
        sw $t1, 7944($gp)     
        
        #Initialize difficulty   
        li $t1, 0x00ff00 #Green
        sw $t1, 7928($gp) #level 1, 40, no alien
        sw $t1, 8184($gp)

        li $s7, 0xffff0000 #Address of keystroke event
        la $s6, space_ship #Address of space_ship
        li $s1, 0 #immunity seconds
        li $s2, 3 #Health of the ship
        li $s0, 40 #Refresh Rate
        li $s3, 0 #Play time
        li $s4, 0 #Number of aliens
        
m_loop: #Main loop of the game

        #key_update(int[] space_ship, int *keystroke_event)
        add $a0, $s6, $zero
        add $a1, $s7, $zero
        jal key_update
        
        beq $s2, 0, Game_over
        ble $s2, -1, Refresh
                
        #call ob_move() to move the obstacles
        jal ob_move
        
        #find_crash(int[] space_ship, int immunity, int health) and return the new immunity second and health
        add $a0, $s6, $zero
        add $a1, $s1, $zero
        add $a2, $s2, $zero
        jal find_crash
        addi $s1, $v0, 0
        addi $s2, $v1, 0
        
        addi $a0, $s2, 0
        jal show_health
        
        addi $a1, $s3, 0
        jal check_difficulty
        addi $s0, $v0, 0
        addi $s3, $v1, 0
        
        #Sleep for 40ms, which is 25Hz update rate
Refresh:li $v0, 32
        add $a0, $s0, $zero
        syscall
        
        j m_loop
        
        #End the game 
End:    li $v0, 10
        syscall
        
Game_over: #Showing Game Over
        addi $s2, $zero, -1
        jal gg
        j Refresh
#################################################
# This section is the key_update() function
# void key_update(int[] ship_address, int *keystroke_event)
#################################################
key_update: #check whether the user has pressed any key
        lw $t4, 0($a1)
        beq $t4, 1, k_event
k_re:   jr $ra #Return from key_update() function
        
k_event: #Branch to correponding keystroke event
        lw $t5, 4($a1)
        li $t7, Head  #Yellow, head
        li $t8, Tail  #LightSeaGreen, tail
        li $t9, Body  #Blue, body
        beq $t5, 0x70, respond_restart
        beq $s2, -1, k_re
        beq $t5, 0x61, respond_a
        beq $t5, 0x64, respond_d
        beq $t5, 0x73, respond_s
        beq $t5, 0x77, respond_w
        j k_re
        
         
respond_a: #Respond to key press 'a' event   -4
        #check whether the ship has reach the left end
        lw $t0, 0($a0)  #1st unit
        li $t1, 256
        div $t0, $t1
        mfhi $t1
        beq $t1, 0, k_re
        
        #update the new location for the ship
        addi $t0, $t0, -4
        sw $t8, 0($t0)
        sw $t0, 0($a0)
        lw $t0, 4($a0) #2nd unit
        sw $zero, 0($t0)
        addi $t0, $t0, -4
        sw $t9, 0($t0)
        sw $t0, 4($a0)
        lw $t0, 8($a0) #3rd unit
        addi $t0, $t0, -4
        sw $t9, 0($t0)
        sw $t0, 8($a0)
        lw $t0, 12($a0) #4th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -4
        sw $t7, 0($t0)
        sw $t0, 12($a0)
        lw $t0, 16($a0) #5th unit
        addi $t0, $t0, -4
        sw $t8, 0($t0)
        sw $t0, 16($a0)
        lw $t0, 20($a0) #6th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -4
        sw $t9, 0($t0)
        sw $t0, 20($a0)
        j k_re

respond_d: #Respond to key press 'd' event   +4
        #check whether the ship has reach the right end
        lw $t0, 12($a0)  #4th unit
        li $t1, 256
        div $t0, $t1
        mfhi $t1
        beq $t1, 252, k_re
        
        #update the new location for the ship
        addi $t0, $t0, 4
        sw $t7, 0($t0)
        sw $t0, 12($a0)
        lw $t0, 0($a0) #1st unit
        sw $zero, 0($t0)
        addi $t0, $t0, 4
        sw $t8, 0($t0)
        sw $t0, 0($a0)
        lw $t0, 4($a0) #2nd unit
        addi $t0, $t0, 4
        sw $t9, 0($t0)
        sw $t0, 4($a0)
        lw $t0, 8($a0) #3rd unit
        sw $zero, 0($t0)
        addi $t0, $t0, 4
        sw $t9, 0($t0)
        sw $t0, 8($a0)
        lw $t0, 16($a0) #5th unit
        sw $zero, 0($t0)
        addi $t0, $t0, 4
        sw $t8, 0($t0)
        sw $t0, 16($a0)
        lw $t0, 20($a0) #6th unit
        addi $t0, $t0, 4
        sw $t9, 0($t0)
        sw $t0, 20($a0)
        j k_re

respond_s: #Respond to key press 's' event   +256
        #check whether the ship has reach the left end
        lw $t0, 20($a0)  #6th unit
        bge $t0, 0x10009d00, k_re
        
        #update the new location for the ship
        addi $t0, $t0, 256
        sw $t9, 0($t0)
        sw $t0, 20($a0)
        lw $t0, 0($a0) #1st unit
        sw $zero, 0($t0)
        addi $t0, $t0, 256
        sw $t8, 0($t0)
        sw $t0, 0($a0)
        lw $t0, 4($a0) #2nd unit
        sw $zero, 0($t0)
        addi $t0, $t0, 256
        sw $t0, 4($a0)
        lw $t0, 8($a0) #3rd unit
        addi $t0, $t0, 256
        sw $t0, 8($a0)
        lw $t0, 12($a0) #4th unit
        sw $zero, 0($t0)
        addi $t0, $t0, 256
        sw $t7, 0($t0)
        sw $t0, 12($a0)
        lw $t0, 16($a0) #5th unit
        sw $zero, 0($t0)
        addi $t0, $t0, 256
        sw $t8, 0($t0)
        sw $t0, 16($a0)
        j k_re
        
respond_w: #Respond to key press 'w' event   -256
        #check whether the ship has reach the left end
        lw $t0, 4($a0)  #2nd unit
        blt $t0, 0x10008100, k_re
        
        #update the new location for the ship
        addi $t0, $t0, -256
        sw $t9, 0($t0)
        sw $t0, 4($a0)
        lw $t0, 0($a0) #1st unit
        sw $zero, 0($t0)
        addi $t0, $t0, -256
        sw $t8, 0($t0)
        sw $t0, 0($a0)
        lw $t0, 8($a0) #3rd unit
        addi $t0, $t0, -256
        sw $t0, 8($a0)
        lw $t0, 12($a0) #4th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -256
        sw $t7, 0($t0)
        sw $t0, 12($a0)
        lw $t0, 16($a0) #5th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -256
        sw $t8, 0($t0)
        sw $t0, 16($a0)
        lw $t0, 20($a0)#6th unit
        sw $zero, 0($t0)
        addi $t0, $t0, -256
        sw $t0, 20($a0)
        j k_re
        
        
respond_restart: #Call delete_all and then jump to the initial state
        beq $s2, -1, res_game_over
        jal delete_all_items
        j Init
res_game_over: 
        jal delete_game_over
        j Init


#########################################################
# This is a private function that delete all the space thip and obstacles
# delete_all()
############################################################
delete_all_items: #Delete all the state of any object in the game
        la $t1, space_ship
        lw $t1, 0($t1)
        la $t2, ob_v
        lw $t2, 0($t2)
        la $t3, ob_z
        lw $t3, 0($t3)
        la $t4, ob_a
        lw $t4, 0($t4)
        la $t5, alien
        lw $t5, 0($t5)
        la $t6, alien2
        lw $t6, 0($t6)
        la $t7, ob_u
        lw $t7, 0($t7)
        la $t8, ob_t
        lw $t8, 0($t8)
        
        sw $zero, 7896($gp) 
        sw $zero, 8152($gp)
        
        sw $zero, 7904($gp)
        sw $zero, 8160($gp)
        
        sw $zero, 7912($gp) 
        sw $zero, 8168($gp)
        
        sw $zero, 7920($gp)
        sw $zero, 8176($gp)
        
        #delete space ship
        sw $zero, 0($t1)
        sw $zero, 4($t1)
        sw $zero, 260($t1)
        sw $zero, 264($t1)
        sw $zero, 512($t1)
        sw $zero, 516($t1)
        
        #delete obstacle v
        sw $zero, 0($t2)
        sw $zero, 260($t2)
        sw $zero, 520($t2)
        sw $zero, 780($t2)
        
        #delete obstacle z
        sw $zero, 0($t3)
        sw $zero, 252($t3)
        sw $zero, 256($t3)
        sw $zero, 508($t3)
        
        #delete obstacle a
        sw $zero, 0($t4)
        sw $zero, 4($t4)
        sw $zero, 256($t4)
        sw $zero, 260($t4)
        
        ble $s3, 650, dle_no
        ble $s3, 1300, dle_1_u
        ble $s3, 2042, dle_t
        
        #delete the second alien
        sw $zero, 0($t6)
        sw $zero, 8($t6)
        sw $zero, 16($t6)
        sw $zero, 260($t6)
        sw $zero, 264($t6)
        sw $zero, 268($t6)
        sw $zero, 520($t6)
        
dle_t:  #delete obstacle t
        sw $zero, 0($t8)
        sw $zero, 4($t8)
        sw $zero, 8($t8)
        sw $zero, 260($t8)
        sw $zero, 516($t8)
        
        #delete alien
dle_1_u:sw $zero, 0($t5)
        sw $zero, 8($t5)
        sw $zero, 16($t5)
        sw $zero, 260($t5)
        sw $zero, 264($t5)
        sw $zero, 268($t5)
        sw $zero, 520($t5)
        
        #delete obstacle u
        sw $zero, 0($t7)
        sw $zero, 4($t7)
        sw $zero, 260($t7)
        sw $zero, 512($t7)
        sw $zero, 516($t7)
       
         
dle_no: jr $ra


delete_game_over: #Delete "GAME OVER"
        addi $t8, $zero, 0 #Black
        
        #Draw 'G'
        sw $t8, 3360($gp)
        sw $t8, 3364($gp)
        sw $t8, 3368($gp)
        sw $t8, 3612($gp)
        sw $t8, 3868($gp)
        sw $t8, 3880($gp)
        sw $t8, 3884($gp)
        sw $t8, 4124($gp)
        sw $t8, 4140($gp)
        sw $t8, 4384($gp)
        sw $t8, 4388($gp)
        sw $t8, 4392($gp)
        sw $t8, 4396($gp)
        
        #Draw 'A'
        sw $t8, 3388($gp)
        sw $t8, 3640($gp)
        sw $t8, 3648($gp)
        sw $t8, 3896($gp)
        sw $t8, 3900($gp)
        sw $t8, 3904($gp)
        sw $t8, 4148($gp)
        sw $t8, 4164($gp)
        sw $t8, 4404($gp)
        sw $t8, 4420($gp)
        
        #Draw 'M'
        sw $t8, 3404($gp)
        sw $t8, 3408($gp)
        sw $t8, 3416($gp)
        sw $t8, 3420($gp)
        sw $t8, 3660($gp)
        sw $t8, 3664($gp)
        sw $t8, 3672($gp)
        sw $t8, 3676($gp)
        sw $t8, 3916($gp)
        sw $t8, 3924($gp)
        sw $t8, 3932($gp)
        sw $t8, 4172($gp)
        sw $t8, 4180($gp)
        sw $t8, 4188($gp)
        sw $t8, 4428($gp)
        sw $t8, 4436($gp)
        sw $t8, 4444($gp)
        
        #Draw 'E'
        sw $t8, 3428($gp)
        sw $t8, 3432($gp)
        sw $t8, 3436($gp)
        sw $t8, 3440($gp)
        sw $t8, 3444($gp)
        sw $t8, 3684($gp)
        sw $t8, 3940($gp)
        sw $t8, 3944($gp)
        sw $t8, 3948($gp)
        sw $t8, 3952($gp)
        sw $t8, 3956($gp)
        sw $t8, 4196($gp)
        sw $t8, 4452($gp)
        sw $t8, 4456($gp)
        sw $t8, 4460($gp)
        sw $t8, 4464($gp)
        sw $t8, 4468($gp)
        
        #Draw 'O'
        sw $t8, 3468($gp)
        sw $t8, 3472($gp)
        sw $t8, 3476($gp)
        sw $t8, 3720($gp)
        sw $t8, 3736($gp)
        sw $t8, 3976($gp)
        sw $t8, 3992($gp)
        sw $t8, 4232($gp)
        sw $t8, 4248($gp)
        sw $t8, 4492($gp)
        sw $t8, 4496($gp)
        sw $t8, 4500($gp)
        
        #Draw 'V'
        sw $t8, 3488($gp)
        sw $t8, 3504($gp)
        sw $t8, 3744($gp)
        sw $t8, 3760($gp)
        sw $t8, 4004($gp)
        sw $t8, 4012($gp)
        sw $t8, 4260($gp)
        sw $t8, 4268($gp)
        sw $t8, 4520($gp)
        
        #Draw 'E'
        sw $t8, 3512($gp)
        sw $t8, 3516($gp)
        sw $t8, 3520($gp)
        sw $t8, 3524($gp)
        sw $t8, 3528($gp)
        sw $t8, 3768($gp)
        sw $t8, 4024($gp)
        sw $t8, 4028($gp)
        sw $t8, 4032($gp)
        sw $t8, 4036($gp)
        sw $t8, 4040($gp)
        sw $t8, 4280($gp)
        sw $t8, 4536($gp)
        sw $t8, 4540($gp)
        sw $t8, 4544($gp)
        sw $t8, 4548($gp)
        sw $t8, 4552($gp)
        
        #Draw 'R'
        sw $t8, 3536($gp)
        sw $t8, 3540($gp)
        sw $t8, 3544($gp)
        sw $t8, 3548($gp)
        sw $t8, 3792($gp)
        sw $t8, 3808($gp)
        sw $t8, 4048($gp)
        sw $t8, 4052($gp)
        sw $t8, 4056($gp)
        sw $t8, 4060($gp)
        sw $t8, 4304($gp)
        sw $t8, 4308($gp)
        sw $t8, 4560($gp)
        sw $t8, 4568($gp)
        sw $t8, 4572($gp)
        sw $t8, 4576($gp)
        
        jr $ra

###################################################
# This function is the obstacles_move() function
# void obstacles_move()
###################################################
ob_move: #Move the obstacles from right to left. If one is deleted, generate a new one
        la $t2, ob_a #Address of ob_a
        la $t1, ob_z #Address of ob_z
        la $t0, ob_v #Address of ob_v
        li $t7, Ivory3
        li $t8, Ivory4                
        li $t4, 256
        addi $t6, $ra, 0
        jal move_v
        jal move_z
        jal move_a
        
        ble $s3, 650, no_e #lv1
        ble $s3, 1300, enemy1 #lv2
        ble $s3, 2042, ob_lv_3 #lv3
        jal move_alien2
ob_lv_3:jal move_t
enemy1: jal move_alien1
        jal move_u
no_e:   add $ra, $t6, $zero
        jr $ra
        
        
        #Move V
move_v: lw $t3, 0($t0) #Unit 1
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_v

        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 0($t0)
        lw $t3, 4($t0) #Unit2
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 4($t0)
        lw $t3, 8($t0) #Unit3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 8($t0)
        lw $t3, 12($t0) #Unit4
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t0)
        jr $ra
        
move_z: #Move z
        lw $t3, 4($t1) #Unit2
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_z

        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 4($t1)
        lw $t3, 0($t1) #Unit1
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 0($t1)
        lw $t3, 8($t1) #Unit3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t3, 8($t1)
        lw $t3, 12($t1) #Unit4
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t1)
        jr $ra
        
move_a: #Move a
        lw $t3, 0($t2) #Unit 1
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_a
        
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 0($t2)
        lw $t3, 4($t2) #Unit 2
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t3, 4($t2)
        lw $t3, 8($t2) #Unit 3
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 8($t2)
        lw $t3, 12($t2) #Unit 2
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t3, 12($t2)
        jr $ra
        
        
move_u: #move the position of obstacle u
        li $t7, Ivory3
        li $t8, Ivory4   
        la $t9, ob_u
        lw $t3, 0($t9) #Unit 1
        beq $t3, 0, begin_u
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_u
        
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        lw $t3, 12($t9) #Unit 4
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 16($t9)
        jr $ra


move_t: #move the position of obstacle t
        li $t7, Ivory3
        li $t8, Ivory4   
        la $t9, ob_t
        lw $t3, 0($t9) #Unit 1
        beq $t3, 0, begin_t
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_t
        
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        addi $t3, $t3, -4
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 8($t9)  
        lw $t3, 12($t9) #Unit 4
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 16($t9)
        jr $ra
        
        
move_alien1: #Move alian
        la $t9, alien
        li $t7, 0x8a2be2 #BlueViolet, Body
        li $t8, 0xa020f0 #Purple, Edge
        
        lw $t3, 0($t9) #Unit 1
        beq $t3, 0, begin_alien
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_alien
        
random: li $v0, 42
        li $a0, 0
        li $a1, 5
        syscall
        beq $a0, 3, go_w
        beq $a0, 4, go_s
        
go_a:   sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        lw $t3, 12($t9) #Unit 4
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        addi $t3, $t3, -4
        sw $t3, 16($t9)
        lw $t3, 20($t9) #Unit 6
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t3, 20($t9)
        lw $t3, 24($t9) #Unit7
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 24($t9)
        jr $ra
        
go_w:   blt $t3, 0x10008100, go_s
        
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t8, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        addi $t3, $t3, -256
        sw $t7, 0($t3)
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        lw $t3, 12($t9) #Unit 4
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        addi $t3, $t3, -256
        sw $t3, 16($t9)
        lw $t3, 20($t9) #Unit 6
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t7, 0($t3)
        sw $t3, 20($t9)
        lw $t3, 24($t9) #Unit 7
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t8, 0($t3)
        sw $t3, 24($t9)
        jr $ra

go_s:   bgt $t3, 0x10009b00, go_w

        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        lw $t3, 12($t9) #Unit 4
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        addi $t3, $t3, 256
        sw $t7, 0($t3)
        sw $t3, 16($t9)
        lw $t3, 20($t9) #Unit 6
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t7, 0($t3)
        sw $t3, 20($t9)
        lw $t3, 24($t9) #Unit 7
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 24($t9)
        jr $ra   
        
        
move_alien2: #Move alian
        la $t9, alien2
        li $t7, 0x8a2be2 #BlueViolet, Body
        li $t8, 0xa020f0 #Purple, Edge
        
        lw $t3, 0($t9) #Unit 1
        beq $t3, 0, begin_alien2
        div $t3, $t4
        mfhi $t5
        beq $t5, 0, new_alien2
        
random2:li $v0, 42
        li $a0, 0
        li $a1, 6
        syscall
        beq $a0, 3, go_w2
        beq $a0, 4, go_s2
        
go_a2:  sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        lw $t3, 12($t9) #Unit 4
        addi $t3, $t3, -4
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        addi $t3, $t3, -4
        sw $t3, 16($t9)
        lw $t3, 20($t9) #Unit 6
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t3, 20($t9)
        lw $t3, 24($t9) #Unit7
        sw $zero, 0($t3)
        addi $t3, $t3, -4
        sw $t8, 0($t3)
        sw $t3, 24($t9)
        jr $ra
        
go_w2:  blt $t3, 0x10008100, go_s2
        
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t8, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        addi $t3, $t3, -256
        sw $t7, 0($t3)
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        lw $t3, 12($t9) #Unit 4
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        addi $t3, $t3, -256
        sw $t3, 16($t9)
        lw $t3, 20($t9) #Unit 6
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t7, 0($t3)
        sw $t3, 20($t9)
        lw $t3, 24($t9) #Unit 7
        sw $zero, 0($t3)
        addi $t3, $t3, -256
        sw $t8, 0($t3)
        sw $t3, 24($t9)
        jr $ra

go_s2:  bgt $t3, 0x10009b00, go_w2

        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 0($t9)
        lw $t3, 4($t9) #Unit 2
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t3, 4($t9)
        lw $t3, 8($t9) #Unit 3
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        lw $t3, 12($t9) #Unit 4
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        lw $t3, 16($t9) #Unit 5
        addi $t3, $t3, 256
        sw $t7, 0($t3)
        sw $t3, 16($t9)
        lw $t3, 20($t9) #Unit 6
        sw $zero, 0($t3)
        addi $t3, $t3, 256
        sw $t7, 0($t3)
        sw $t3, 20($t9)
        lw $t3, 24($t9) #Unit 7
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 24($t9)
        jr $ra
        
                        
       # Generate a new obstacle v
new_v: sw $zero, 0($t3)
       sw $zero, 260($t3)
       sw $zero, 520($t3)
       sw $zero, 780($t3)
       
       li $v0, 42
       li $a0, 0
       li $a1, 27
       syscall 
       mul $t3, $a0, 256
       addi $t3, $t3, 240
       add $t3, $t3, $gp
       sw $t3, 0($t0)
       sw $t8, 0($t3)
       add $t3, $t3, 260
       sw $t3, 4($t0)
       sw $t7, 0($t3)
       add $t3, $t3, 260
       sw $t3, 8($t0)
       sw $t8, 0($t3)
       add $t3, $t3, 260
       sw $t3, 12($t0)
       sw $t7, 0($t3)       
       jr $ra

       #Generate a new obstacle z
new_z: sw $zero, 0($t3)
       sw $zero, 4($t3)
       sw $zero, -252($t3)
       sw $zero, 256($t3)
       
       li $v0, 42
       li $a0, 0
       li $a1, 28
       syscall 
       mul $t3, $a0, 256
       addi $t3, $t3, 248
       add $t3, $t3, $gp
       sw $t3, 4($t1)
       sw $t8, 0($t3)
       addi $t3, $t3, 4
       sw $t3, 8($t1)
       sw $t8, 0($t3)
       addi $t3, $t3, -256
       sw $t3, 0($t1)
       sw $t7, 0($t3)
       addi $t3, $t3, 508
       sw $t3, 12($t1)
       sw $t7, 0($t3)
       jr $ra
       
       #Generate a new obstacle a
new_a: sw $zero, 0($t3)
       sw $zero, 4($t3)
       sw $zero, 256($t3)
       sw $zero, 260($t3)
       
       li $v0, 42
       li $a0, 0
       li $a1, 29
       syscall 
       mul $t3, $a0, 256
       addi $t3, $t3, 248
       add $t3, $t3, $gp
       sw $t8, 0($t3)
       sw $t3, 0($t2)
       addi $t3, $t3, 4
       sw $t8, 0($t3)
       sw $t3, 4($t2)
       addi $t3, $t3, 252
       sw $t8, 0($t3)
       sw $t3, 8($t2)
       addi $t3, $t3, 4
       sw $t8, 0($t3)
       sw $t3, 12($t2)
       jr $ra

new_u: #Generate a new obstacle u
        sw $zero, 0($t3)
        sw $zero, 4($t3)
        sw $zero, 260($t3)
        sw $zero, 512($t3)
        sw $zero, 516($t3)
        
begin_u:
        li $v0, 42
        li $a0, 0
        li $a1, 28
        syscall 
        mul $t3, $a0, 256
        addi $t3, $t3, 248
        add $t3, $t3, $gp
        sw $t7, 0($t3)
        sw $t3, 0($t9)
        addi $t3, $t3, 4
        sw $t8, 0($t3)
        sw $t3, 4($t9)
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 8($t9)
        addi $t3, $t3, 252
        sw $t7, 0($t3)
        sw $t3, 12($t9)
        addi $t3, $t3, 4
        sw $t8, 0($t3)
        sw $t3, 16($t9)
        jr $ra
        
        
new_t: #Generaate a new obstacle t
        sw $zero, 0($t3)
        sw $zero, 4($t3)
        sw $zero, 8($t3)
        sw $zero, 260($t3)
        sw $zero, 516($t3)
        
begin_t:
        li $v0, 42
        li $a0, 0
        li $a1, 28
        syscall 
        mul $t3, $a0, 256
        addi $t3, $t3, 244
        add $t3, $t3, $gp
        sw $t7, 0($t3)
        sw $t3, 0($t9)
        addi $t3, $t3, 4
        sw $t7, 0($t3)
        sw $t3, 4($t9)
        addi $t3, $t3, 4
        sw $t7, 0($t3)
        sw $t3, 8($t9)
        addi $t3, $t3, 252
        sw $t8, 0($t3)
        sw $t3, 12($t9)
        addi $t3, $t3, 256
        sw $t8, 0($t3)
        sw $t3, 16($t9)
        jr $ra
        

new_alien: #Generate a new alian ship
       sw $zero, 0($t3)
       sw $zero, 8($t3)
       sw $zero, 16($t3)
       sw $zero, 260($t3)
       sw $zero, 264($t3)
       sw $zero, 268($t3)
       sw $zero, 520($t3)
       
begin_alien:
       li $v0, 42
       li $a0, 0
       li $a1, 28
       syscall 
       mul $t3, $a0, 256
       addi $t3, $t3, 236
       add $t3, $t3, $gp
       sw $t8, 0($t3) 
       sw $t3, 0($t9)
       addi $t3, $t3, 8
       sw $t7, 0($t3)
       sw $t3, 4($t9)
       addi $t3, $t3, 8
       sw $t8, 0($t3)
       sw $t3, 8($t9)
       addi $t3, $t3, 244
       sw $t7, 0($t3)
       sw $t3, 12($t9)
       addi $t3, $t3, 4
       sw $t7, 0($t3)
       sw $t3, 16($t9)
       addi $t3, $t3, 4
       sw $t7, 0($t3)
       sw $t3, 20($t9)
       addi $t3, $t3, 252
       sw $t8, 0($t3)
       sw $t3, 24($t9)
       jr $ra
       
new_alien2: #Generate a second new alian ship
       sw $zero, 0($t3)
       sw $zero, 8($t3)
       sw $zero, 16($t3)
       sw $zero, 260($t3)
       sw $zero, 264($t3)
       sw $zero, 268($t3)
       sw $zero, 520($t3)
       
begin_alien2:
       li $v0, 42
       li $a0, 0
       li $a1, 28
       syscall 
       mul $t3, $a0, 256
       addi $t3, $t3, 236
       add $t3, $t3, $gp
       sw $t8, 0($t3) 
       sw $t3, 0($t9)
       addi $t3, $t3, 8
       sw $t7, 0($t3)
       sw $t3, 4($t9)
       addi $t3, $t3, 8
       sw $t8, 0($t3)
       sw $t3, 8($t9)
       addi $t3, $t3, 244
       sw $t7, 0($t3)
       sw $t3, 12($t9)
       addi $t3, $t3, 4
       sw $t7, 0($t3)
       sw $t3, 16($t9)
       addi $t3, $t3, 4
       sw $t7, 0($t3)
       sw $t3, 20($t9)
       addi $t3, $t3, 252
       sw $t8, 0($t3)
       sw $t3, 24($t9)
       jr $ra

#####################################################
# This function check whether the ship has crashed with an obstackel. If yes, the ship will be given 2 seconds immunity and lose 1 health
# find_crash(int[] space_ship, int immunity, int health)
####################################################
find_crash:
        lw $t3, 0($a0)
        li $v0, 0
        addi $v1, $a2, 0
        beq $a1, 1, redraw
        bgt $a1, 1, redraw_with_immunity
        #Branch to is_crashed if any unit of the ship has collision with obstacles
        lw $t4, 0($t3) #Check unit 1
        bne $t4, Tail, is_crashed
        lw $t4, 4($t3) #Check unit 2
        bne $t4, Body, is_crashed
        lw $t4, 260($t3) #Check unit 3
        bne $t4, Body, is_crashed
        lw $t4, 264($t3) #Check unit 4
        bne $t4, Head, is_crashed
        lw $t4, 512($t3) #Check unit 5
        bne $t4, Tail, is_crashed
        lw $t4, 516($t3) #Check unit 6
        bne $t4, Body, is_crashed
fc_ret: jr $ra
        
is_crashed: #The ship is crashed
        li $a1, 21        
        addi $v1, $v1, -1
        ble $v1, 0, fc_ret
        j redraw_with_immunity
        
redraw: #Redraw the ship
        li $t5, Head
        li $t6, Tail
        li $t7, Body
        
        sw $t6, 0($t3)
        sw $t7, 4($t3)
        sw $t7, 260($t3)
        sw $t5, 264($t3)
        sw $t6, 512($t3)
        sw $t7, 516($t3)
        addi $v0, $a1, -1
        j fc_ret

redraw_with_immunity: #Redraw the ship with Red cross showing it has immunity
        li $t6, Red
        
        sw $t6, 0($t3)
        sw $t6, 4($t3)
        sw $t6, 260($t3)
        sw $t6, 264($t3)
        sw $t6, 512($t3)
        sw $t6, 516($t3)
        addi $v0, $a1, -1
        j fc_ret


##################################################
# This function print "GAME OVER"
# void gg()
####################################################
gg:     addi $t9, $ra, 0
        jal delete_all_items
        addi $ra, $t9, 0
        
        li $t8, 0xffffff #White
        
        #Draw 'G'
        sw $t8, 3360($gp)
        sw $t8, 3364($gp)
        sw $t8, 3368($gp)
        sw $t8, 3612($gp)
        sw $t8, 3868($gp)
        sw $t8, 3880($gp)
        sw $t8, 3884($gp)
        sw $t8, 4124($gp)
        sw $t8, 4140($gp)
        sw $t8, 4384($gp)
        sw $t8, 4388($gp)
        sw $t8, 4392($gp)
        sw $t8, 4396($gp)
        
        #Draw 'A'
        sw $t8, 3388($gp)
        sw $t8, 3640($gp)
        sw $t8, 3648($gp)
        sw $t8, 3896($gp)
        sw $t8, 3900($gp)
        sw $t8, 3904($gp)
        sw $t8, 4148($gp)
        sw $t8, 4164($gp)
        sw $t8, 4404($gp)
        sw $t8, 4420($gp)
        
        #Draw 'M'
        sw $t8, 3404($gp)
        sw $t8, 3408($gp)
        sw $t8, 3416($gp)
        sw $t8, 3420($gp)
        sw $t8, 3660($gp)
        sw $t8, 3664($gp)
        sw $t8, 3672($gp)
        sw $t8, 3676($gp)
        sw $t8, 3916($gp)
        sw $t8, 3924($gp)
        sw $t8, 3932($gp)
        sw $t8, 4172($gp)
        sw $t8, 4180($gp)
        sw $t8, 4188($gp)
        sw $t8, 4428($gp)
        sw $t8, 4436($gp)
        sw $t8, 4444($gp)
        
        #Draw 'E'
        sw $t8, 3428($gp)
        sw $t8, 3432($gp)
        sw $t8, 3436($gp)
        sw $t8, 3440($gp)
        sw $t8, 3444($gp)
        sw $t8, 3684($gp)
        sw $t8, 3940($gp)
        sw $t8, 3944($gp)
        sw $t8, 3948($gp)
        sw $t8, 3952($gp)
        sw $t8, 3956($gp)
        sw $t8, 4196($gp)
        sw $t8, 4452($gp)
        sw $t8, 4456($gp)
        sw $t8, 4460($gp)
        sw $t8, 4464($gp)
        sw $t8, 4468($gp)
        
        #Draw 'O'
        sw $t8, 3468($gp)
        sw $t8, 3472($gp)
        sw $t8, 3476($gp)
        sw $t8, 3720($gp)
        sw $t8, 3736($gp)
        sw $t8, 3976($gp)
        sw $t8, 3992($gp)
        sw $t8, 4232($gp)
        sw $t8, 4248($gp)
        sw $t8, 4492($gp)
        sw $t8, 4496($gp)
        sw $t8, 4500($gp)
        
        #Draw 'V'
        sw $t8, 3488($gp)
        sw $t8, 3504($gp)
        sw $t8, 3744($gp)
        sw $t8, 3760($gp)
        sw $t8, 4004($gp)
        sw $t8, 4012($gp)
        sw $t8, 4260($gp)
        sw $t8, 4268($gp)
        sw $t8, 4520($gp)
        
        #Draw 'E'
        sw $t8, 3512($gp)
        sw $t8, 3516($gp)
        sw $t8, 3520($gp)
        sw $t8, 3524($gp)
        sw $t8, 3528($gp)
        sw $t8, 3768($gp)
        sw $t8, 4024($gp)
        sw $t8, 4028($gp)
        sw $t8, 4032($gp)
        sw $t8, 4036($gp)
        sw $t8, 4040($gp)
        sw $t8, 4280($gp)
        sw $t8, 4536($gp)
        sw $t8, 4540($gp)
        sw $t8, 4544($gp)
        sw $t8, 4548($gp)
        sw $t8, 4552($gp)
        
        #Draw 'R'
        sw $t8, 3536($gp)
        sw $t8, 3540($gp)
        sw $t8, 3544($gp)
        sw $t8, 3548($gp)
        sw $t8, 3792($gp)
        sw $t8, 3808($gp)
        sw $t8, 4048($gp)
        sw $t8, 4052($gp)
        sw $t8, 4056($gp)
        sw $t8, 4060($gp)
        sw $t8, 4304($gp)
        sw $t8, 4308($gp)
        sw $t8, 4560($gp)
        sw $t8, 4568($gp)
        sw $t8, 4572($gp)
        sw $t8, 4576($gp)
        
        jr $ra


##################################################
# This function show the remaining health
# show_health(int health)
##################################################
show_health: #Show the current health
        li $t1, 0 
        
        beq $a0, 3, hp_3
        beq $a0, 2, hp_2
        beq $a0, 1, hp_1
        
        sw $t1, 7684($gp) 
        sw $t1, 7692($gp)
        sw $t1, 7944($gp)
        
hp_1:   sw $t1, 7700($gp)
        sw $t1, 7708($gp)
        sw $t1, 7960($gp)
        
hp_2:   sw $t1, 7716($gp)
        sw $t1, 7724($gp)
        sw $t1, 7976($gp)
        
hp_3:   jr $ra


#################################################
# This function check the difficulty of the game 
# void (int time)
##########################################
check_difficulty: #Check and update the difficulty of the game
        addi $v1, $a1, 1 #Time
        beq $s2, 0, dead
        
        addi $t9, $ra, 0
        jal update_difficulty
        addi $ra, $t9, 0
        
        li $t1, 0x00ff00 #Green
        ble $v1, 650, draw_1
        ble $v1, 1300, draw_2
        ble $v1, 2042, draw_3
        ble $v1, 2784, draw_4
        
draw_5: sw $t1, 7896($gp) #level 5, 30, two aliens
        sw $t1, 8152($gp)
        
draw_4: sw $t1, 7904($gp) #level 4, 35, two aliens
        sw $t1, 8160($gp)
        
draw_3: sw $t1, 7912($gp) #level 3, 35, one aliens
        sw $t1, 8168($gp)
        
draw_2: sw $t1, 7920($gp) #level 2, 40, one aliens
        sw $t1, 8176($gp)
        
draw_1: jr $ra
        
dead:   li $t1, 0         
        
        sw $t1, 7928($gp) #level 1, 40
        sw $t1, 8184($gp)
        
        sw $t1, 7920($gp) #level 2, 40, one aliens, one more obstacle u
        sw $t1, 8176($gp)
        
        sw $t1, 7912($gp) #level 3, 35, one aliens, one more obstacle u and one obstacle t
        sw $t1, 8168($gp)
        
        sw $t1, 7904($gp) #level 4, 35, two aliens
        sw $t1, 8160($gp)
        
        sw $t1, 7896($gp) #level 5, 30, two aliens
        sw $t1, 8152($gp)
        
        jr $ra


update_difficulty: #update the difficulty accroding to the time
        li $v0, 40 #lv1
        ble $v1, 650, is_1
        ble $v1, 1300, is_2
        ble $v1, 2042, is_3
        ble $v1, 2784, is_4
        
is_5:   addi $v0, $v0, -5 #lv5
is_4:   addi $s4, $zero, 2  #lv4
is_3:   addi $v0, $v0, -5 #lv3
is_2:   addi $s4, $zero, 1  #lv2
        
is_1:   jr $ra
