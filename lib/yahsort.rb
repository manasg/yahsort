require "yahsort/version"

module Yahsort
  # dig should indicate the 'digits'
  # sec is secondary idx, number based match is done on same secondaries
  # db1 api2 ==> api2, db1
  
  PATTERN = %r{(?<sec>\D)(?<dig>\d+)$}
  
  def self.sorter(regex=PATTERN, secondary_precedence=true)
    
    sorter = lambda do |x,y|
      reg = regex

      mX = reg.match(x)
      mY = reg.match(y)
      
      if (nil == mX) || (nil == mY)
        # fallback to default comparison
        return x <=> y
      end

      dX = mX[:dig].to_i
      secondaryX = mX[:sec]
      
      dY = mY[:dig].to_i
      secondaryY = mY[:sec]

      return dX <=> dY unless secondary_precedence

      #sort on digits if secondary is same
      if secondaryX == secondaryY
        return dX <=> dY
      else
        return x <=> y
      end
    end
  
    return sorter
  end
end
