# rubocop:disable Style/FrozenStringLiteralComment
RSpec.describe Combine::Helpers do
  include Combine::Helpers

  describe '#format_issn' do
    let(:formatted_issn) { '1111-1111'.freeze }

    context 'Unformatted 8 digits issn' do
      it 'Returns the issn formatted' do
        expect(format_issn('11111111')).to eq formatted_issn
      end
    end

    context 'Already formatted issn' do
      it 'Returns the same issn' do
        expect(format_issn(formatted_issn)).to eq formatted_issn
      end
    end

    context 'Empty issn' do
      it 'Raises WrongIssnFormatError' do
        expect { format_issn('') }.to raise_error(Combine::Helpers::WrongIssnFormatError)
      end
    end

    context 'Wrong format issn' do
      it 'Raises WrongIssnFormatError' do
        expect { format_issn('Wrong format') }.to raise_error(Combine::Helpers::WrongIssnFormatError)
      end
    end
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
