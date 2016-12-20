#http://localhost:3000/products.json
json.products @products do |product|
  json.name product.name
  json.description product.description
end