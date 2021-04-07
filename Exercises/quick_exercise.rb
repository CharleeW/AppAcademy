def retirement_funds(parents_age)
    childs_age = parents_age / 2
    childs_current_bank_funds = childs_age **2
    years_left = 65 - childs_age 
    childs_current_bank_funds * years_left
end

p retirement_funds(30)
p retirement_funds(50)