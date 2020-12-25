RSpec.describe 'admin/categories', type: :feature do
  let(:admin) { create(:admin_user) }
  let(:login_page) { Pages::Admin::LogIn.new }

  before do
    login_page.load
    login_page.form.fill_in(admin.email, admin.password)
  end

  describe '/index' do
    let_it_be(:category) { create(:category) }
    let(:categories_page) { Pages::Admin::Categories.new }

    before { categories_page.load }

    context 'with page elements' do
      it { expect(categories_page.main_content).to have_id_column }
      it { expect(categories_page.main_content).to have_name_column }

      it { expect(categories_page.main_content).to have_content(category.id) }
      it { expect(categories_page.main_content).to have_content(category.name) }
    end
  end

  describe '/new' do
    let(:new_category_page) { Pages::Admin::NewCategory.new }

    before { new_category_page.load }

    context 'with page elements' do
      it { expect(new_category_page.fields).to have_name_input }
      it { expect(new_category_page.fields).to have_create_button }
      it { expect(new_category_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:category_params) { attributes_for(:category) }

      before { new_category_page.fields.submit(category_params) }

      it { expect(new_category_page.text).to have_content(category_params[:name]) }
      it { expect(new_category_page.text).to have_content(I18n.t('notice.category.saved')) }
    end

    context 'when fill in form with invalid params' do
      let(:category_params) { attributes_for(:category, name: '') }

      before { new_category_page.fields.submit(category_params) }

      it { expect(new_category_page.fields.text).to have_content(I18n.t('alert.blank')) }
      it { expect(new_category_page.fields.name_input.value).to have_content(category_params[:name]) }
    end
  end

  describe '/edit' do
    let_it_be(:category) { create(:category) }
    let(:edit_category_page) { Pages::Admin::EditCategory.new }

    before { edit_category_page.load(id: category.id) }

    context 'with page elements' do
      it { expect(edit_category_page.fields).to have_name_input }
      it { expect(edit_category_page.fields.name_input.value).to have_content(category.name) }
      it { expect(edit_category_page.fields).to have_create_button }
      it { expect(edit_category_page.fields).to have_cancel_button }
    end

    context 'when fill in form with valid params' do
      let(:category_params) { attributes_for(:category) }

      before { edit_category_page.fields.submit(category_params) }

      it { expect(edit_category_page.text).to have_content(category_params[:name]) }
      it { expect(edit_category_page.text).to have_content(I18n.t('notice.category.saved')) }
    end

    context 'when fill in form with invalid params' do
      let(:category_params) { attributes_for(:category, name: '') }

      before { edit_category_page.fields.submit(category_params) }

      it { expect(edit_category_page.fields.text).to have_content(I18n.t('alert.blank')) }
      it { expect(edit_category_page.fields.name_input.value).to have_content(category.name) }
    end
  end
end
