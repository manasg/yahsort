require 'spec_helper'

describe Yahsort do
  it 'has a version number' do
    expect(Yahsort::VERSION).not_to be nil
  end

  it 'works for api10 api1 api2' do
    h = %w{ api10 api1 api2 }
    expect(h.sort &Yahsort.sorter).to eq(%w{api1 api2 api10})
  end

  it 'works with mixed server types-1' do
    h = %w{ db10 db2 api2 }
    expect(h.sort &Yahsort.sorter).to eq(%w{api2 db2 db10})
  end

  it 'works with mixed server types-2' do
    h = %w{ db10 db1 api10 api2}
    expect(h.sort &Yahsort.sorter).to eq(%w{api2 api10 db1 db10})
  end

  #todo match secondary & regex params
end
