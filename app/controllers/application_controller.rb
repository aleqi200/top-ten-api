class ApplicationController < ActionController::API
	include ActionController::MimeResponds

	def attributify(key, unprocessed=params[key])
		if unprocessed.is_a? Hash
			specific_params = {}
			unprocessed.each do |k,v|
				if (v.is_a?(Hash) && !k.to_s.match(/_attributes$/)) or (v.is_a?(Array) && !k.to_s.match(/_ids$/))
					# Nested, so suffix with '_attributes'
					specific_params["#{k}_attributes".to_sym] = attributify(key, v)
				else
					specific_params[k] = v
				end
			end
			return specific_params
		elsif unprocessed.is_a? Array
			unprocessed.map do |p| attributify(key, p) end
		else
			unprocessed
		end
	end
end
