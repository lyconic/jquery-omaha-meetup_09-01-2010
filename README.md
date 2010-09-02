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

[The S stands for Simple][0]

[How I Explained REST to My Wife][1]

[If You Learn Only One New Thing This Year, Make It Rack][2]

  [0]: http://webcache.googleusercontent.com/search?q=cache:XwEfa0sAm1cJ:wanderingbarque.com/nonintersecting/2006/11/15/the-s-stands-for-simple/+The+S+Stands+for+Simple&hl=en&gl=us&strip=0
  [1]: http://tomayko.com/writings/rest-to-my-wife
  [2]: http://blog.wekeroad.com/tutorials/rack-melts-faces