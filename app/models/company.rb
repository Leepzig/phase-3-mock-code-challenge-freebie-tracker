class Company < ActiveRecord::Base
  has_many :freebies
  has_many :devs, through: :freebies

  #it works!
  def give_freebie(dev, item_name, value)
    item = {item_name: item_name, value: value, dev_id:dev.id, company_id: self.id}
    Freebie.create(item)
  end

# It works!
  def self.oldest_company
    self.order(:founding_year).limit(1)
  end
end
