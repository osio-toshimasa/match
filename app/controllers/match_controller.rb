require 'ostruct'

class MatchController < ApplicationController
  def index
    puts 'request'
    render json: {
      message: 'Hello World'
    }
  end

  def create
    entry = OpenStruct.new({ :value => params[:value], :id => params[:id] })

    # MemoryStoreにSaveされていれば取り出す。
    entry_json = Rails.cache.fetch("/match/#{params[:id]}", expired_in: 1.hour) do
      # 一度もSaveされていない場合は、ここの値がSaveされる
      JSON.generate(entry.to_h)
    end

    puts entry_json

    # Json文字列をOpenStructに変換する。
    result = JSON.parse(entry_json, object_class: OpenStruct)

    # OpenStructそのまま渡すと{"table":{"value":1,"id":1}}というで返却される。
    # tableの部分が余計に感じたのでto_hでハッシュにして返却すると{"value":1,"id":1}のようになる。
    render json: result.to_h

  end

end
