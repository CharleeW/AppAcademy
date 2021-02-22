class Bootcamp

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|h,k| h[k] = []}

    end

    #getters
    def name
        @name
    end
    def slogan
        @slogan
    end
    def student_capacity
        @student_capacity
    end
    def teachers
        @teachers
    end
    def students
        @students
    end

    def teachers=(new_teacher)
        @teachers << new_teacher
    end

    def hire(new_teacher)
        @teachers << new_teacher
    end

    def enroll(new_student)
        if students.length < student_capacity
            @students << new_student
            return true
        else
            return false
        end
    end

    def enrolled?(student_name)
        if students.include?(student_name)
            return true
        else
            return false
        end
    end

    def student_to_teacher_ratio
        return students.length / teachers.length
    end
    def add_grade(student, grade)
        if students.include?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end
    def num_grades(student)
        list = @grades[student] 
        return list.length
    end
    def average_grade(student)
        list = @grades[student] 
        if students.include?(student) && list.length > 0
            return avg = list.sum / list.length
        else
            return nil
        end
    end
end
