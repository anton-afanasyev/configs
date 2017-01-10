server {
	listen 80;
	listen [::]:80;

	server_name www.from.com from.com;

        location / {
              proxy_pass http://to.com/;
              proxy_redirect default;
        }
}
