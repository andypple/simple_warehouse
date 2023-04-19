require_relative '../../app/crate'

RSpec.describe Crate do
  let(:crate) { Crate.new(1, 1, 2, 2, 'P') }

  describe '#overlap?' do
    context 'with overlap both projection x and y' do
      # 05|__|__|__|__|__|__|__|__|__|__|
      # 04|__|__|__|__|__|__|__|__|__|__|
      # 03|__|QQ|QQ|__|__|__|__|__|__|__|
      # 02|PP|PQ|QQ|__|__|__|__|__|__|__|
      # 01|PP|PP|__|__|__|__|__|__|__|__|
      #   1  2  3  4  5  6  7  8  9  10

      let(:other) { Crate.new(2, 2, 2, 2, 'Q') }

      it do
        expect(crate.overlap?(other)).to be_truthy
      end
    end

    context 'with overlap only projection x' do
      # 05|__|__|__|__|__|__|__|__|__|__|
      # 04|__|QQ|QQ|__|__|__|__|__|__|__|
      # 03|__|QQ|QQ|__|__|__|__|__|__|__|
      # 02|PP|PP|__|__|__|__|__|__|__|__|
      # 01|PP|PP|__|__|__|__|__|__|__|__|
      #   1  2  3  4  5  6  7  8  9  10

      let(:other) { Crate.new(2, 3, 2, 2, 'Q') }

      it do
        expect(crate.overlap?(other)).to be_falsy
      end
    end

    context 'with overlap only projection y' do
      # 05|__|__|__|__|__|__|__|__|__|__|
      # 04|__|__|__|__|__|__|__|__|__|__|
      # 03|__|__|QQ|QQ|__|__|__|__|__|__|
      # 02|PP|PP|QQ|QQ|__|__|__|__|__|__|
      # 01|PP|PP|__|__|__|__|__|__|__|__|
      #   1  2  3  4  5  6  7  8  9  10

      let(:other) { Crate.new(3, 2, 2, 2, 'Q') }

      it do
        expect(crate.overlap?(other)).to be_falsy
      end
    end

    context 'without overlap projection x or y' do
      # 05|__|__|__|__|__|__|__|__|__|__|
      # 04|__|__|QQ|QQ|__|__|__|__|__|__|
      # 03|__|__|QQ|QQ|__|__|__|__|__|__|
      # 02|PP|PP|__|__|__|__|__|__|__|__|
      # 01|PP|PP|__|__|__|__|__|__|__|__|
      #   1  2  3  4  5  6  7  8  9  10

      let(:other) { Crate.new(3, 3, 2, 2, 'Q') }

      it do
        expect(crate.overlap?(other)).to be_falsy
      end
    end
  end
end
