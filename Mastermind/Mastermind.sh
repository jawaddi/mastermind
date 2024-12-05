#!/bin/sh

#==========================================================================
#student: JAWAD AIT LHADJ LAMIN                              
#N.Apogee: 18002007                                                       #Email:jawadlamin83@gmail.com                                                           #skills:js,html,css
#bigenner:py,php
#==========================================================================    
#================ files the game ===========================================
#  files :                                                                 =
#          -Mastermind2019.sh==> main script                               =
#          -winer_simple_level.txt==> contains the winers in level simple  =
#          - winer.txt ==>contains the winers in game                      =
#          -p_souvg.txt      ==> souvgarder the part of game the player    =
#          -
#================ files the game ===========================================

#================= simple level ===========================================
#=== fun random_combination() gives us combination consistes from 4numbers=
#=== fun Saisircombi() keyboard                                           =
#=== fun testcombi() content  2 fun test1() and fun test2() for test      =
#=== fun afficheplateau() showing combinatios's player and gives score    =
#=== fun Login() this function as background's the game                   =
#=== fun New_game() allows to creat new_game or new account               =
#=== fun player() and check_user() check if player exist or not           =
#================= simple level ===========================================

#================= hard level =============================================
#=== check_winer() check if this player wined in simple level or not      =
#=== fun hard_level() this function contains :                            =
#        --hard_combination() gives combination 5 numbers                 = 
#        --enter_hard_combination() keyboard 5 numbers                    =
#        --test1_hard() test                                              =
#        -- hard_sco_re() showing combination's player and score          =
#================= hard level =============================================

#======== roule the game =============

#========function give us random combinarion ==============
random_combination () {
v1=$(shuf -i0-9 -n1)
v2=$(shuf -i0-9 -n1)
v3=$(shuf -i0-9 -n1)
v4=$(shuf -i0-9 -n1)
while [ $v1 -eq $v2 -o $v1 -eq $v3 -o $v1 -eq $v4 -o $v2 -eq $v3 -o $v2 -eq $v4 -o $v3 -eq $v4 ]
do
v1=$(shuf -i0-9 -n1)
v2=$(shuf -i0-9 -n1)
v3=$(shuf -i0-9 -n1)
v4=$(shuf -i0-9 -n1)
done
#echo "# arragement $v1 $v2 $v3 $v4">> plyer
 
}
# =======Start fonction saisircombi=======
Saisircombi () {
a=2
while [ "$a" != 0 ]
do
while [ "$a" != 0 ]
do
echo "enter your combination (4 numbers) :"
read n1 n2 n3 n4
case $n1 in
   [0-9])
        case $n2 in
          [0-9])
                  case $n3 in
                       [0-9])
                          case $n4 in
                             [0-9])
                             echo $n1 $n2 $n3 $n4
                             a=0
                             ;;
                            *) echo "invalid";;
                             esac
                       ;;
                     *) echo "invalid";;
                       esac
            ;;
          *) echo "invalid";;
         esac
    ;;
   *) echo "invalid";;
   esac
  done
   if [ $n1 -eq $n2 -o $n1 -eq $n3 -o $n1 -eq $n4 -o $n2 -eq $n3 -o $n2 -eq     $n4 -o $n3 -eq $n4 ]
   then
   echo "invalide"
   a=2
   else
   echo "valide"
   a=0
   fi 
#echo "                             $n1 :$n2 :$n3 :$n4" >>test.txt
done
}


# =======End fonction saisircombi=======

