package "postgresql"
package "postgresql-client"
package "postgresql-contrib"
package "postgresql-8.4-postgis"
package "python-psycopg2"



script "configure_postgres" do
  interpreter "bash"
  user "postgres"
  code <<-EOH 
  createdb microblog -E UTF8 -T template1
  createlang plpgsql microblog
  createuser -s vagrant;
  psql -c "create role gisgroup"
  psql -d microblog -f /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql
  psql -d microblog -f /usr/share/postgresql/8.4/contrib/postgis-1.5/spatial_ref_sys.sql
  psql -d microblog -f /usr/share/postgresql/8.4/contrib/postgis_comments.sql
  psql -d microblog -c "ALTER TABLE geometry_columns OWNER TO gisgroup"
  psql -d microblog -c "ALTER TABLE spatial_ref_sys OWNER TO gisgroup"
  psql -d microblog -c "CREATE SCHEMA gis_schema AUTHORIZATION gisgroup;"
  psql -c "grant gisgroup to vagrant"
  EOH
end