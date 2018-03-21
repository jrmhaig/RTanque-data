require 'rtanque'
require 'rtanque/runner'
require 'rtanque/data'
require 'pry'

RSpec.describe RTanque::Data do
  let(:runner) {
    RTanque::Runner.new(
      width: 500,
      height: 600,
      screen: 'data',
      max_ticks: 10,
      teams: false
    )
  }

  before(:each) do
    runner.add_brain_path('sample_bots/camper')
    runner.add_brain_path('sample_bots/camper')
  end

  describe '#run' do
    it 'returns the required number of frames' do
      expect(runner.start.count).to eq 10
    end

    it 'returns shells for each frame' do
      runner.start.each do |frame|
        expect(frame.keys).to include :shells
      end
    end

    it 'returns bots for each frame' do
      runner.start.each do |frame|
        expect(frame.keys).to include :bots
      end
    end
  end
end
