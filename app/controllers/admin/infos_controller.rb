module Admin
  class InfosController < Admin::ApplicationController
    before_action :logged_in_user

    before_action :set_info, only: [:show, :edit, :update, :destroy]

    # GET /admin/infos
    # GET /admin/infos.json
    def index
      @infos = Info.all
    end

    # GET /admin/infos/1
    # GET /admin/infos/1.json
    def show
    end

    # GET /admin/infos/new
    def new
      @info = Info.new
    end

    # GET /admin/infos/1/edit
    def edit
    end

    # POST /admin/infos
    # POST /admin/infos.json
    def create
      @info = Info.new(params[:info].permit!)

      respond_to do |format|
        if @info.save
          flash[:success] = "创建成功!"

          format.html { redirect_to admin_infos_url }
        else
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /admin/infos/1
    # PATCH/PUT /admin/infos/1.json
    def update
      respond_to do |format|
        if @info.update(params[:info].permit!)
          format.html { redirect_to admin_infos_url }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /admin/infos/1
    # DELETE /admin/infos/1.json
    def destroy
      @info.destroy
      flash[:success] = "删除成功!"
      respond_to do |format|
        format.html { redirect_to admin_infos_url }
      end
    end

    def upload
      @picture = Picture.new
      @picture.image = params[:upload_file]

      success = true
      msg = '上传成功'
      file_path = ''
      if @picture.save!
          success=true
        render json: { :success=> success, :msg=>msg, :file_path=> @picture.image.url }
      else
          success=false
        render json: { :success=> false }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_info
        @info = Info.find(params[:id])
      end
  end
end
