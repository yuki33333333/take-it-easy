module Api
  class TodosController < ApplicationController
    # before_action :set_post, only: [:show, :update, :destroy]

    def index
      todos = Todo.find()
      render json: { status: 'SUCCESS', message: 'Loaded todo', data: todos }
    end

#     def show
#       render json: { status: 'SUCCESS', message: 'Loaded the todo', data: @todo }
#     end

#     def create
#       post = Post.new(post_params)
#       if post.save
#         render json: { status: 'SUCCESS', data: post }
#       else
#         render json: { status: 'ERROR', data: post.errors }
#       end
#     end

#     def destroy
#       @post.destroy
#       render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
#     end

#     def update
#       if @post.update(post_params)
#         render json: { status: 'SUCCESS', message: 'Updated the post', data: @post }
#       else
#         render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors }
#       end
#     end

#     private

#     def set_post
#       @post = Post.find(params[:id])
#     end

#     def post_params
#       params.require(:post).permit(:title)
#     end
  end
end