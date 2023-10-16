ARG=
run:
	mkdir -p tmp/pids; touch log/development.log; touch log/sidekiq.log; foreman start -f Procfile.dev

start:
	rails s -b 0.0.0.0 -p 3000 -e development

install:
	bundle install; yarn install

update:
	bundle update

create:
	rails db:create:all

migrate:
	rails db:migrate

rubocop:
	rubocop --safe-auto-correct

reindex:
	rails searchkick:reindex CLASS=Showcase;
	rails searchkick:reindex CLASS=Vehicle;
	rails searchkick:reindex CLASS=Lot;

seed:
	rails db:seed

console:
	rails console

clean:
	rails tmp:clear log:clear

setenv:
	rails db:environment:set RAILS_ENV=development

document-generate:
	rake docs:generate

teste:
	echo "Executa todos os testes. Você pode usar parametros como tags para testar apenas os testes marcados. Ex: ARG='spec/models/contact_spec.rb', ARG='--tag type:model', ARG='--tag ~type:resquest', ARG='--tag slow', ARG='--tag ~slow'"
	bin/rspec $(ARG);

reset:
	rails db:drop db:create db:migrate db:seed

rollback:
	rails db:rollback

erd:
	rake erd orientation=vertical inheritance=true notation=bachman title='CLASSEPAY - ERD (Entity Relationship Diagram)' filename='doc/erd-classepay' attributes=foreign_keys,content exclude="ActiveStorage::Blob,ActiveStorage::Attachment,FriendlyId::Slug,ActiveStorage::VariantRecord"

erd-core:
	rake erd orientation=horizontal inheritance=true notation=bachman title='CLASSEPAY - ERD (Entity Relationship Diagram)' filename='doc/erd-classepay-core' attributes=foreign_keys,content only="User"

erd-store:
	rake erd orientation=horizontal inheritance=true notation=bachman title='CLASSEPAY - ERD (Entity Relationship Diagram)' filename='doc/erd-classepay-store' attributes=foreign_keys,content only="User, Store, Seller, Employee, EmployeeStore"

erd-plan:
	rake erd orientation=horizontal inheritance=true notation=bachman title='CLASSEPAY - ERD (Entity Relationship Diagram)' filename='doc/erd-classepay-plan' attributes=foreign_keys,content only="Plan, PlanCategory, PlanCategoryItem, PlanItem, Subscription"

erd-invoices:
	rake erd orientation=horizontal inheritance=true notation=bachman title='CLASSEPAY - ERD (Entity Relationship Diagram)' filename='doc/erd-classepay-invoice' attributes=foreign_keys,content only="Invoice, Store, Subscription, Plan"

diagrams:
	rake diagram:all

erd-models:
	railroady -i -M | dot -Tsvg > doc/models.svg

# backup:
# 	@sh backup.sh

# restore:
# 	@sh backup_restore.sh