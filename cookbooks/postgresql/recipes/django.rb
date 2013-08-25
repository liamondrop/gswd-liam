include_recipe "python::pip"

pips = ["psycopg2", "dj-database-url"]

pips.each do |pkg|
  python_pip pkg do
    virtualenv "/home/vagrant/blog-venv"
    action :install
  end
end