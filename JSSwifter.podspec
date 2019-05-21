Pod::Spec.new do |s|

    s.name             = 'JSSwifter'
    s.version          = '0.0.7'
    s.summary          = '一个简便易用的 Swift Extension 库。'
  
    s.description      = <<-DESC
    一个简便易用的 Swift Extension 库，方便快捷的提供项目中常用的 Extension。
                         DESC
  
    s.homepage         = 'https://github.com/spirit-jsb/JSSwifter'
  
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
  
    s.author           = { 'spirit-jsb' => 'sibo_jian_29903549@163.com' }
  
    s.swift_version = '5.0'
  
    s.ios.deployment_target = '9.0'
  
    s.source           = { :git => 'https://github.com/spirit-jsb/JSSwifter.git', :tag => s.version.to_s }
    
    s.source_files = 'Sources/**/*.swift'
        
    s.requires_arc = true
  
end