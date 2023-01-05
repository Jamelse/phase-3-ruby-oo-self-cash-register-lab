class CashRegister
  
  attr_accessor :total
  attr_reader :discount, :items, :transactions
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @transactions = []
  end
 
  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
   quantity.times do 
    self.items << title
   end
   self.transactions.push(price)
  end

  def apply_discount
    if @discount > 0
    discounted_total = @total * @discount/100
    @total = self.total - discounted_total
    "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
     self.total -= self.transactions.last
     self.transactions.pop
    if self.transactions == []
      self.total = 0.0
    end
  end
end
