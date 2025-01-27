class Doctor
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment (patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select do |appt|
            appt.doctor.name == self.name
        end
    end

    def patients
        appointments.map do |appt|
            appt.patient
        end
    end
end