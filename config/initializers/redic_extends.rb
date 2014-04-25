# encoding: utf-8
class Redic
  def method_missing(method_id, *args)
    call(*args.unshift(method_id))
  end
end
