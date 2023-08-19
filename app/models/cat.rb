# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'
class Cat < ApplicationRecord

    include ActionView::Helpers::DateHelper 

    CAT_COLORS = %w(Red Blue White Black)

    validates :birth_date, :color, :name, :sex, pressence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: { in: w%(M F) }

    def birth_date_cannot_be_future

        if birth_date.present? && self.birth_date > Date.today
            errors.add(:birth_date, "Birth date can not be in the future.")
        end

    end

    def age
        time_ago_in_words(self.birth_date)
    end

end
