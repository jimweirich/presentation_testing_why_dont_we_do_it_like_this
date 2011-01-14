require 'fabrication'

class Dog
  attr_accessor :head, :tail
  def to_s
    "<Dog head:#{head}, tail:#{tail}>"
  end
end

Fabricator(:dog) do
  head "HEAD"
  tail "TAIL"
end

dog = Fabricate(:dog)

puts dog
