Pod::Spec.new do |s|
s.name             = 'FFWheelView' 
s.version          = '0.0.1' 
s.summary          = 'the first FFWheelView version commit'  
s.description      = <<-DESC
                  Realize the wireless broadcast function     
                        DESC
 
s.homepage         = 'https://github.com/JiMengfei/FFWheelView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'JiMengfei' => '726616682@qq.com' }
s.source           = { :git => 'https://github.com/JiMengfei/FFWheelView', :tag => s.version.to_s }
s.ios.deployment_target = '9.0' 
s.source_files = 'FFWheelView/*' 
end