Rails.application.routes.draw do
  root 'calc#input'
  get 'calc/output'
end
