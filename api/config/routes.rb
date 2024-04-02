Rails.application.routes.draw do
  post '/cards/grammar', to: 'cards#create', defaults: { card_type: 'grammar' }
  post '/cards/pronunciation', to: 'cards#create', defaults: { card_type: 'pronunciation' }
  post '/cards/vocab/noun', to: 'cards#create', defaults: { card_type: 'vocab_noun' }
  post '/cards/vocab/verb', to: 'cards#create', defaults: { card_type: 'vocab_verb' }
end
