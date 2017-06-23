class ContactsController < ApplicationController
  def index
    redirect_to controller: :contacts, action: :new
  end
  
  def new
    if params[:back]
      @contacts = Contact.new(contacts_params)
    else
      @contacts = Contact.new
    end
  end
  
  def create
    @contacts = Contact.create(contacts_params)
    if @contacts.save
      redirect_to contacts_path, notice: "お問い合わせありがとうございました！"
    else
      render action: 'new'
    end
  end
  
  def confirm
    @contacts = Contact.new(contacts_params)
    render :new if @contacts.invalid?
  end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
