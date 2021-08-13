{ git diff HEAD --name-only --diff-filter=MA & git diff origin/develop..HEAD --name-only --diff-filter=MA; } | sort | uniq | grep -v -e "db/schema.rb" -e "db/data_schema.rb" | grep "**.rb" | xargs rubocop -c .rubocop.yml -a

