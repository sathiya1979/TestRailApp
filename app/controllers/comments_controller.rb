class CommentsController < ApplicationController
  before_action :load_commentable, only:[:index]
  before_action :allowed_params, only:[:new]
  def index
    @comments = @commentable.comments
  end

  def new
  @comment = @commentable.comments.new
  end

  def create
  raise params.inspect
  @comment = @commentable.comments.new(allowed_params)  
  if @comment.save
    redirect_to @commentable, notice: "Comment created."
  else
    render :new
  end
  end
  def show
    @comment_show = Comment.where(commentable_id: params["id"])
    @article_title = Article.find(params["id"])
  end

private
def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
end
def allowed_params
params.require(:comment).permit(:content)

end

end
