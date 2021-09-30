require 'set'

class Wordchainer
    attr_reader :dictionary

    def initialize(file_name = "dictionary.txt")
        @dictionary = File.readlines(file_name).map(&:chomp)
        @dictionary = Set.new(@dictionary)
    end

    def adjacent_words(word)
        same_lengths = @dictionary.select {|d_word| d_word.length == word.length}
        similar_words = same_lengths.select {|d_word| one_letter_diff(d_word, word)}
        similar_words
    end

    def one_letter_diff(d_word, word)
        i = 0
        count_matches = 0
        while i < word.length
            count_matches += 1 if d_word[i] == word[i]
            i += 1
        end
        count_matches == word.length - 1
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = {source => nil}

        until @current_words.empty?
            break if @all_seen_words.has_key?(target)
            explore_current_words
        end

        build_path(target)
    end

    def explore_current_words
        new_current_words = []
        @current_words.each do |current_word|
            adjacent_words(current_word).each do |adjacent_word|
                if !@all_seen_words.has_key?(adjacent_word)
                    new_current_words << adjacent_word
                    @all_seen_words[adjacent_word] = current_word
                end
            end
        end
        @current_words = new_current_words
    end

    def build_path(target)
        return "" if target == nil
        build_path(@all_seen_words[target]) + "-" + target
    end


end