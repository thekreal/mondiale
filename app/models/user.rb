class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :trips, dependent: :delete_all
  has_many :inspirations
  has_many :trip_plans, dependent: :delete_all

  #  Callbacks and Validations
  before_save { email.downcase! }

  validates :name,      presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,     presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: {
                          case_sensitive: false,
                          message: "has already being registered"
                        }

  validates :password,  length: { in: 6..32 },
                        confirmation: true,
                        exclusion: {
                          in: lambda { |user| [user.email] },
                          message: "can not be the same as email"
                        }, unless: :updating_profile

  # Retrieve Gravatar from gravatar.com using user email
  def gravatar(size = 50)
    return "https://secure.gravatar.com/avatar/#{Digest::MD5::hexdigest(email)}?s=#{size}"
  end

  def inspiration_models(type)
    inspirations.where(inspirable_type: type).map(&:inspired_by)
  end

private

  def updating_profile
    !crypted_password.blank?
  end

end

