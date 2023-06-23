class Movie < ApplicationRecord
  require 'csv'

  validates :title, uniqueness: true, presence: true
  validates :description, length: { maximum: 500 }

  def self.import
    CSV.foreach(("lib/files/netflix_titles.csv"), headers: true) do |row|
    
    Movie.create!(
                    genre: row['type'],
                    title: row['title'],
                    country: row['country'],
                    published_at: row['date_added'],
                    year: row['release_year'],
                    description: row['description']
                  )
    end
  end
end
