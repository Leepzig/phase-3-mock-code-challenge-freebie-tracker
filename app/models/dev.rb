class Dev < ActiveRecord::Base

  has_many :freebies
  has_many :companies, through: :freebies

  # works, but returns nil when not found
  def received_one?(item_name)
   true if self.freebies.find_by(item_name:item_name)
  end

  #IT WORKS!
  def give_away(dev, freebie)
    #remove freebie from current dev
    freebie.dev.freebies.delete(freebie.id)
    #add freebie to new dev
    dev.freebies << freebie
  end

end
