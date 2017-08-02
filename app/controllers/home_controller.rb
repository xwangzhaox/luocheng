class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  skip_before_action :verify_authenticity_token, :only => [:new_comment]

  def index
    @recommend_news = Article.recommend_news.last(4)
    @settings = BaseSetting.first
    @about = Article.where(en_title: "about").first
    @services = Article.where(en_title: "services").first
    @news = Category.where(en_name: "news").first
  end

  def new_comment
    if(Comment.verify_request?(request.remote_ip))
      comment = Comment.new(comment_params.merge({:ip => request.remote_ip}))
      if comment.save
        flash[:notice] = "提交成功"
        render :json => {:rcord => 1}
      else
        flash[:error] = comment.errors.messages.inject(""){|r,e|r+="#{e[0]}#{e[1][0]}; "}
        render :json => {:rcord => 0}
      end
    else
      flash[:error] = "提交错误，请避免多次重复提交"
      render :json=>{:rcord => 0}
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :phone, :wechat, :message)
  end
end
