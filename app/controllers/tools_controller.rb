class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def show
  @tool = Tool.find(params[:id])
  cookies[:most_recent_tool_id] = @tool.id
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    flash[:notice] = "Success!"

    if @tool.save
      flash[:notice] = "Success"
      redirect_to tool_path(@tool.id)
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])

    if @tool.update( tool_params )
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy

    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end

end
