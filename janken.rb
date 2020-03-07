
# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player

    def get_input_hand
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets
         if input_hand =~ /^[0-2]+$/
            return input_hand.to_i
         else 
             return get_input_hand
         end
    end

    def hand
        input_hand = get_input_hand
        while input_hand > 2
            input_hand = get_input_hand
        end
        return input_hand
    end
end

  # 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
    def hand
        return rand(3).to_i
    end
end

  # プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
    def pon(player_hand, enemy_hand)
        janken = ["グー", "チョキ", "パー"]

        puts "相手の手は#{janken[enemy_hand]}です。"
        if player_hand == enemy_hand then
            return true
        end 
        if (player_hand == 0 && enemy_hand == 1) || (player_hand == 1 && enemy_hand == 2) || (player_hand == 2 && enemy_hand == 0)
            puts "あなたの勝ちです"
        else 
            puts "あなたの負けです"
        end 
        return false 
    end
end
player = Player.new
enemy = Enemy.new
janken = Janken.new
next_game = true

while next_game do
    next_game = janken.pon(player.hand, enemy.hand)
end
print("aaa")