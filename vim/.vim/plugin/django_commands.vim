function! DJtest(appname)
    new
    execute "read ! ./manage.py test " . a:appname . " --settings=$DJANGO_SETTINGS_MODULE"
endfunction 

