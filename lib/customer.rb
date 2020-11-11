class Customer
    attr_reader :name, :age
    @@all = []
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all()
        @@all
    end

    def new_meal(waiter, total, tip = 0)
        Meal.new(waiter, self, total, tip) #self refers to customer here
    end

    def meals
        Meal.all.select{|meal| meal.customer == self}
    end

    def waiters
        Meal.all.select{|meal| meal.customer == self}.map{|meal| meal.waiter}
    end
end