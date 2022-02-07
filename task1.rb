def encrypt(text, n)
  return text if text.nil? || text.empty? || n <= 0
  encrypted_text = text.downcase
  evens = ""
  odds = ""
  (1..n).each {
    encrypted_text.each_char.with_index do |el, index|
      evens = evens + el if index.even?
      odds = odds + el if index.odd?
    end
    encrypted_text = odds + evens
    evens = ""
    odds = ""
  }
  encrypted_text
end

def decrypt(text, n)
  return text if text.nil? || text.empty? || n <= 0
  encrypted_text = text.downcase

  (1..n).each {
    odds = encrypted_text.slice(0..(encrypted_text.length/2)-1)
    evens = encrypted_text.slice(encrypted_text.length/2, encrypted_text.length)
    odds_index = 0
    evens_index = 0

    encrypted_text.each_char.with_index do |el, index|
      if index.even?
        encrypted_text[index] = evens[evens_index]
        evens_index = evens_index + 1
      else
        encrypted_text[index] = odds[odds_index]
        odds_index = odds_index + 1
      end
    end
  }
  encrypted_text
end

p encrypt("abcdefghijo", 4)
p decrypt("ejdichbgafo", 4)