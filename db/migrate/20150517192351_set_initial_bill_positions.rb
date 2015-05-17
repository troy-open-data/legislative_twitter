class SetInitialBillPositions < ActiveRecord::Migration
  def up
    count = Hash.new(1)
    Bill.find_each do |bill|
      bill.position = count[bill.legislation_type]
      bill.save!
      count[bill.legislation_type] += 1
    end
  end

  def down
    Bill.find_each do |bill|
      bill.position = nil
      bill.save!
    end
  end
end
