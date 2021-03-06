class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network 

  def actors_list
    self.actors.map{|a| a.full_name}
  end

  def build_network(call_letters:)
    nw = Network.create(call_letters: call_letters)
    self.network = nw 
  end #build_network
end