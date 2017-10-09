class Model < ActiveRecord::Base
end

RSpec.describe ActsAsHuman do
  context 'A Model that acts as a human' do
    before do
      Model.class_eval do
        acts_as_human
      end
    end

    context 'when the user is new' do
      let(:user) { Model.new }

      it 'should have an empty full_name' do
        expect( user.full_name ).to eq ''
      end
    end

    context 'A name assiged through first_name and last_name' do
      let(:user) { Model.new first_name: 'Nelson', last_name: 'Mandela' }

      it 'should have a full_name' do
        expect( user.full_name ).to eq 'Nelson Mandela'
      end
    end

    context 'A name assiged through first_name, middle_names and last_name' do
      let(:user) do
        Model.new first_name: 'Nelson',
          middle_names: 'Madiba Rolihlahla', last_name: 'Mandela'
      end

      it 'should have a full_name' do
        expect( user.full_name ).to eq 'Nelson Madiba Rolihlahla Mandela'
      end
    end

    context 'A name assigned through full_name' do
      let(:user) { Model.new full_name: 'Nelson Mandela' }

      it 'should have a first_name and last_name' do
        expect( user.first_name ).to eq 'Nelson'
        expect( user.last_name ).to eq 'Mandela'
      end
    end

    context 'A name assigned through full_name with middle_names' do
      let(:user) { Model.new full_name: 'Nelson Madiba Rolihlahla Mandela' }

      it 'should have a first_name and last_name' do
        expect( user.first_name ).to eq 'Nelson'
        expect( user.middle_names ).to eq 'Madiba Rolihlahla'
        expect( user.last_name ).to eq 'Mandela'
      end
    end

    context 'assigned a Scottish name' do
      let(:user) { Model.new full_name: 'Ewan Mc Greggor' }

      it 'should split up correctly' do
        expect( user.first_name ).to eq 'Ewan'
        expect( user.last_name ).to eq 'Mc Greggor'
      end
    end

    context 'assigned a Scottish name' do
      let(:user) { Model.new full_name: 'Jade Frances Roseanne Mc Cracken' }

      it 'should split up correctly' do
        expect( user.first_name ).to eq 'Jade'
        expect( user.middle_names ).to eq 'Frances Roseanne'
        expect( user.last_name ).to eq 'Mc Cracken'
      end
    end

    context 'without a first_name' do
      let(:user) { user = Model.new }
      before { user.first_name = '' }

      it "should be invalid" do
        expect(user.valid?).not_to be
        expect(
          user.errors[:first_name]
        ).to include 'first name is required'
      end
    end

    context 'without a last_name' do
      let(:user) { Model.new first_name: 'Brent', last_name: '' }

      it "should be invalid" do
        expect(user.valid?).not_to be
        expect(
          user.errors[:last_name]
        ).to include 'last name is required'
      end
    end

    context 'when the first name is assigned through full_name' do
      let(:user) { Model.new full_name: 'Brent' }

      it 'should require a last_name' do
        expect(user.valid?).not_to be
        expect(
          user.errors[:last_name]
        ).to include 'last name is required'
      end
    end

    context 'with invalid characters' do
      let(:user) { Model.new full_name: '<Brent> Middle >< Names Gre&eff' }

      it 'should be invalid' do
        expect(user.valid?).not_to be
        expect(
          user.errors[:first_name]
        ).to include 'some characters in your name are not allowed'
        expect(
          user.errors[:last_name]
        ).to include 'some characters in your name are not allowed'
        expect(
          user.errors[:middle_names]
        ).to include 'some characters in your name are not allowed'
      end
    end

    context 'with a first_name that is over 40 characters' do
      let(:user) do
        Model.new first_name: 'over 40 characters----over 40 characters*'
      end

      it 'should be invalid' do
        expect(user.valid?).not_to be
        expect(
          user.errors[:first_name]
        ).to include 'first name is too long (max 40 characters)'
      end
    end

    context 'with a last_name that is over 40 characters' do
      let(:user) do
        Model.new last_name: 'over 40 characters----over 40 characters*'
      end

      it 'should be invalid' do
        expect(user.valid?).not_to be
        expect(
          user.errors[:last_name]
        ).to include 'last name is too long (max 40 characters)'
      end
    end

    context 'with middle_names that are over 40 characters' do
      let(:user) do
        Model.new middle_names: 'over 40 characters----over 40 characters*'
      end

      it 'should be invalid' do
        expect(user.valid?).not_to be
        expect(
          user.errors[:middle_names]
        ).to include 'middle names are too long (max 40 characters)'
      end
    end
  end

  context 'A Model that acts as a human' do
    context 'and doesnt require a last_name' do
      before do
        Model.class_eval do
          acts_as_human require_last_name: false
        end
      end

      context 'without a last_name' do
        let(:user) { Model.new first_name: 'Brent', last_name: '' }

        it "should be valid" do
          expect(user.valid?).to be
        end
      end
    end
  end
end