#==================================================
# ============= Start test =======
testcombi(){
test1() {
t=0
if [ "$v1" -eq "$n1" ] 
then 
t=$(( t + 1 ))
 fi

if [ "$v2" -eq "$n2" ]
then
t=$(( t+1 ))
fi

if [ "$v3" -eq "$n3" ]
then
t=$(( t+1 ))
fi

if [ "$v4" -eq "$n4" ]
then
t=$(( t+1 ))
fi
echo "                                                 T=$t "
}



test2() {
v=0
# index 1
if [ "$v1" -eq "$n2" ]
then
v=$(( v + 1 ))
fi

if [ "$v1" -eq "$n3" ]
then
v=$(( v+1 ))
fi

if [ "$v1" -eq "$n4" ]
then
v=$(( v+1 ))
fi


# index 2
if [ "$v2" -eq "$n1" ]
then
v=$(( v + 1 ))
fi

if [ "$v2" -eq "$n3" ]
then
v=$(( v+1 ))
fi

if [ "$v2" -eq "$n4" ]
then
v=$(( v+1 ))
fi

# index 3
if [ "$v3" -eq "$n1" ]
then
v=$(( v + 1 ))
fi

if [ "$v3" -eq "$n2" ]
then
v=$(( v+1 ))
fi

if [ "$v3" -eq "$n4" ]
then
v=$(( v+1 ))
fi


# index 4
if [ "$v4" -eq "$n1" ]
then
v=$(( v + 1 ))
fi

if [ "$v4" -eq "$n2" ]
then
v=$(( v+1 ))
fi
if [ "$v4" -eq "$n3" ]
then
v=$(( v+1 ))
fi
echo "                                                 V=$v "
}
test1
test2
}
#================ End test========================

#===============contunue level======================
i=1
score=0
contunue (){
echo "\t\t\tplayer\t:score\t:try\t:combination"
grep $user -w p_souvg.txt|tail -9|cut -d: -f1-4
v1=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f1`
v2=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f2`
v3=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f3`
v4=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f4`
   i=`grep $user p_souvg.txt|tail -1| cut -d: -f3`
   i=$(( i + 1))
score=`grep $user p_souvg.txt|tail -1| cut -d: -f2`
}
#===============contunue level======================
  
#=============== function afficheplateau==========

afficheplateau () {

while [ $i -lt 10 ]
do

echo "================== Try $i ===================="
          
          Saisircombi
echo "\t\t\tplayer\t:score\t:try\t:combination"
#grep $user -w souvgarder/p_souvg.txt|tail -3|cut -d: -f1-4
echo "\t\t\t$user\t:$score\t:$i\t:$n1/$n2/$n3/$n4"
         
echo '\t\t'$user'\t:'$score'\t:'$i'\t:'$n1'/'$n2'/'$n3'/'$n4'\t:'$v1'/'$v2'/'$v3'/'$v4 >>data.txt 
          testcombi
          if [ $t = 4 ]
          then
          score=$(( score + 1 ))
          if [ $score -eq 5 ]
          then
        echo "$user:$password:$score:`date`">>winer_simple_level.txt  # here we get the winers in the simple level
              fi
          echo "\tyour score=$score"
           random_combination
           fi
          while [ $i -lt 10 ]
          do
          b=2
          i=$(( i + 1 ))
          while [ $b != 1 ]
          do
          echo "1-try[$i]  2-logout"
          read ti
          case $ti in
          1)
          
          echo "================== Try $i ===================="
          
          Saisircombi
echo "\t\tplayer\t:score\t:try\t:combination"
#grep $user -w souvgarder/p_souvg.txt|tail -3|cut -d: -f1-4
echo '\t\t'$user'\t:'$score'\t:'$i'\t:'$n1'/'$n2'/'$n3'/'$n4'\t:'$v1'/'$v2'/'$v3'/'$v4 >>data.txt
          cut -d: -f1-4 data.txt
          testcombi
              if [ $t = 4 ]
              then
              score=$(( score + 1 ))
              echo "your score=$score" 
              random_combination
              fi
              if [ $score -eq 5 ]
              then
        echo "$user:$password:$score:`date`">>winer_simple_level.txt  # here we get the winers in the simple level
              fi

           b=1
          ;;
          2)
           #if `grep $user test.txt = $user`  
           cat data.txt >>p_souvg.txt # souvgarder 
           rm data.txt 
           Login
          ;;
          esac
          done
          done
