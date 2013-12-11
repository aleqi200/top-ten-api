class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	after_filter :set_access_control_headers

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

	def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
        headers['Access-Control-Max-Age'] = "1728000"
	end
end
