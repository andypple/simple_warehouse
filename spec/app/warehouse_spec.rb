require_relative '../../app/warehouse'
require_relative '../../app/warehouse_presenter'

RSpec.describe Warehouse do
  let(:warehouse) { described_class.new }
  describe '#init' do
    it do
      warehouse.init(10, 15)
      expect(warehouse.width).to eq 10
      expect(warehouse.height).to eq 15
    end
  end

  describe '#view' do
    it do
      expect_any_instance_of(WarehousePresenter).to receive(:draw)
      warehouse.init(10, 15)
      warehouse.view
    end
  end

  describe '#store' do
    before do
      warehouse.init(10, 15)
    end

    it 'does not store a crate at a position which does not exist' do
      expect { warehouse.store(11, 1, 1, 1, 'P') }.to output("position does not exist\n").to_stdout
    end

    # 05|__|__|__|__|__|__|__|__|__|__|
    # 04|__|__|__|__|__|__|__|__|__|__|
    # 03|__|__|__|__|__|__|__|__|__|__|
    # 02|__|__|__|__|__|__|__|__|PP|PP|PP
    # 01|__|__|__|__|__|__|__|__|PP|PP|PP
    #   1  2  3  4  5  6  7  8  9  10
    context 'when crate overlaps with boundary' do
      it do
        expect { warehouse.store(9, 1, 3, 3, 'P') }.to output("crate does not fit\n").to_stdout
      end
    end

    # 05|__|__|__|__|__|__|__|__|__|__|
    # 04|__|__|__|__|__|__|__|__|__|__|
    # 03|__|QQ|QQ|__|__|__|__|__|__|__|
    # 02|PP|PQ|QQ|__|__|__|__|__|__|__|
    # 01|PP|PP|__|__|__|__|__|__|__|__|
    #   1  2  3  4  5  6  7  8  9  10
    context 'when crate overlaps with other crates' do
      it do
        warehouse.store(1, 1, 2, 2, 'P')
        expect { warehouse.store(2, 2, 2, 2, 'Q') }.to output("crate does not fit\n").to_stdout
      end
    end
  end

  describe '#locate' do
    it do
      warehouse.init(10, 15)
      warehouse.store(1, 1, 2, 2, 'P')
      warehouse.store(3, 3, 2, 2, 'P')
      warehouse.store(4, 1, 2, 2, 'Q')
      expect(warehouse.locate('P').size).to eq 2
      expect(warehouse.locate('Q').size).to eq 1
    end
  end

  describe '#remove' do
    it do
      warehouse.init(10, 15)
      warehouse.store(1, 1, 2, 2, 'P')
      warehouse.store(3, 3, 2, 2, 'P')
      expect(warehouse.remove(2, 2).size).to eq 1
      expect { warehouse.remove(10, 10) }.to output("Crate does not exist\n").to_stdout
    end
  end
end
