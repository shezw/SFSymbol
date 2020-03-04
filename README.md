# SFSymbol
SF Symbol 扩展

优雅的SF Symbol降级方案
Use Apple SF Symbols elegantly when you need compatibility before iOS13

需要先将使用到的图标导出为苹果可用格式，放置到Assets.xcassets文件夹中，保持完全相同的文件名
Make sure you have export the symbols to Assets.xcassets folder in Xcode. ( keep the name as same as the SF Symbols )


使用方式: 下载SFSymbol.swift 或复制到你的项目中
How to use: Download SFSymbol.swift or copy to your project

demo:

iconImage.setSFIcon( name:"doc.text" )
saveButton.setSFIcon( name:"square.and.arrow.down" )
