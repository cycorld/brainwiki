class Nueron < ActiveRecord::Base
  after_create :generate_token

  has_many :active_links, class_name: "Synapse",
                          foreign_key: "origin_id",
                          dependent: :destroy
  has_many :passive_links, class_name: "Synapse",
                           foreign_key: "next_id",
                           dependent: :destroy
  has_many :next, through: :active_links, source: :next
  has_many :prev, through: :passive_links, source: :origin
  belongs_to :user

  validates :token, uniqueness: true
  validates :user_id, presence: true
  validates :title, presence: true
  validates :note, presence: true

  default_scope { where(is_valid: true) }

  private

  def generate_token
    update_column :token, SecureRandom.hex(6)
  rescue ActiveRecord::RecordNotUnique
    retry
  end
end
