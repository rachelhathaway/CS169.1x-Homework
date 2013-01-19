def combine_anagrams(words)
  # YOUR CODE HERE
  anagrams = []
  until words.length == 0
    word = [words.pop]
    words.reverse.each do |w|
      puts "word[0] : #{word[0]}"
      puts "w : #{w}"
      if are_anagrams?(word[0], w)
        puts "Popping: #{w}"
        word.push(w)
        words.delete(w)
      end
    end
    anagrams.push(word)
  end
  return anagrams
end

def are_anagrams?(one, two)
  return one.downcase.chars.sort.join == two.downcase.chars.sort.join
end

