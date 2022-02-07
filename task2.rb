def uniq_words(text)
  uniq_words = {}
  text = text.gsub(/[^a-z0-9\s]/i, '').split
  return [] if text.length < 3
  text.each do |word|
    word = word.downcase
    if uniq_words.has_key?(word)
      uniq_words[word] = uniq_words[word] + 1
    else
      uniq_words[word] = 1
    end
  end
  uniq_words.sort_by {|k,v| -v}.flatten.delete_if { |el| el.is_a?(Integer) }.slice(0..2)
end

p uniq_words("Lorem lorem if")