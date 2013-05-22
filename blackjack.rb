# blackjack come on
def deal_card dealed_card,suit_value
  dealed_card.each do |element|
   while element==suit_value
     suit=["H","D","S","C"]
     suit_card=suit[rand(4)]
     value=["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
     card_value=value[rand(13)]
     suit_value=suit_card+card_value
   end
 end
 dealed_card<<suit_value
 return dealed_card	
end

def sum_card sum_worth,card_worth,times_playerA
  sum_worth=sum_worth+card_worth
  while sum_worth>21&&times_playerA!=0
    sum_worth=sum_worth-10
    times_playerA=times_playerA-1
  end
  return sum_worth
end

def get_value dealed_card,card_worth
  card_value=dealed_card.last
  card_value=card_value[1]
  if card_value=="A" 
    card_worth=11
  elsif card_value=="J"||card_value=="Q"||card_value=="K"
    card_worth=10
  else
    card_worth=card_value.to_i
  end
  return  card_worth
end

def judge_type sum_worth,result_type,player_name
  if sum_worth>21 
   result_type=0
 elsif sum_worth==21
   result_type=1
 else 
   puts"Can you stay or hit? #{player_name}"
 end
 return result_type
end

def judge_biger computer_worth,player_worth,result_type
  if computer_worth>player_worth 
   result_type=2
 elsif computer_worth<player_worth
   result_type=3
 else  
  result_type=4
end
return result_type
end

def uncover_result result_type,holder_name,holder_worth,player_worth,computer_worth
  if result_type==0
    puts "#{holder_name} is loser. brust .worth total is #{holder_worth}"
  elsif result_type==1
    puts "#{holder_name} is winner, hit 21."
  elsif result_type==2
    puts "Computer is bigger than #{player_name}.Computer is winner."
    puts "computer is #{computer_worth},#{player_name} is #{player_worth}"
  elsif result_type==3
    puts "#{player_name} is bigger than Computer.#{player_name} is winner" 
    puts "#{player_name} is #{player_worth},computer is #{computer_worth}"			
  elsif result_type==4
    puts "It\'s a tied."
  end
end

def show_card holder_name,player_name,player_card,computer_card
  if holder_name==player_name
    puts player_card
  elsif holder_name=="computer"
    puts computer_card
  else
   puts"#{player_name}\'s cards is #{player_card}.Computer\'s cards is #{computer_card}"
 end
end
puts"Hello What\'s your name?"
player_name=gets.chomp
puts"Lucky name #{player_name} Welcome"

dealed_card=["joker"]
suit_value="joker"
holder_name=player_name
times_value=0 
player_worth=0
computer_worth=0
card_worth=0
times_playerA=0
times_computerA=0
result_type=5
answer_card="yes"
holder_worth=0
player_card=[]
computer_card=[]

while times_value<4

  deal_card dealed_card,suit_value

  if times_value<2
    player_card<<dealed_card.last
    puts player_card
    if     
      player_card.last[1]=="A"
      times_playerA+=1
    end
    card_worth=get_value player_card,card_worth
    player_worth=sum_card player_worth,card_worth,times_playerA
    puts card_worth
    puts player_worth
    times_value+=1

  elsif 1<times_value
   computer_card<<dealed_card.last
   puts computer_card
   if computer_card.last[1]=="A"
     times_computerA+=1
   end
   card_worth=get_value computer_card,card_worth
   computer_worth=sum_card computer_worth,card_worth,times_computerA
   puts card_worth
   puts computer_worth
   times_value+=1
 end
 suit_value=dealed_card.last
end

if player_worth>21
 result_type=1
elsif player_worth==21
  result_type=2
end

while answer_card=="yes"&&result_type==5

  puts"Can you get another card?"
  answer_card=gets.chomp
  while answer_card!="yes"&&answer_card!="no"
   puts"pls answer me yes or no"
   answer_card=gets.chomp
 end

 if answer_card=="yes"
   deal_card dealed_card,suit_value
   player_card<<dealed_card.last
   while times_playerA[1]=="A"
    times_playerA+=1
  end

  card_worth=get_value player_card,card_worth
  player_worth=sum_card player_worth,card_worth,times_playerA
  puts player_card
  puts card_worth
  puts player_worth
  holder_worth=player_worth  


  if player_worth>21
   result_type=0
 elsif player_worth==21
  result_type=1
end

else
  holder_worth=computer_worth
  holder_name="computer"
  if computer_worth>21
    result_type=0
  elsif computer_worth==21
    result_type=1
  end
end
end

while computer_worth<17&&result_type==5
  holder_name="computer"
  deal_card dealed_card,suit_value
  computer_card<<dealed_card.last

  while times_computerA[1]=="A"
    times_computerA+=1
  end

  card_worth=get_value computer_card,card_worth
  computer_worth=sum_card computer_worth,card_worth,times_computerA
  puts card_worth
  puts computer_worth
  times_value+=1


  if computer_worth>21
    result_type=0
  elsif computer_worth==21
    result_type=1
  end
end

while result_type==5
  result_type=judge_biger computer_worth,player_worth,result_type
end

uncover_result result_type,holder_name,holder_worth,player_worth,computer_worth
show_card holder_name,player_name,player_card,computer_card	