class StaticController < ApplicationController

  def index
    render 'index'
  end

  def howitworks
    render 'howitworks'
  end

  def fees
    render 'fees'
  end

  def advice
    render 'advice'
  end

  def faq
    render 'faq'
  end
end
