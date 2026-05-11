# frozen_string_literal: true

require 'tmpdir'
require 'spec_helper'
require 'rails/generators'
require 'generators/acts_as_human/migration/migration_generator'

RSpec.describe ActsAsHuman::Generators::MigrationGenerator do
  let(:destination) { Dir.mktmpdir }

  after { FileUtils.remove_entry(destination) }

  describe 'generated migration' do
    before { described_class.start(['visitors'], destination_root: destination) }

    let(:migration_file) { Dir[File.join(destination, 'db/migrate/*_add_names_to_visitors.rb')].first }

    it 'creates the migration file' do
      expect(migration_file).not_to be_nil
    end

    it 'adds first_name column' do
      expect(File.read(migration_file)).to include('add_column :visitors, :first_name, :string')
    end

    it 'adds middle_names column' do
      expect(File.read(migration_file)).to include('add_column :visitors, :middle_names, :string')
    end

    it 'adds last_name column' do
      expect(File.read(migration_file)).to include('add_column :visitors, :last_name, :string')
    end
  end
end
