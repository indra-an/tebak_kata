class Game
    def initialize
        @words = [] 
        @words[0] = ["bantal", "kaca", "pintu"]
        @words[1] = ["handphone", "bajigur", "lentera"]
        @score = 0
        @level = 0
    end
    
    def start
        @words[@level].shuffle.each_with_index do |word, i|
            puts "Tebak kata: " + random_word(word)
            input_word(word)
        end
    end

    def input_word(correct_word)
        print "Jawab: "
        w = gets
        unless w.nil?
            unless valid_word?(w.chomp, correct_word)
                puts "SALAH! Silahkan coba lagi"
                input_word(correct_word)
            else
                show_point
            end
        end
    end

    def show_point
        total_score = @words.map(&:size).inject(0, :+)
        if get_score == @words[@level].size || get_score == total_score
            if get_score == total_score
                puts "SELAMAT, anda menang!"
            else
                puts 
                puts "SELAMAT, anda berhasil naik ke level #{get_level}!"

                start
            end
        else
            puts "BENAR, point anda : #{get_score}!"
        end
    end

    def random_word(word)
        rand_word = word.split('').shuffle.join('')
    
        if(word == rand_word)
            random_word(word)
        else
            rand_word
        end
    end

    def valid_word?(word, correct_word)
        result = correct_word === word.downcase
        @score +=1 if result
        @level+= 1 if @score == @words[@level].size

        result
    end

    def get_score
        @score
    end

    def get_level
        @level + 1
    end
        
end