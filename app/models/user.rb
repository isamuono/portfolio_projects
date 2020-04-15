class User < ApplicationRecord
  validates :role, presence: true
  validates :family_name, presence: true, length: { maximum: 15 }
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :accountName, presence: true
  validates :email, presence: true#, uniqueness: true
  #, format: { with: /\A[A-Za-z0-9._+]+@[A-Za-z]+\.[A-Za-z]+\z/ }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #format: { with: VALID_EMAIL_REGEX },
                    #uniqueness: { case_sensitive: false }
  
  has_secure_password
  #PW_REGEX = /\A(?=.?[a-z])(?=.?\d)[a-z\d]{8,20}+\z/i  ⬅️テストユーザー作成時のパスを簡単にするため
  #validates :password, format: {with: PW_REGEX}
  
  validates :image, presence: false
  validates :description, presence: false, length: { maximum: 255 }
  validates :remember_digest, presence: false
  
  has_many :communities
  has_many :roles
  has_many :invitations
  
  
  attr_accessor :remember_token, :activation_token #インスタンスメソッドremember_token, activation_tokenの
                                                   #セッターとゲッターを一括指定
  
  #＜永続的ログイン機能＞
  before_save   :downcase_email
  # 有効化トークンや有効化ダイジェストはユーザーオブジェクトが作成される前に作成しておく必要がある
  before_create :create_activation_digest
  
  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # 永続セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token #インスタンスメソッドのremember_token(24行目)が呼ばれる
    update_attribute(:remember_digest, User.digest(remember_token)) #記憶ダイジェストの更新
  end
  
  # 渡されたトークンがremember（もしくはアカウント有効化）ダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)   # attributeにrememberかactivateが入る
    digest = send("#{attribute}_digest") # モデルの属性である〜_digestにアクセス
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  #＜ユーザー有効化メソッド＞
  # アカウントを有効にする
  def activate
    #update_attribute(:activated,    true)
    #update_attribute(:activated_at, Time.zone.now)
    #                   ⬇️
    update_columns(activated: FILL_IN, activated_at: FILL_IN)
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now #()内の@userを => self に
  end
  
  private
    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = self.email.downcase
    end
    
    # 有効化トークンとダイジェストを作成および代入する
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
      # @user.activation_digest => ハッシュ値が入る
    end
end
