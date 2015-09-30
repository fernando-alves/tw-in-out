class Punch::Register
  class << self
    def punch(user, attributes)
      a_new_punch_with(user, attributes).tap do |punch|
        punch.workday = workday(punch.time) if punch.time
      end
    end

    private

    def a_new_punch_with(user, attributes)
      Punch.new(attributes.merge(user_id: user.id))
    end

    def workday(time)
      Workday.find_or_create_by(day: time.to_date)
    end
  end
end
