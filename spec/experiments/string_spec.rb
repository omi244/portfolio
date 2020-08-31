# テスト用のファイル。
# ファイル名は"*_spec.rb" とすること

require "spec_helper"

describe String do 
    describe "#<<" do
        example "文字の追加" do
            s = "ABC"
            s << "D"
            expect(s.size).to eq(4)

        end

        # example "nilの追加" do
        # xexample "nilの追加" do
        # example "nilは追加できない" do
        example "nilは追加できない", :exception do
            # pending("調査中")
            s = "ABC"
            # s << nil
            # expect(s.size).to eq(4)
            # raise_error マッチャーは、()内の例外が発生したかをチェックする
            expect { s << nil }.to raise_error(TypeError)
        end
    end
end