break
done
 echo "========*** your score $score 👏️***========="
 while :
     do
     echo 
     echo "[1]strat   [2]logout"
     read option
     case $option in
          1)
          afficheplateau
          ;;
          2) Login
          ;;
          esac

     done
}
#==================== End function affichepalteau====================
#==========================================================================================================
#========== hard_level===============
hard_level(){
# start hard_combination 5 numbers
hard_combination () {
       var1=$(shuf -i0-9 -n1)
       var2=$(shuf -i0-9 -n1)
       var3=$(shuf -i0-9 -n1)
       var4=$(shuf -i0-9 -n1)
       var5=$(shuf -i0-9 -n1)
while [ $var1 -eq $var2 -o $var1 -eq $var3 -o $var1 -eq $var4 -o $var1 -eq $var5 -o $var2 -eq $var3 -o $var2 -eq $var4 -o $var2 -eq $var5 -o $var3 -eq $var4 -o $var3 -eq $var5 -o $var4 -eq $var5 ]
   do
   var1=$(shuf -i0-9 -n1)
   var2=$(shuf -i0-9 -n1)
   var3=$(shuf -i0-9 -n1)
   var4=$(shuf -i0-9 -n1)
   var5=$(shuf -i0-9 -n1)
   done
 
}
# end hard_combination 5 numbers
 
# start the function enter_hard_combynation
enter_hard_combination () {
a=2
while [ "$a" != 0 ]
do
while [ "$a" != 0 ]
do
echo "enter your combination(5numbers) :"
read n1 n2 n3 n4 n5
case $n1 in
   [0-9])
        case $n2 in
          [0-9])
                  case $n3 in
                       [0-9])
                          case $n4 in
                             [0-9])
                                   case $n5 in
                                   [0-9])
                                        echo $n1 $n2 $n3 $n4 $n5
                                        a=0
                                       ;;
                                   *)echo "invalide";;
                                    esac
                                  ;;
                            *) echo "invalid";;
                             esac
                       ;;
                     *) echo "invalid";;
                       esac
            ;;
          *) echo "invalid";;
         esac
    ;;
   *) echo "invalid";;
   esac
  done
   if [ $n1 -eq $n2 -o $n1 -eq $n3 -o $n1 -eq $n4 -o $n1 -eq $n5 -o $n2 -eq $n3 -o $n2 -eq  $n4 -o $n2 -eq $n5 -o $n3 -eq $n4 -o $n3 -eq $n5 -o $n4 -eq $n5 ]
   then
   echo "invalide"
   a=2
   else
   echo "valide"
   a=0
   fi 
#echo "                             $n1 :$n2 :$n3 :$n4 $n5" 
done
}
# end the function enter_hard_combynation

#============  test_hard =========
# test1_hard and test2_hard to check for bad arrangement and good arrangement
test1_hard () {
t=0
if [ "$var1" -eq "$n1" ] 
then 
t=$(( t + 1 ))
 fi

if [ "$var2" -eq "$n2" ]
then
t=$(( t+1 ))
fi

if [ "$var3" -eq "$n3" ]
then
t=$(( t+1 ))
fi

if [ "$var4" -eq "$n4" ]
then
t=$(( t+1 ))
fi

if [ "$var5" -eq "$n5" ]
then
t=$(( t+1 ))
fi

echo "                                                 T=$t "
}



