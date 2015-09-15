class MessagesController < ApplicationController
  
  def index
    #Messageを全て取得する。
    @messages = Message.all
  end

##　ここから追記
def create
  @message = Message.new(message_params)
  @message.save
  redirect_to root_path , notice: 'メッセージを保存しました'
end

#ここから下はprivateメソッドとなる
private
def message_params
  #params[:message]のパラメーターでname, bodyのみを許可
  #返り値はex:) {name: "入力されたname",nody: "入力されたbody"}
  params.require(message).permit(:name, :body)
end
##　ここまで
end
