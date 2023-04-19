require_relative '../../app/event_handler'
require_relative '../../app/warehouse'

RSpec.describe EventHandler do
  context 'with init event' do
    let(:command) { 'init 8 12' }

    it do
      expect_any_instance_of(Warehouse).to receive(:init).with('8', '12')
      described_class.new.handle_event(command)
    end
  end

  context 'with view event' do
    let(:command) { 'view' }

    it do
      expect_any_instance_of(Warehouse).to receive(:view)
      described_class.new.handle_event(command)
    end
  end

  context 'with store event' do
    let(:command) { 'store 1 1 4 3 P' }

    it do
      expect_any_instance_of(Warehouse).to receive(:store).with('1', '1', '4', '3', 'P')
      described_class.new.handle_event(command)
    end
  end

  context 'with locate event' do
    let(:command) { 'locate P' }

    it do
      expect_any_instance_of(Warehouse).to receive(:locate).with('P')
      described_class.new.handle_event(command)
    end
  end

  context 'with remove event' do
    let(:command) { 'remove 2 2' }

    it do
      expect_any_instance_of(Warehouse).to receive(:remove).with('2', '2')
      described_class.new.handle_event(command)
    end
  end
end
