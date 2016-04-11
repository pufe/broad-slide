class SlideController < ApplicationController
  def show
    @slide = get_default_slide
  end

  def next
    @slide = Slide.where('id > ?', params[:current_id]).order(id: :asc).first
    @slide ||= get_default_slide
    render json: @slide.attributes
  end

  def edit
    @slide_list = Slide.order(id: :asc).all
  end

  def update
    if Password.find_by(password: params[:password]).present?
      params[:slide_list].each do |slide|
        Slide.create_or_update(slide)
      end
      Slide.where.not(id: params[:slide_list].map{|c| c[:id]}).delete_all
      flash[:notice] = 'Slides salvos com sucesso!'
    else
      flash[:error] = 'Senha incorreta!'
    end

    edit
    render :edit
  end

  private
  def get_default_slide
    Slide.order(id: :asc).first || Slide.new(url: 'http://google.com', id: 0)
  end
end
