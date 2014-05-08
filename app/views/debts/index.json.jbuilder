json.array!(@debts) do |debt|
  json.extract! debt, :id
  json.url debt_url(debt, format: :json)
end
