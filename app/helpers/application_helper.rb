module ApplicationHelper
  def document_title
    # "present?"は、Railsによる Objectクラスのインスタントメソッドである。
    # "@title"が空白以外ならば、if文は true である。
    if @title.present?
      "#{@title} - Baukis2"
    else
      "Baukis2"
    end
  end
end
