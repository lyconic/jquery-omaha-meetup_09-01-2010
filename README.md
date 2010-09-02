# Meeting Notes for 09-01-2010

## gems installed

sinatra sinatra-reloader
mysql activerecord

## db connection

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :database => 'rest_demo',
  :reconnect => true,
  :username => 'root',
  :password => 'passw0rd'
)

## further reading

"The S stands for Simple"
http://wanderingbarque.com/nonintersecting/2006/11/15/the-s-stands-for-simple/

"How I Explained REST to My Wife"
http://tomayko.com/writings/rest-to-my-wife

"If You Learn Only One New Thing This Year, Make It Rack"
http://blog.wekeroad.com/tutorials/rack-melts-faces