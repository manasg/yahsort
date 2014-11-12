module Yahsort
  def self.fqdn_sorter
    pattern =  Yahsort::PATTERN + '\.'
    regex = Regexp.new(pattern)
    
    self.sorter(regex=regex)
  end
end
