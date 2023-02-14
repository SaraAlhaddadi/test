require 'byebug'
class YoutubeLib
  def videos
    { a: 'a.com', b: 'b.com', c: 'c.com' }
  end

  def video(name)
    videos[name]
  end

  def download(url)
    videos.key(url)
  end
end

class VirtualYoutubeProxy
  attr_reader :youtube

  def method_missing(name, *args)
    return service.videos if name == :videos

    service.send(name, *args)
  end

  def service
    @service ||= YoutubeLib.new
  end
end

User = Struct.new(:name, :admin?)

class ProtectionYoutubeProxy
  attr_reader :user, :service

  def initialize(user)
    @service = YoutubeLib.new
    @user = user
  end

  def check_access
    raise 'not authorize' unless @user.admin?
  end

  def method_missing(name, *args)
    check_access
    return service.videos if name == :videos

    service.send(name, *args)
  end
end

class CacheYoutubeProxy
  attr_reader :service

  def initialize
    super
    @service = YoutubeLib.new
  end

  def videos
    cached_videos
  end

  def video(name)
    cached_videos[name]
  end

  def download(url)
    cached_videos.key(url)
  end

  def cached_videos
    @cached_videos ||= service.videos
  end
end

def call(obj)
  puts obj.videos
  puts obj.video(:a)
  puts obj.download('a.com')
end

call(YoutubeLib.new)
call(VirtualYoutubeProxy.new)
call(CacheYoutubeProxy.new)
call(ProtectionYoutubeProxy.new(User.new('ss', true)))
call(ProtectionYoutubeProxy.new(User.new('aa', false)))