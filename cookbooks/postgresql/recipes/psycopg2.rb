include_recipe "python::pip"

python_pip "psycopg2" do
  virtualenv "/home/vagrant/blog-venv"
  action :install
end