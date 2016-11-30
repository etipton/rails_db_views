namespace :db do

  desc "Generate all the database views of the current project"
  task create_views: :environment do
    creator = RailsDbViews::DbViewsCreator.new

    views_path, views_ext = Rails.configuration.rails_db_views[:views_path], Rails.configuration.rails_db_views[:views_ext]

    views_path.each do |path|
      creator.register_files Dir[File.join(path, views_ext)].map{|x| File.expand_path(x)}
    end

    creator.create_views
  end

  desc "Drop all the database views of the current project"
  task drop_views: :environment do
    creator = RailsDbViews::DbViewsCreator.new

    views_path, views_ext = Rails.configuration.rails_db_views[:views_path], Rails.configuration.rails_db_views[:views_ext]

    views_path.each do |path|
      creator.register_files Dir[File.join(path, views_ext)].map{|x| File.expand_path(x)}
    end

    creator.drop_views
  end
end

# prepend "db" namespace
db_tasks = %w(migrate rollback test:load test:prepare schema:load).map { |task_name| "db:#{task_name}" }

db_tasks.each do |task_name|
  # Before
  Rake::Task[task_name].enhance(['db:drop_views'])

  # After
  task task_name do
    Rake::Task['db:create_views'].invoke
  end
end
