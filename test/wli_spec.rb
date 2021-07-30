require_relative './wli.rb'

describe Wli do
    it "no one like this" do
        wli = Wli.new("")
        likes = wli.likes

        expect(likes).to eq("no one like this")
    end
    
    it "1 person like this" do
        wli = Wli.new(["Peter"])
        likes = wli.likes

        expect(likes).to eq("#{wli.name} like this")
    end
end
