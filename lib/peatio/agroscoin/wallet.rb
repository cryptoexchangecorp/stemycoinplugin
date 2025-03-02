module Peatio
  module stemycoin
    class Wallet < Peatio::Wallet::Abstract

      def initialize(settings = {})
        @settings = settings
      end

      def configure(settings = {})
        # Clean client state during configure.
        @client = nil

        @settings.merge!(settings.slice(*SUPPORTED_SETTINGS))

        @wallet = @settings.fetch(:wallet) do
          raise Peatio::Wallet::MissingSettingError, :wallet
        end.slice(:uri, :address)

        @currency = @settings.fetch(:currency) do
          raise Peatio::Wallet::MissingSettingError, :currency
        end.slice(:id, :base_factor, :options)
      end

      def create_address!(_options = {})
        { address: client.json_rpc(:getnewaddress) }
      rescue stemycoin::Client::Error => e
        raise Peatio::Wallet::ClientError, e
      end

      def create_transaction!(transaction, options = {})
        txid = client.json_rpc(:sendtoaddress,
                               [
                                 transaction.to_address,
                                 transaction.amount,
                                 '',
                                 '',
                                 options[:subtract_fee].to_s == 'true' # subtract fee from transaction amount.
                               ])
        transaction.hash = txid
        transaction
      rescue stemycoin::Client::Error => e
        raise Peatio::Wallet::ClientError, e
      end

      def load_balance!
        client.json_rpc(:getbalance).to_d

      rescue stemycoin::Client::Error => e
        raise Peatio::Wallet::ClientError, e
      end

      private

      def client
        uri = @wallet.fetch(:uri) { raise Peatio::Wallet::MissingSettingError, :uri }
        @client ||= Client.new(uri)
      end
    end
  end
end