test2_hard() {
v=0
# index 1
if [ "$var1" -eq "$n2" ]
then
v=$(( v + 1 ))
fi

if [ "$var1" -eq "$n3" ]
then
v=$(( v+1 ))
fi

if [ "$var1" -eq "$n4" ]
then
v=$(( v+1 ))
fi

if [ "$var1" -eq "$n5" ]
then
v=$(( v+1 ))
fi

# index 2
if [ "$var2" -eq "$n1" ]
then
v=$(( v + 1 ))
fi

if [ "$var2" -eq "$n3" ]
then
v=$(( v+1 ))
fi

if [ "$var2" -eq "$n4" ]
then
v=$(( v+1 ))
fi

if [ "$var2" -eq "$n5" ]
then
v=$(( v+1 ))
fi

# index 3
if [ "$var3" -eq "$n1" ]
then
v=$(( v + 1 ))
fi

if [ "$var3" -eq "$n2" ]
then
v=$(( v+1 ))
fi

if [ "$var3" -eq "$n4" ]
then
v=$(( v+1 ))
fi

if [ "$var3" -eq "$n5" ]
then
v=$(( v+1 ))
fi

# index 4
if [ "$var4" -eq "$n1" ]
then
v=$(( v + 1 ))
fi

if [ "$var4" -eq "$n2" ]
then
v=$(( v+1 ))
fi
if [ "$var4" -eq "$n3" ]
then
v=$(( v+1 ))
fi
if [ "$var4" -eq "$n5" ]
then
v=$(( v+1 ))
fi
#indix 5
if [ "$var5" -eq "$n1" ]
then
v=$(( v + 1 ))
fi

if [ "$var5" -eq "$n2" ]
then
v=$(( v+1 ))
fi
if [ "$var5" -eq "$n3" ]
then
v=$(( v+1 ))
fi
if [ "$var5" -eq "$n4" ]
then
v=$(( v+1 ))
fi

echo "                                                 V=$v "
}
#================ test_hard======
contunue_hard (){
echo "\t\t\tplayer\t:score\t:try\t:combination"
grep $winer -w p_souvg.txt|tail -9|cut -d: -f1-4
v1=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f1`
v2=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f2`
v3=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f3`
v4=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f4`
v5=`grep $user p_souvg.txt|tail -1| cut -d: -f5|cut -d/ -f5`
   i=`grep $user p_souvg.txt|tail -1| cut -d: -f3`
   i=$(( i + 1))
score=`grep $user p_souvg.txt|tail -1| cut -d: -f2`
}
i=1
score=0


hard_sco_re () {

while [ $i -lt 10 ]
do
echo "start hard_level "
echo "================== Try $i ===================="
          hard_combination
          enter_hard_combination
          echo "\t\tplayer \t:score\t:try\t:combination"
          echo "\t\t$user \t:$score\t:$i\t:$n1/$n2/$n3/$n4/$n5"
echo "\t\t$waner\t:$score\t:$i\t:$n1/$n2/$n3/$n4/$n5\t:$var1/$var2/$var3/$var4/$var5">>data.txt 
          test1_hard
          test2_hard
          if [ $t = 4 ]
          then
          score=$(( score + 1 ))
                    if [ $score = 5 ]
                    then 
                       # winres in hared level
                       echo "$winer:$score:`date`" >>winer.txt
                     fi
          echo "\tyour score=$score"
           hard_combination
           fi
          while [ $i -lt 10 ]
          do
          c=2
          i=$(( i + 1 ))
          while [ "$c" != 1 ]
          do
          echo "1-try [$i]  2-logout"
          read ti
          case $ti in
          1)
          
          echo "================== Try $i ===================="
          enter_hard_combination
echo "\t\tplayer \t:score\t:try\t:combination"
echo "\t\t$winer\t:$score\t:$i\t:$n1/$n2/$n3/$n4/$n5\t:$var1/$var2/$var3/$var4/$var5">>data.txt  
          cut -d: -f1-4 data.txt
          test1_hard
          test2_hard
              if [ $t = 5 ]
              then
              score=$(( score + 1 ))
              echo "your score=$score"
                     
              hard_combination
              fi
              if [ $score = 5 ]
              then 
      # winres in hared level
               echo "$winer:$score:`date`" >>winer.txt
              fi
             c=1
          ;;
          2)
           #if `grep $user test.txt = $user`  
            cat data.txt >>p_souvg.txt
           rm data.txt 
           Login
          ;;
          esac
          done
          done
break
done
}
hard_sco_re
 echo "========*** your score $score 👏️***========="
  while :
     do
     echo 
     echo "[1]strat   [2]logout"
     read option
     case $option in
          1)
          hard_sco_re
          ;;
          2) Login
          ;;
          esac

     done

}


