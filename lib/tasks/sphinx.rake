require "#{RAILS_ROOT}/config/environment.rb"
SPHINX_SOURCE='http://www.sphinxsearch.com/downloads/sphinx-0.9.8.1.tar.gz' # r1234

namespace :sphinx do  
  desc "Install Sphinx from source"
  task :install do
    build_dir = "#{ENV['HOME']}/tmp/sphinx"
    system "rm -rf #{build_dir}"
    system "mkdir -p #{build_dir}"
    puts "Downloading Sphinx indexer from #{SPHINX_SOURCE}"
    cd build_dir do 
      uri = URI.parse(SPHINX_SOURCE)
      tarball = File.basename(uri.path)
      Net::HTTP.start(uri.host) do |http|
        resp = http.get(uri.path)
        open(tarball, "wb") do |file|
          file.write(resp.body)
        end
      end
      system("tar -xzf #{tarball}")
      cd "#{build_dir}/#{tarball.gsub('.tar.gz','')}" do
        system("./configure --with-mysql-libs=/opt/local/lib/mysql5/mysql/ --with-mysql-includes=/opt/local/include/mysql5/mysql/")
        system("make")
        puts "\nRunning 'sudo make install' - this will install Sphinx."
        system("sudo make install")
      end
    end  
  system("sudo mkdir -p /opt/local/var/db/sphinx")
  system("sudo chown -R `whoami` /opt/local/var/db/sphinx")
  end 
end