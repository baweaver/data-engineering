class TabfilesController < ApplicationController
  # GET /tabfiles
  # GET /tabfiles.json
  def index
    @tabfiles = Tabfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tabfiles }
    end
  end

  # GET /tabfiles/1
  # GET /tabfiles/1.json
  def show
    @tabfile = Tabfile.find(params[:id])

    unless @tabfile.parsed
      data = File.open( @tabfile.file_name.current_path, 'r+')
      data.each_line.inject(0) do |i, line|
        next if i == 0
        val = line.split("\t")

        Customer.create(name: val[0] ) if Customer.find_by_name(val[0]).nil?
        Merchant.create(name: val[6], address: val[5]) if Merchant.find_by_name(val[6]).nil?

        Deal.create(description: val[1], price: val[2].to_f, merchant_id: Merchant.find_by_name(val[6]).id ) if Deal.find_by_description(val[1]).nil?

        Receipt.create(customer_id: Customer.find_by_name(val[0]).id, quantity: val[3].to_i, deal_id: Deal.find_by_description(val[1]).id)
      end

      @tabfile.parsed = true
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tabfile }
    end
  end

  # GET /tabfiles/new
  # GET /tabfiles/new.json
  def new
    @tabfile = Tabfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tabfile }
    end
  end

  # GET /tabfiles/1/edit
  def edit
    @tabfile = Tabfile.find(params[:id])
  end

  # POST /tabfiles
  # POST /tabfiles.json
  def create
    @tabfile = Tabfile.new(params[:tabfile])

    respond_to do |format|
      if @tabfile.save
        format.html { redirect_to @tabfile, notice: 'Tabfile was successfully created.' }
        format.json { render json: @tabfile, status: :created, location: @tabfile }
      else
        format.html { render action: "new" }
        format.json { render json: @tabfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tabfiles/1
  # PUT /tabfiles/1.json
  def update
    @tabfile = Tabfile.find(params[:id])

    respond_to do |format|
      if @tabfile.update_attributes(params[:tabfile])
        format.html { redirect_to @tabfile, notice: 'Tabfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tabfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tabfiles/1
  # DELETE /tabfiles/1.json
  def destroy
    @tabfile = Tabfile.find(params[:id])
    @tabfile.destroy

    respond_to do |format|
      format.html { redirect_to tabfiles_url }
      format.json { head :no_content }
    end
  end
end
