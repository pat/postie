class Locality
  attr_reader :postcode, :suburb, :state, :comments

  def initialize(row)
    @postcode = row["postcode"]
    @suburb   = row["suburb"]
    @state    = row["state"]
    @comments = row["comments"]
  end

  def serializable_hash
    {
      "postcode" => postcode,
      "suburb"   => suburb,
      "state"    => state,
      "comments" => comments
    }
  end
end
