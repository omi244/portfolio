# class Staff::TopController < ApplicationController
class Staff::TopController < Staff::Base
    def index
        # raise       # エラーを発生させる
        render action: "index"
    end
end
