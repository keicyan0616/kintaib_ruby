class Attendance < ApplicationRecord
  belongs_to :user
  validates :worked_on, presence: true
  validate :check_started_at_exist
  validate :integrity_started_to_finished

  def check_started_at_exist
    if finished_at.present? && !started_at.present?
      errors.add(:finished_at, ":退社時間に対して、出社時間が入力されていません。")
    end
  end
  
  def integrity_started_to_finished
    if finished_at.present? && finished_at < started_at
      errors.add(:finished_at, ":退社時間より出社時間の方が遅い時間が入力されています。")
    end
  end
end