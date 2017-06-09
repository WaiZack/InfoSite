class Slave < ApplicationRecord

  validates :email, :email_format => { :message => 'is not looking valid' }, presence:true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false , :message => 'this account already exists'}

  validates :name,:diet,:phone,:institute, presence:true

end
