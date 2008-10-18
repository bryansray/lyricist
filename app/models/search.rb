class Search < ActiveRecord::Base
  def results
    @results ||= find_results
  end

  def find_results
    returning Hash.new([]) do |results|
      keywords.split.each do |keyword|
        results[:artists] += Artist.find(:all, :conditions => [ "title LIKE ?", "%#{keyword}%" ])
        results[:songs]   += Song.find(:all, :conditions => [ "title LIKE ?", "%#{keyword}%" ])
      end
      results[:lyrics] += Lyric.find_fulltext keywords
      results.values.map(&:uniq!)
    end
  end
end
