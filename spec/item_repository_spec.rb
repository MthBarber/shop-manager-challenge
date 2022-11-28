require 'item_repository'


RSpec.describe ItemRepository do 

    def reset_items_table
        seed_sql = File.read('spec/seeds_items.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
        connection.exec(seed_sql)
    end
    
    describe ItemRepository do
        before(:each) do 
        reset_items_table
        end

        ####### TEST HERE AS I NEED TO PRACTICE DOUBLES
    # xit 'Creates a new instance of ItemRepository with a double' do
    #     repo = ItemRepository.new
    #     item_1 = double(:item_1, item_name: "Hoover", unit_price: 70.00, stock:10)
    #     repo.add(item_1)
    #     expect(repo.all.length).to eq 1
    # end

    it 'Creates a new instance of ItemRepository' do
        repo = ItemRepository.new(terminal)        
        expect(repo.all.length).to eq 2
    end

    it "Can return a list of items and the available stock" do
        terminal = double :terminal
        repo = ItemRepository.new(terminal)
        repo.stock_check
        expect(terminal).to receive(:puts).with("Hoover Qty: 10").ordered
        expect(terminal).to receive(:puts).with("Firewood Qty: 50").ordered
    end
end

end