function prj --wraps=prj.nu
    if set -l proj_dir (prj.nu $argv)
        cd "$proj_dir"
    end
end
