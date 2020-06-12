class MemosController < ApplicationController
    before_action :find_post, only: :create
    before_action :find_memo, only: [:edit, :update, :destroy]

    def create
        if !@post.memos.find_by user: current_user
            memo = Memo.new memo_params
            memo.user = current_user
            if memo.save
                @memo = @post.memos.find_by user: current_user
                respond_to do |format|
                    format.js
                end
            else
                flash[:danger] = t "memo_create.fail"
                redirect_to root_path
            end
        else
            flash[:danger] = t "memo_create.existed"
            redirect_to root_path
        end
    end

    def edit
        @post = @memo.post
        respond_to do |format|
            format.js
        end
    end

    def update
        if @memo.update_attributes memo_params
            @post = @memo.post
            respond_to do |format|
                format.js
            end
        else
            flash[:danger] = t "memo_update.fail"
            redirect_to root_path
        end
    end

    def destroy
        @post = @memo.post
        @memo.destroy
        @memo = current_user.memos.build
        respond_to do |format|
            format.js
        end
    end

    private
    def find_post
        return if @post = Post.find_by(id: params[:memo][:post_id])
        redirect_to not_found_index_path
    end

    def find_memo
        return if @memo = Memo.find_by(id: params[:id])
        redirect_to not_found_index_path
    end

    def memo_params
        params.require(:memo).permit :content, :post_id
    end
end
