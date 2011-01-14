class BowlingScorer
  def score(throws)
    throws.inject(0) { |s,e| s+e }
  end
end
