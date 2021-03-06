class Contact < ActiveRecord::Base
  has_many :phones
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  accepts_nested_attributes_for :phones

  # validates :firstname, presence: true
  # validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phones, length: { is: 3 }

  def name
    [firstname, lastname].join(' ')
  end

  def self.by_letter(letter)
    where("lastname LIKE ?", "#{letter}%").order(:lastname)
  end

end
