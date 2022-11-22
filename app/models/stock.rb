class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:iex_api_key],
            secret_token: Rails.application.credentials.iex_client[:secret_token],
            endpoint: 'https://cloud.iexapis.com/v1')
        # client.quote(ticker_symbol).latest_price

        begin
            new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name,latest_price: client.quote(ticker_symbol).latest_price)
        rescue => exception
            return nil

        end

    
    end
end
