class Atricle < ApplicationRecord
  belongs_to :user
  has_many :histories

  before_update :create_history

  def create_history
    hash = self.attributes
    history = self.histories.build title: hash['title'], body: hash['body']
    history.save
  end

end
