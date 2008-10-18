class Search < ActiveRecord::Base
  def results
    @results ||= find_results
  end

  def find_results
    returning Hash.new([]) do |results|
      keywords.split.each do |keyword|
        results[:artists] += Artist.find(:all, :conditions => [ "title LIKE ?", "%#{keyword}%" ])
        results[:songs]   += Song.find(:all, :conditions => [ "title LIKE ?", "%#{keyword}%" ])
        results[:lyrics]  += Lyric.find(:all, :conditions => [ "text LIKE ?", "%#{keyword}%"])
      end
      results.values.map(&:uniq!)
    end
  end
end
