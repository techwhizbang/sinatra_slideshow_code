class ProductsController < Sinatra::Base
  enable :sessions
  use Rack::Flash, :sweep => true

  set :root, File.expand_path(File.dirname(__FILE__) + "/../../")
  set :views, Proc.new { File.join(root, "/app/views/products") }

  configure do
    @@database_connection = Database.connect
  end

  post '/' do
    @product = Product.create(params[:product])
    if @product.save
      flash[:notice] = "wOOt! You just created a new product"
      redirect "/product/#{@product.id}"
    else
      flash[:error] = "#{@product.errors.full_messages.join(",")}"
      haml :new
    end
  end

  get "" do
    @products = Product.all
    response['Cache-Control'] = 'public, max-age=30'
    etag "products_#{@products.size}"    
    haml :index
  end

  get '/new' do
    haml :new
  end

  get '/:id' do
    @product = Product.find(params[:id])
    response['Cache-Control'] = 'public, max-age=30'
    etag "product_#{@product.id}"
    set_viewed_products_cookie(@product.id)
    haml :show
  end

  put "/" do

  end

  delete "/" do

  end

  private

  def set_viewed_products_cookie(product_id)
    viewed_products = request.cookies["viewed_products"]
    viewed_products ||= []
    product_array = viewed_products.split("&")
    product_array << "product #{product_id}"
    response.set_cookie("viewed_products", product_array.uniq)
  end
end