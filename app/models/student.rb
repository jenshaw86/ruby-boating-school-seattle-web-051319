class Student
    attr_reader :first_name
    
    @@all = []

    def initialize(first_name)
        @first_name = first_name

        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def self.find_student(first_name)
        @@all.find {|student| student.first_name == first_name}
    end

    def grade_percentage
        # find student's total number of tests
        my_tests = BoatingTest.all.select {|test| test.student == self}
        num_tests = my_tests.count
        # find number of passing tests
        pass_tests = my_tests.select {|test| test.test_status == "passed"}
        num_pass_tests = pass_tests.count
        # return a percentage
        # binding.pry
        num_pass_tests/num_tests.to_f
    end
end
