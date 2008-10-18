require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Search do
  before(:each) do
    @artist = Artist.generate :title => "Tom Waits"
    @song   = Song.generate   :title  => "Innocent When You Dream"
    @lyric  = Lyric.generate  :song_id => @song.id,
                              :text => "The bats are in the belfry the dew is on
                                       the moor where are the arms that held me
                                       and pledged her love before and pledged
                                       her love before It's such a sad old
                                       feeling the fields are soft and green
                                       it's memories that I'm stelaing but
                                       you're innocent when you dream when you
                                       dream you're innocent when you dream
                                       running through the graveyard we laughed
                                       my friends and I we swore we'd be
                                       together until the day we died until the
                                       day we died I made a golden promise that
                                       we would never part I gave my love a
                                       locket and then I broke her heart and
                                       then I broke her heart"
  end

  it "should generate a valid search" do
    search = Search.generate
    search.should be_valid
  end

  it "should have a results method" do
    search = Search.generate
    search.should respond_to(:results)
  end

  describe "results method" do

    it "should have an artists component" do
      search = Search.generate :keywords => "tom"
      search.results[:artists].should be_a_kind_of(Array)
    end

    it "should find artists by name" do
      search = Search.generate :keywords => "tom"
      search.results[:artists].should include(@artist)
    end

    it "should not find artists with the wrong name" do
      search = Search.generate :keywords => "bill"
      search.results[:artists].should_not include(@artist)
    end

    it "should have a songs component" do
      search = Search.generate :keywords => "dream"
      search.results[:songs].should be_a_kind_of(Array)
    end

    it "should find songs by title" do
      search = Search.generate :keywords => "dream"
      search.results[:songs].should include(@song)
    end

    it "should not find songs with the wrong title" do
      search = Search.generate :keywords => "sex"
      search.results[:songs].should_not include(@song)
    end

    it "should have a lyrics component" do
      search = Search.generate :keywords => "golden promise"
      search.results[:lyrics].should be_a_kind_of(Array)
    end

    it "should find lyrics by words" do
      search = Search.generate :keywords => "golden promise"
      search.results[:lyrics].should include(@lyric)
    end

    it "should not find lyrics with non-words" do
      search = Search.generate :keywords => "monkey balls"
      search.results[:lyrics].should_not include(@lyric)
    end
  end

end
