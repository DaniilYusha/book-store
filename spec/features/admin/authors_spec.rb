RSpec.describe 'admin/categories', type: :feature do
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '/index' do
    let_it_be(:author) { create(:author) }
    let(:authors_page) { Pages::Admin::Authors.new }

    before { authors_page.load }

    context 'with page elements' do
      it { expect(authors_page.main_content).to have_first_name_column }
      it { expect(authors_page.main_content).to have_last_name_column }

      it { expect(authors_page.main_content).to have_content(author.first_name) }
      it { expect(authors_page.main_content).to have_content(author.last_name) }
    end
  end

  describe '/new' do
    let(:new_author_page) { Pages::Admin::NewAuthor.new }

    before { new_author_page.load }

    context 'with page elements' do
      it { expect(new_author_page.fields).to have_first_name_input }
      it { expect(new_author_page.fields).to have_last_name_input }
      it { expect(new_author_page.fields).to have_create_button }
      it { expect(new_author_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:author_params) { attributes_for(:author) }

      before { new_author_page.fields.submit(author_params) }

      it { expect(new_author_page.text).to have_content(author_params[:first_name]) }
      it { expect(new_author_page.text).to have_content(author_params[:last_name]) }
      it { expect(new_author_page.text).to have_content(I18n.t('notice.author.saved')) }
    end

    context 'when fill in form with invalid params' do
      let(:author_params) { attributes_for(:author, first_name: '') }

      before { new_author_page.fields.submit(author_params) }

      it { expect(new_author_page.fields.text).to have_content(I18n.t('alert.blank')) }
      it { expect(new_author_page.fields.first_name_input.value).to have_content(author_params[:first_name]) }
      it { expect(new_author_page.fields.last_name_input.value).to have_content(author_params[:last_name]) }
    end
  end

  describe '/edit' do
    let_it_be(:author) { create(:author) }
    let(:edit_author_page) { Pages::Admin::EditAuthor.new }

    before { edit_author_page.load(id: author.id) }

    context 'with page elements' do
      it { expect(edit_author_page.fields).to have_first_name_input }
      it { expect(edit_author_page.fields.first_name_input.value).to have_content(author.first_name) }
      it { expect(edit_author_page.fields).to have_last_name_input }
      it { expect(edit_author_page.fields.last_name_input.value).to have_content(author.last_name) }
      it { expect(edit_author_page.fields).to have_create_button }
      it { expect(edit_author_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:author_params) { attributes_for(:author) }

      before { edit_author_page.fields.submit(author_params) }

      it { expect(edit_author_page.text).to have_content(author_params[:first_name]) }
      it { expect(edit_author_page.text).to have_content(author_params[:last_name]) }
      it { expect(edit_author_page.text).to have_content(I18n.t('notice.author.saved')) }
    end

    context 'when fill in form with invalid params' do
      let(:author_params) { attributes_for(:author, first_name: '') }

      before { edit_author_page.fields.submit(author_params) }

      it { expect(edit_author_page.fields.text).to have_content(I18n.t('alert.blank')) }
      it { expect(edit_author_page.fields.first_name_input.value).to have_content(author.first_name) }
      it { expect(edit_author_page.fields.last_name_input.value).to have_content(author.last_name) }
    end
  end
end
