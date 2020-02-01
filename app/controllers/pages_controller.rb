class PagesController < ApplicationController
  def home
    @costumes = Costume.first(3)
  end

  def contact
  end
end