# this function check if player winer in the previous level :
check_winer(){
   while :
         do
         echo "name_winer: "
         read winer
         echo "password: "
         read pass_word
      check_winer=`grep -w $winer winer_simple_level.txt| cut -d: -f1`
     check_pass_word=`grep -w $pass_word winer_simple_level.txt| cut -d: -f2`
     if [ "$winer" = "$check_winer" -a "$pass_word" = "$check_pass_word" ] # check winer 
          then 
          echo "you are login"
          touch data.txt
          break
         else
         while :
            do
            echo "you are not winer "
            echo "[1]login [2]simple_level" 
            read op
            case $op in
            1)
            check_winer
            break 
            ;; 
            2) 
            play
            ;;
            *)
             echo "invalide"
            ;;
            esac
            done
   fi
done 

}



#===========================End hard_level=================================
#==========================================================================================================

#=============================================== system the game ===========================================
#==================== function Login ====================
Login () {
  while :
       do
       #echo ------------------------
       #echo "**# MasterMind 2019 #**"
       #echo ------------------------
       echo "[1]-create game"
       echo "[2]-player"
       echo "[3]-hard_level"
       echo "[4]-exit"
       read choice
       case $choice in
1)
       New_game;;
2)
       play  # for player exist before
       
       #New_game
       ;;
3)
       check_winer
       hard_level
;;
4)     clear 
       echo "good bay"
       exit
       ;;
*)
       echo "ivalide number"
      
       esac
     done
}
#==================== End function Login ====================
#========= ========= ckeck user ========= ===================
check_user(){
while :
do
echo "username: "
read user
echo "password: "
read password
check_name=`cut -d: -f1 players.txt| grep -w $user`
check_password=`cut -d: -f2 players.txt| grep -w $password`
 if [ "$user" = "$check_name" -a "$password" = "$check_password" ] # check xist befoe 
   then 
   echo "you are login"
   touch data.txt
   break
   else
   echo "you are not login "
   fi
done 
}
#========= ========= ckeck user ========= ===================
#=============================================
#========= ========= function new game ========= ===================
New_game (){
while :
do 

   echo "enter your username !!! "
   read user
   name=`grep -w $user players.txt| cut -d: -f1` 
   if [ "$user" = "$name" ] # name xist befoe 
   then 
   echo "$user exist before"
   while :
   do
   echo "1-login  2-add game"
   read choice
   case $choice in
   1)
   check_user
   random_combination
   echo "start the game "
   afficheplateau
   New_game
   ;;
   2)
   New_game
   ;;
   *)
   echo "invalide"
   ;;
   esac
   done
   else
   echo "enter your password !!! "
   read password
   echo "about you !!! "
   read about_user
   echo "$user:$password:$about_user">> players.txt # get data from player
   touch data.txt
   #echo $user >data.txt
   random_combination
   echo "start the game "
   afficheplateau
   Saisircombi

   break
   fi
   #echo "password !!! "
   #read password
   #echo "$username:$password">> player
   break
done
}
#========= ========= New_game  ========= ===================
#=======================================================
#========= ========= play ========= ===================
play (){
while :
do
echo "username: "
read user
echo "password: "
read password
check_name=`grep -w $user players.txt| cut -d: -f1`
check_password=`cut -d: -f2 players.txt| grep -w $password`
if [ "$user" = "$check_name" -a "$password" = "$check_password" ] # check xist befoe 
   then 
   echo "you are login"
   touch data.txt
   while :
   do
   echo "1-start  2-contunue"
   read choice
   case $choice in
   1)
   random_combination
   echo "start the game "
   i=1
   afficheplateau
   Saisircombi
   ;;
   2) echo 
   echo "contunue the game"
   contunue
   afficheplateau
   Saisircombi
   ;;
   *)
   echo "invalide"
   ;;
   esac
   done

   else
   echo "you are not here "
   while :
   do
   echo "1-login  2-add game"
   read ch
   case $ch in
   1)
    play
   ;;
   2)
   New_game
   ;;
   *)
   echo "invalide";;
   esac
   done
   #break
   fi
done
}
#========= ========= play ========= ===================
#======== system the game =============

# run script 
echo "whelcome **MasterMind 2019** !!"
Login  # called function Login
