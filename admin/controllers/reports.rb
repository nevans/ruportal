Admin.controllers :reports do

  get :index do
    @reports = Report.all
    render 'reports/index'
  end

  get :new do
    @report = Report.new
    render 'reports/new'
  end

  get :show, :with => :id do
    @report = Report[params[:id]]
    render 'reports/show'
  end

  post :create do
    @report = Report.new(params[:report])
    if (@report.save rescue false)
      flash[:notice] = 'Report was successfully created.'
      redirect url(:reports, :edit, :id => @report.id)
    else
      render 'reports/new'
    end
  end

  get :edit, :with => :id do
    @report = Report[params[:id]]
    render 'reports/edit'
  end

  put :update, :with => :id do
    @report = Report[params[:id]]
    if @report.modified! && @report.update(params[:report])
      flash[:notice] = 'Report was successfully updated.'
      redirect url(:reports, :edit, :id => @report.id)
    else
      render 'reports/edit'
    end
  end

  delete :destroy, :with => :id do
    report = Report[params[:id]]
    if report.destroy
      flash[:notice] = 'Report was successfully destroyed.'
    else
      flash[:error] = 'Impossible destroy Report!'
    end
    redirect url(:reports, :index)
  end
end
