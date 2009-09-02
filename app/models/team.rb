class Team < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "Não pode ser vazio"
end
