# frozen-string-literal: true

RSpec.describe Everlasting::Hooks do
  describe '.init' do
    before do
      ActionController::Parameters.permit_all_parameters = true

      Everlasting::Hooks.init
    end

    let(:params) {
      ActionController::Parameters.new('foo' => 'abc', 'bar' => 'xyz')
    }

    context 'Called by a Hash method' do
      subject { params.symbolize_keys }

      it { is_expected.to eq(foo: 'abc', bar: 'xyz') }
    end

    context 'Called by a Hash method with argument' do
      subject { params.merge(qoox: 'def', qooox: 'uvw') }

      it { is_expected.to eq('foo' => 'abc', 'bar' => 'xyz', 'qoox' => 'def', 'qooox' => 'uvw') }
    end

    context 'Called by unknown method' do
      specify {
        expect { params.foo }.to raise_error(NoMethodError)
      }
    end
  end
end
