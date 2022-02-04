PAIRS = [%w(b o), %w(g t), %w(v i), %w(x k), %w(r e), %w(l y), %w(d q), %w(f s), 
          %w(z m), %w(c p), %w(j w), %w(n a), %w(h u)]


# LS solution much prettier; good use of #count and #none?
def block_word?(str)
  valid = PAIRS.clone
  str.downcase.chars.each do |c|
    if valid.flatten.include?(c)
      valid = valid.reject { |pair| pair.include?(c) }
    else
      return false
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true