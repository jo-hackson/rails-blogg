class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # will look for app/views/articles/new.html.erb
  # add @article or will be nil
  def new
    @article = Article.new
  end

  # why do not need to have to deal with strong params?
  def edit
    @article = Article.find(params[:id])
  end

  # if leave empty, an error will arise because Rails by default sends 204 No Content for an action if we do not specify what the response should be
  # want to create new article, so should save to db
  # strong parameters: requires us to tell Rails exactly which params are allowed into our controller actions
  # solution to ForbiddenAttributesError
    # whitelist controller parameters
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      # user render instead of redirect
      # render method used so that @article is passed back to the new template when it is rendered
      render 'new'
    end

    # render plain: params[:article][:title].inspect
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # does not need view
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # can be reused by multiple actions in same controller, ie create and update
  # made private so it cannot be called outside its intended context
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
