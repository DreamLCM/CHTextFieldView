
Pod::Spec.new do |s|
s.name             = 'CHTextFieldView'
s.version          = '1.0.2'
s.summary          = 'Swift3的自定义 TextFieldView'


s.description      = <<-DESC
Swift3的自定义 TextFieldView,支持扩展
DESC

s.homepage         = 'https://github.com/DreamLCM/CHTextFieldView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'LCM' => '212763791@qq.com' }
s.source           = { :git => 'https://github.com/DreamLCM/CHTextFieldView.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.source_files = 'CHTextFieldView/**/*'

end


#验证命令：pod lib lint CHTextFieldView.podspec --verbose
#提交命令：pod trunk push CHTextFieldView.podspec
