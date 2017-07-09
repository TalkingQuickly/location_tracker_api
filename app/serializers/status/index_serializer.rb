module Status
  class IndexSerializer
    def initialize(user)
      @user = user
    end

    def to_h
      {
        last_point: last_point,
        total_points: total_points,
        points_last_24h: points_in_last_24h
      }
    end

    private

    attr_reader :user

    def points_in_last_24h
      user
        .locations
        .where('created_at > ?', Time.now - 24.hours)
        .count
    end

    def total_points
      user.locations.count
    end

    def last_point
      user
        .locations
        .order('id desc')
        .first
        .created_at
    end
  end
end
