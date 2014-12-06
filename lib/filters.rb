module Filters
end

Dir[Rails.root.join("lib/filters/*.rb").to_s].each { |f| require f }
