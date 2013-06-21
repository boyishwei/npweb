module OrdersHelper
    def md5Generater(v_amount,v_moneytype,v_oid,v_mid,v_url,key)
	md5str = v_amount.to_s + v_moneytype + v_oid.to_s + v_mid + v_url + key 	
	puts "dadaadadadadddddddddddddddddddddddddddddddd"
	puts md5str
	puts "dadaadadadadddddddddddddddddddddddddddddddd"
	md511 = Digest::MD5.hexdigest(md5str).upcase
	#puts md511
    end
end
