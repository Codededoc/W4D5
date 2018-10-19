# == Schema Information
#
# Table name: goals
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer          not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#

class Goal < ApplicationRecord
  validates :title, presence: true

  belongs_to :users,
    primary_key:  :id,
    foreign_key:  :user_id,
    class_name: :User


end
