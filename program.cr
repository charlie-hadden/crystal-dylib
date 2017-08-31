dylib = LibC.dlopen("#{__DIR__}/lib.dylib", LibC::RTLD_LAZY)

unless dylib
  error = String.new(LibC.dlerror)
  puts "dlopen error: #{error}"
  exit 1
end

say_hello = LibC.dlsym(dylib, "say_hello")
error_ptr = LibC.dlerror

if error_ptr
  error = String.new(error_ptr)
  puts "dlsym error #{error}"
  exit 1
end

Proc(UInt8*, Void).new(say_hello, Pointer(Void).null).call("World".to_unsafe)
