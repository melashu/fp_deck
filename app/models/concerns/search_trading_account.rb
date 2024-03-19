class SearchTradingAccount
    def self.call(query_data)
      scopes = []
      user_name_scope = query_data[:user_name].present? ? { user: { user_name: query_data[:user_name] } } : {}
      user_type_scope = query_data[:user_type].present? ? { user_type: query_data[:user_type] } : {}
      phase_scope = query_data[:phase].present? ? { phase: query_data[:phase] } : {}
  
     if user_type_scope[:user_type] == "all" 
       user_type_scope[:user_type] = ["standard", "algo", "competition"] 
     end

     if phase_scope[:phase] == "all"
       phase_scope[:phase] = ["student", "practitioner", "master"]
     end

       status_scope = query_data[:status_id].present? ? { status_id: query_data[:status_id]} : {}
       started_scope = query_data[:started].present? ? { started: query_data[:started] } : {}
       ended_scope = query_data[:ended].present? ? { ended: query_data[:ended] } : {}
  
    if query_data[:account_size_from].present? && query_data[:account_size_to].present?
      account_size_from_scope = {size: query_data[:account_size_from]..query_data[:account_size_to]}
      scopes << account_size_from_scope
    end
  
    if query_data[:balance_from].present? && query_data[:balance_to].present?
      balance_scope = {balance: query_data[:balance_from]..query_data[:balance_to]}
      scopes << balance_scope
    end
      scopes << user_name_scope
      scopes << user_type_scope
      scopes << phase_scope
      scopes << status_scope
      scopes << started_scope
      scopes << ended_scope
     scopes
    end
end