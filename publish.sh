ruby setup-demo.rb
bundle exec jekyll build
cd gen
git add -A .
git commit -m "sync"
git push origin gh-pages
cd ..
git add gen
