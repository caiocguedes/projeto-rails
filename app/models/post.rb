	# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  title              :string
#  body               :text
#  description        :text
#  slug               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  banner_image_url   :string
#  author_id          :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime	
#  published          :boolean          default(FALSE)
#  published_at       :datetime
#

class Post < ApplicationRecord
	acts_as_paranoid
	
	extend FriendlyId
	friendly_id :title, use: :slugged

	belongs_to :author

	scope :most_recent, -> { order(published_at: :desc) }
	scope :published, -> {where(published: true)}

	def should_generate_friendly_id?
		title_changed?
	end

	def display_day_published
		if published_at.present?	
			"Publicado em #{published_at.strftime('%-d/%-b/%Y')}"
		else
			"Ainda não foi publicado."

		end
	end

	def publish
	    update(published: true, published_at: Time.now)
	  end

	  def unpublish
	    update(published: false, published_at: nil)
	  end
  
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |post|
	      csv << post.attributes.values_at(*column_names)
	    end
	  end
	end
end
