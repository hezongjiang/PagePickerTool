# PagePickerTool
基于Swift 3.0，仿照网易新闻分页的小项目
使用方法

1. 将`PagePicker`拖入自己的工程

2. 把需要实现功能的控制器，继承`PageViewController`

3. 重写`setupChildVC`方法即可

**注意：**在重写`setupChildVC`方法时，需要设置自控制器的`title`，该框架是根据自控制器的名字来设置上方滚动条的title
