class Waiter
    @@all = []
    attr_reader :name, :years_experience
    def initialize(name, years_experience)
        @name = name
        @experience = years_experience
        @@all << self
    end

    def self.all()
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals()
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper()
        tip_array = []

        max_tip = Meal.all.map { |meal| meal.tip}.max #=> this returns max tip number.

        Meal.all.each do |meal| 
        if meal.tip == max_tip
            return meal.customer
        end
    end
    end
end