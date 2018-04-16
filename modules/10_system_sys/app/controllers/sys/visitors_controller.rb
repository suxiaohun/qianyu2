class Sys::VisitorsController < ApplicationController
  skip_before_action :check_if_require_login

  layout 'blank'




end
