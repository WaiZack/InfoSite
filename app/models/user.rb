class User < ApplicationRecord

  has_many :memberships
  has_many :teams, through: :memberships
  has_many :membership_requests


  attr_accessor :remember_token, :activation_token, :reset_token, :terms_and_conditions, :data_protection_policy
  before_save   :downcase_email
  before_create :create_activation_digest

  validates :institute, presence:true, length:{maximum: 50}

  validates :email, :email_format => { :message => 'is not looking valid' }, presence:true, length: { maximum: 255 },
      uniqueness: { case_sensitive: false , :message => 'this account already exists'}


  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  validates :terms_and_conditions, :acceptance=> {:message => "must be accepted" }

  validates :data_protection_policy, :acceptance => {:message => "must be accepted" }

  validates :firstName, :lastName, :specialization, :academic_level, presence: true


  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account.
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  private

  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Creates and assigns the activation token and digest.
  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end





end
