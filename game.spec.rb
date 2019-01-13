load 'game.rb'  

game = Game.new

describe game do 
    before do
        @words = ["bantal", "kaca", "pintu"]
    end
    
    context "When testing input" do 
       
        it "should not be same as words" do 
            word = @words[0]
            random_word = nil
            10000.times.each do |i|
                random_word = game.random_word(word)
                break if random_word == word
            end

            expect(random_word).not_to eq(word)
        end

        it "should not increase the score" do 
            last_score = game.get_score
            game.valid_word?("antalb", @words[0])
            
            expect(game.get_score).to eq(last_score)
        end

        it "should be increase the score" do 
            new_score = game.get_score+1
            game.valid_word?("bantal", @words[0])

            expect(game.get_score).to eq(new_score)
        end

        it "should be increase the level" do 
            new_level = game.get_level+1
            valid = game.valid_word?("kaca", @words[1])
            valid = game.valid_word?("pintu", @words[2])

            expect(game.get_level).to eq(new_level)
        end
       
    end
 end