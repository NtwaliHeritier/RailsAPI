module Api
    module V1
        class ArticlesController<ApplicationController
            def create
                article=Article.new(articles_param)
                if article.save
                    render json:{status: "Submitted", message: "Article created", data:article}, status: :ok
                else
                    render json:{status: "Not submitted", message: "Article not created", data:article.errors}, status: :unprocessable_entity
                end
            end

            def index
                articles=Article.all
                render json:{status: "Success", message: "List of articles", data:articles}, status: :ok
            end

            def show
                article=Article.find(params[:id])
                render json:{status: "Success", message: "List of articles", data:article}, status: :ok
            end

            def update
             article=Article.find(params[:id])
             if article.update_attributes(articles_param)
                    render json:{status: "updated", message: "List of articles", data:article}, status: :ok
                else
                    render json:{status: "Not updated", message: "Article not updated", data:article.errors}, status: :unprocessable_entity
             end
            end
            
            def destroy
                article=Article.find(params[:id])
                article.destroy
                render json:{status: "Deleted", message: "Deleted article", data:article}, status: :ok
            end

            private def articles_param
            params.permit(:title, :body)
            end
        end
    end
end