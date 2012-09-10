#
# Symlink a glob of files ending in .symlink
# to a target location. (include the trailing 
# slash and an optional dot if you wish to 
# have a dot prefix)
#
def linkup_files(sources, target_dir)
  skip_all      = false
  overwrite_all = false
  backup_all    = false

  sources.each do |source|
    skip      = false
    overwrite = false
    backup    = false

    file = source.split('/').last
    target = "#{target_dir}#{file}"
    if File.exist?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}. What do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        print ">> "
        case STDIN.gets.chomp
          when 's' then skip          = true
          when 'o' then overwrite     = true
          when 'b' then backup        = true
          when 'O' then overwrite_all = true
          when 'B' then backup_all    = true
          when 'S' then skip_all      = true
        end
      end
      next if skip || skip_all
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      File.rename(target, "#{target}.backup") if backup || backup_all
   end
   File.symlink(source, target)
  end
end

namespace :df do
  desc "Symlink dotfiles into standard locations"
  task :install do
    sources = Dir.glob("#{ENV["HOME"]}/.dotfiles/symlinks/*")
    target_dir = "#{ENV["HOME"]}/."
    linkup_files(sources, target_dir)
  end

  desc "Symlink bin files to ~/bin"
  task :install_bin do
    sources = Dir.glob("#{ENV["HOME"]}/.dotfiles/bin/*")
    target_dir = "#{ENV["HOME"]}/bin/"
    FileUtils.mkdir_p(target_dir)
    linkup_files(sources, target_dir)
  end
end
task :default => ['df:install', 'df:install_bin']
