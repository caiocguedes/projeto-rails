module Blog
  class PostsController < BlogController

    # GET /posts
    # GET /posts.json
    def index
      @posts = Post.most_recent.published.paginate(:page => params[:pagina], per_page: 6)
      respond_to do |format|
        format.html
        format.csv { send_data @posts.to_csv }
        format.xls { send_data @posts.to_csv(col_sep: "\t") }
      end
    end

    # GET /posts/1
    # GET /posts/1.json
    def show
      @post = Post.friendly.find(params[:id])
    end

   

  end

end
