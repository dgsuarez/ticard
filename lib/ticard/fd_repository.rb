module Ticard
  class FdRepository < LocalRepository

    def initialize(in_fd, out_fd)
      @in_fd = in_fd
      @out_fd = out_fd
    end

    protected 

    def read(_)
      @in_fd.read
    end

    def write(_, &b)
      b.call(@out_fd)
    end

  end
end
