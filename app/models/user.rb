class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true
  validates :gender, inclusion: {in: ['m', 'f', 'o'] }

  has_many :posts

  def self.male
    where(gender: 'm')
  end

  def self.female
    where(gender: 'f')
  end

  def self.at_least_18
    where("date(date_of_birth) <= ?", 18.years.ago.to_date)
  end

  # Note this ia a pretty bad example since the `age` column is not one
  # we'd actually use. It would instead be calculated from `date_of_birth`
  def self.avg_male_age_over_18
    male.at_least_18.average(:age)
  end
end
