module User::Auth

  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  #с помощью ActiveSupport::Concern подключит все внутри include на уровне класса
  include do
    validates :email, presence: true
    validates :password, presence: true
    #Одновременно создает метод ридер для password_cofirmation и проверяет его соответствие полю password
    validates :password, confirmation: true
  end

  def authentificate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      #Почему не = digest(@password)
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
