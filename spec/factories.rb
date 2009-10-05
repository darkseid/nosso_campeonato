#
# Times
#
Factory.define :corinthians, :class => Team do |t|
  t.name 'Corinthians'
end

Factory.define :sao_paulo, :class => Team do |t|
  t.name 'Sao Paulo'
end

Factory.define :santos, :class => Team do |t|
  t.name 'Santos'
end

Factory.define :palmeiras, :class => Team do |t|
  t.name 'Palmeiras'
end

Factory.define :internacional, :class => Team do |t|
  t.name 'Internacional'
end

Factory.define :gremio, :class => Team do |t|
  t.name 'Gremio'
end


#
# Jogos
#
Factory.define :match_one, :class => Match do |m|
  m.association :home, :factory=> :corinthians
  m.home_score 3
  m.association :visitor, :factory=> :santos
  m.visitor_score 1
end

Factory.define :match_two, :class => Match do |m|
  m.association :home, :factory=> :palmeiras
  m.home_score 1
  m.association :visitor, :factory=> :sao_paulo
  m.visitor_score 0
end

Factory.define :match_winners_1_2, :class => Match do |m|
  m.association :home, :factory=> :corinthians
  m.home_score 0
  m.association :visitor, :factory=> :palmeiras
  m.visitor_score 0
end