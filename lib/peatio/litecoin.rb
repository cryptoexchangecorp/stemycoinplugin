require "active_support/core_ext/object/blank"
require "active_support/core_ext/enumerable"
require "peatio"

module Peatio
  module stemycoin
    require "bigdecimal"
    require "bigdecimal/util"

    require "peatio/stemycoin/blockchain"
    require "peatio/stemycoin/client"
    require "peatio/stemycoin/wallet"

    require "peatio/stemycoin/hooks"

    require "peatio/stemycoin/version"
  end
end
