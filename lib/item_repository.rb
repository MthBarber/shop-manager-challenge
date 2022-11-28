require 'item'

class ItemRepository

    def initialize(terminal)
        @terminal = terminal
    end

    def all
        sql = 'SELECT id, item_name, unit_price, stock FROM items;'
        results = DatabaseConnection.exec_params(sql,[])
        items = []
        results.each do |record|
            item = Item.new
            item.id = record['id']
            item.item_name = record['item_name']
            item.unit_price = record['unit_price']
            item.stock = record['stock']
            items << item
        end
        return items
    end

    def stock_check
        sql = 'SELECT item_name, stock FROM items;'
        results = DatabaseConnection.exec_params(sql,[])
        items = []
        results.each do |record|
            @terminal.puts "#{record['item_name']} Qty: #{record['stock']}"
        end
    end
end