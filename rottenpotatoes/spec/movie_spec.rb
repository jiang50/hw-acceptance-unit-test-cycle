require 'rails_helper'
 describe MoviesController, :type => :controller do
    
    before(:each) do
        @m1 = Movie.create(title: "M1",rating: "G",director: "Alex",release_date: 20150101)
        @m2 = Movie.create(title: "M2",rating: "PG",director: "Bryan",release_date: 20160101)
        @m3 = Movie.create(title: "M3",rating: "R",director: "Bryan",release_date: 20170101)
        @m4 = Movie.create(title: "M4",rating: "R",release_date: 20180101)
    end

     describe "#new" do
        it "new movie" do
            get :new,  movie_id: @m1[:id]
            expect(Movie.find(@m1.id)[:title]).to eq("M1")
            expect(response).to render_template(:new)
        end
    end
    
    describe "#delete" do
        it "delete movie" do
            expect{ delete :destroy, id: @m2[:id]}.to change{Movie.all.count}.by(-1)
        end 
    end
    
    describe "with same director action" do
      it "return if director exists" do
            # get :similar,  id: @m3[:id]
            # expect(Movie.where(:director => @m3.director).size).to eq(2)
            expect(Movie.same_director(@m2[:title])).to eql(['M2','M3'])
      end
      
      it "return if director does not exist" do
          expect(Movie.same_director(@m4[:title])).to eql(nil)
      end
    end
    
    describe '.all_ratings' do
        it 'returns all ratings' do
            expect(Movie.all_ratings).to match(%w(G PG PG-13 NC-17 R))
        end
    end
    
end 