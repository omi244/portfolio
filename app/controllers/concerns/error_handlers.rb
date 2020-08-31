module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    # HTTPステータスエラー： 500の対策
    # "rescue_from" は、親（先祖）を上から順番に指定する必要がある。
    # → StandardError > ActionControllerError の順
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  # HTTPステータスエラー：403 が発生したときの処理
  private def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end

  # DBからレコードが見つからないときのエラー
  private def rescue404(e)
    render "errors/not_found", status: 404
  end

  # HTTPステータスエラー：500が発生したときに表示する内容
  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end