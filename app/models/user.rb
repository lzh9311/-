class User < ApplicationRecord
    before_save {self.email = email.downcase}
    validates(  :name,presence:true,
                length:{maximum:50})
    
    # 邮件验证正则表达式
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates(  :email,presence:true,
                length:{maximum:200}, 
                format: { with:VALID_EMAIL_REGEX},
                uniqueness:{case_sensitive:false})
                        
    has_secure_password
    validates(:password,presence:true,length:{minimum:6},allow_nil:true)
end
