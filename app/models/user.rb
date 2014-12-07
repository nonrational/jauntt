class User < ActiveRecord::Base
  before_create :set_default_language

  private

  def set_default_language
    self.language = 'en' unless self.language
  end
end
