class User < ActiveRecord::Base
  attr_accessible :email, :name, :zodiac_chinese, :zodiac_west

  validates :name, :presence => true
  validates :email, :presence => true

  validates :zodiac_west, :inclusion => {
    :in => %w{Aries Taurus Gemini Cancer Leo Virgo
              Libra Scorpio Saggitarius Capricorn Aquarius Pisces} + [nil],
    :message => "Please enter a valid zodiac sign."
  }
  validates :zodiac_chinese, :inclusion => {
    :in => %w{Rat Ox Tiger Rabbit Dragon Snake
              Horse Goat Monkey Rooster Dog Pig} + [nil],
    :message => "Please enter a valid Chinese zodiac sign."
  }

  has_many :luvings, foreign_key: "luver_id"
  has_many :luved, :through => :luvings, :source => :luved

  has_many :received_luvings, foreign_key: "luved_id", class_name: "Luving"
  has_many :luved_by, :through => :received_luvings, :source => :luver

  before_validation do |user|
    user.zodiac_west = user.zodiac_west.capitalize unless user.zodiac_west.nil?
    user.zodiac_chinese = user.zodiac_chinese.capitalize unless user.zodiac_chinese.nil?
  end

  after_validation do |user|
    user.name = user.name.titleize
  end

  def give_luv_to(user, comment=nil)
    self.luvings.create :luved_id => user.id, :comment => comment
  end

  def luvs_given
    self.luvings.count
  end

  def luvs_received
    self.received_luvings.count
  end

  def luvs_to(user)
    self.luvings.where(:luved_id => user.id)
  end

  def luvs_from(user)
    self.received_luvings.where(:luver_id => user.id)
  end

end
