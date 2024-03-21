require 'rubygems'
require 'bundler/setup'
require 'HTTParty'
require 'byebug'

body = { action: 'deckNames', version: 6 }.to_json
headers = { 'Content-Type' => 'application/json' }
response = HTTParty.post(
  'http://localhost:8765',
  body: body,
  headers: headers
)
