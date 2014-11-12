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

  it 'works with padded 0s 001,002' do
    h = %w{ web002 web001 web003}
    expect(h.sort &Yahsort.sorter).to eq(%w{web001 web002 web003})
  
    h = %w{ api1 web010 web000 api10}
    expect(h.sort &Yahsort.sorter).to eq(%w{api1 api10 web000 web010})
  
  end
  
  
  fqdn_unsorted = %w{ web2.1domain web10.1domain web1.2domain}
  fqdn_sorted = %w{web1.2domain web2.1domain web10.1domain}

  it 'does not work with fqdn by default' do
    expect(fqdn_unsorted.sort &Yahsort.sorter).not_to eq(fqdn_sorted)
  end
  
  it 'works with fqdn using helper' do
    expect(fqdn_unsorted.sort &Yahsort.fqdn_sorter).to eq(fqdn_sorted)
  end
  
  it "works with additional digits" do
    h = %w{stag1api10 stag1api2 stag2api10 stag2api1 stag2api2}
    h_sorted = %w{stag1api2 stag1api10 stag2api1 stag2api2 stag2api10 }
    expect(h.sort &Yahsort.sorter).to eq(h_sorted)
  end

  it "works with longer fqdns with additional ." do
    h = %w{dev2xcn10.c26.tree.top.com dev2xcn11.c26.tree.top.com dev2xcn2.c26.tree.top.com}
    h_sorted = %w{dev2xcn2.c26.tree.top.com dev2xcn10.c26.tree.top.com dev2xcn11.c26.tree.top.com}
    expect(h.sort &Yahsort.fqdn_sorter).to eq(h_sorted)
  end
  
  #todo match secondary_precedence
end
