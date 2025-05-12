# frozen_string_literal: true

class LrCommonConfigTest < ActiveSupport::TestCase
  describe 'LrCommonConfig' do
    describe '#app_link' do
      it 'should generate a non-active link' do
        mock_request = mock('request')
        mock_request.expects(:original_url).returns('/mock')
        mock_request.expects(:params).returns({})

        link = LrCommonConfig.app_link('dummy', mock_request, 'lr-header--header-proposition--a')

        _(link).must_match(%r{<a class="lr-header--header-proposition--a" href="/dummy">.*})
      end

      it 'should generate an active link' do
        mock_request = mock('request')
        mock_request.expects(:original_url).returns('/dummy')
        mock_request.expects(:params).returns({})

        link = LrCommonConfig.app_link('dummy', mock_request, 'lr-header--header-proposition--a')

        _(link).must_match(%r{<a class="lr-header--header-proposition--a lr-header--header-proposition--a__active" href="/dummy">.*})
      end

      it 'should generate a non-active link with multiple classes' do
        mock_request = mock('request')
        mock_request.expects(:original_url).returns('/mock')
        mock_request.expects(:params).returns({})

        link = LrCommonConfig.app_link('dummy', mock_request, ['lr-header--header-proposition--a', 'another-class'])
        _(link).must_match(%r{<a class="lr-header--header-proposition--a another-class" href="/dummy">.*})
      end

      it 'should preserve the language option' do
        mock_request = mock('request')
        mock_request.expects(:original_url).returns('/mock')
        mock_request.expects(:params).at_least_once.returns({ lang: 'elvish' })

        link = LrCommonConfig.app_link('dummy', mock_request, 'lr-header--header-proposition--a')

        _(link).must_match(%r{<a class="lr-header--header-proposition--a" href="/dummy\?lang=elvish">.*})
      end
    end
  end
end
