require 'rails_helper'

RSpec.describe Administrator, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "#password=" do
    example "文字列を与えると、hashed_password の長さ60の文字列になる" do
      member = Administrator.new;
      member.password = "baukis"
      expect(member.hashed_password).to be_kind_of(String)
      expect(member.hashed_password.size).to eq(60)
    end

    example "nilを与えると、hashed_password は nil になる" do
      member = Administrator.new(hashed_password: "x")  # "x"でなくても nil 以外なら何でもよい
      member.password = nil
      expect(member.hashed_password).to be_nil
    end
  end
end
