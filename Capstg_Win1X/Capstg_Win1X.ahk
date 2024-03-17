;****************************************************
;* 【CapsLock增强脚本-Capstg-V20240317】
;*               by Ez and Tuutg
;****************************************************
global RunAny_Plugins_Version:="1.0.2.5"
; #Include %A_ScriptDir%\RunAny_ObjReg.ahk


/*;CapsLock增强脚本，例子 {{{1
;by Ez
;v20190721 添加在tc里面中键点击打开目录
;v20190904 更新暂停等热键，直接把AutoHotkey.exe改名为capsez.exe
;v20190916 添加几种模式的开关，解决BUG10任务栏无法切换
;v20190927 添加快捷键在TC中打开资源管理器中选中的文件，添加在tc中双击右键返回上一级。自动获取TC路径
;v20191214 添加媒体播放相关快捷键和右键拖动窗口，解决一点小问题和小细节
;v20200108 修复在资管或桌面没选文件的问题。再修复一些细节
;v20200401 添加不同程序中对应不同的小菜单，增强对话框，tab组合键等
;v20210405 添加侧边键增强等等细节。
;v20210601 继续添加对浏览器和播放器和侧边键鼠标的使用增强。
;v20210801 添加对IrfanView等程序的快捷键增强，改进调用启动器popsel的方式，其他小细节等
;v20211125 添加开启或关闭随系统自动启动，以及其他很小细节的优化
;v20220401 小细节优化
;v20220626 添加tc中数字键单击和双击效果，添加鼠标长按模式，添加everything中筛选器等，添加alt空格截图的开关，tc中alt+E为F4，中键改为在对侧面板新开标签
;v20220629 修复启动的时候卡顿，以及卡键问题
;v20220710 优化tc中数字键双击和长按操作，优化微信接收文件等

;by Tuutg
;v20230428 添加xnview mp程序的快捷键增强.增加简易设置Gui,方便无AHK基础的普通用户使用
;v20230710 添加tagLyst.exe程序的快捷键,添加找图点击功能等
;v20230730 优化IDM的下载对话框中MButton快捷键下载逻辑,用纯AHK,无需Quicker
;v20230730 添加WPS_et 双击中键关闭/单击中键缩放100%快捷键增强
;v20230801 cad: !w::定位到文件夹; F3=^f,对象捕捉
;v20230806 excel/word中 ALT约=Ctrl
;v20230807 Listary中Listary_WidgetWin_0 | 1
;v20230903 修复snipaste快捷键强制占用,恢复其他软件(Code编辑)中F3默认功能
;v20230905 完善简易Gui设置界面。增加Runany黑名单,修复Runany快捷键`强制占用,恢复其他软件`默认功能,如Listary
;v20231207 修正各种小错误,添加BCompare程序的增强快捷键等
;v20231215 开启{Space}模式,左手通用加强模式,单击标点符号,AHK编程符号优先.双击TC模式:数字小键盘+-*/等
;v20231215 开启{Space}模式,增加Snipaste和PixPin截图贴图工具栏左手键盘点击功能,
;v20231215 增加Snipaste和PixPin黑名单功能,恢复F1,f3默认功能.修复快捷键冲突,方法为用Controlsend,在冲突软件下再定义要的功能
;v20231216 添加ACDSee.exe程序的增强快捷键.添加一键启动|激活微信|微信文件传输助手等
;v20231220 修正各种小错误,添加UCompare,WinMerge程序的增强快捷键等
;v20231221 修正小错误,去除{Blind}模式,防止意外触发部分全局热键.IDM程序增加Ctrl+A全选并复制快捷键
;v20231225 增加Win11系统默认图片查看器增强快捷键.
;v20231225 升级Listary到6.3.0.36版(Win11).新增Listary搜索框中,CapsLock={Ctrl 2},用于快速切换到ListaryPro6.3文件窗口.和常规状态相反
;v20231226 打开|保存对话框中,CapsLock=Listary_CyJp,快速跳转到Listary中.WPS打开|保存对话框中适配uTools4.4.1版本
;v20231226 设置选项中,增加微信自定义安装路径,以及微信文件接收目录设置.
;v20240105 增加微信图片编辑器增强快捷键.增加Space & MButton::=打印的增强快捷键.优化缩减微信增强代码,优化一键搜索相关代码
;v20240108 修正Snipaste和PixPin保存图像时{space}无法打字的Bug,增加QQ|TIM图片编辑器增强快捷键
;v20240114 统一Listary和everything结果列表,caps|alt+W跳转到TC和MButton|alt+s跳转默认资管等增强快捷键
;v20240116 新增Anytext和FileLocator结果列表,caps|alt+W跳转到TC和MButton|alt+s跳转默认资管等增强快捷键
;v20240116 修复微信中复制粘贴时,单按CapsLock退出微信
;v20240124 优化EzTc中{space}+双击D|F|G用于文件选择时的逻辑,相当于取消选择相同|选择相同|反选
;v20240130 优化适配RunCaptX在32位系统和U盘版中的核心功能正常工作
;v20240301 优化适配Listary6.3以上版本,IDM自动下载,修复微信中在打开|保持等弹出对话框时按caps|+W弹出文件助手的问题,更改为caps|+W=Enter
;v20240306 优化适配浏览器组Alt模式;增加Acrobat和SumatraPDF单键模式快捷键
;v20240309 优化改进{space}模式,保留Space+X|C|V=Ctrl+X|C|V,降低记忆难度.优化统一PS和pdf导出文件,PDF|JPG|PNG=+!L|M|RButton
;v20240311 改进快捷键在Wps统一模式不起作用的bug
;v20240313 单键通用看图模式,适配Win7系统默认看图器和ACDSee
;v20240314 MButton盲点下载浏览按钮,适配360X浏览器的下载
;v20240315 恢复微信联系人简写+Space或Enter功能|[但是会导致微信中打字时用鼠标连选后再按Space+x|c失效,可直接按Space+c替代(有bug,暂时修复不了)或Caps+X|C|V]
;v20240316 新增Space+c模式剪切板内容显示;健全Shift+符号模式,可替代Shift用于符号输入
;v20240317 单键通用看图模式,适配Win11系统默认看图器,画图,XMind.exe

;定位到程序最后,用户自定义应用增强例子开始
;建议对“例子”位置进行自行修改
*/


;**************图标定义^ **************
IfExist, %A_ScriptDir%\Tg.ico
{
	Menu, TRAY, Icon, %A_ScriptDir%\Tg.ico, , 1
}
;**************图标定义$ **************


;管理员权限代码，放在文件开头 {{{1
loop, %0%
{
	param := %A_Index% ; Fetch the contents of the variable whose name is contained in A_Index.
	params .= A_Space . param
}
ShellExecute := A_IsUnicode ? "shell32\ShellExecute":"shell32\ShellExecuteA"
if not A_IsAdmin
{
	if A_IsCompiled
		DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_ScriptFullPath, str, params , str, A_WorkingDir, int, 1)
	else
		DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_AhkPath, str, """" . A_ScriptFullPath . """" . A_Space . params, str, A_WorkingDir, int, 1)
	ExitApp
}

;文件头 {{{1
;Directives		;脚本前参数指令
{
;#NoTrayIcon	;不显示托盘图标
#NoEnv	;不检查空变量为环境变量
#WinActivateForce ;强制激活窗口
#SingleInstance Force ;运行替换旧实例
#InstallKeybdHook ;强制无条件安装键盘钩子
#InstallMouseHook ;强制无条件安装鼠标钩子
#Persistent ;让脚本持久运行(关闭或ExitApp)
#MaxMem 4	 ;max memory per var use
#MaxHotkeysPerInterval 10000 ;设置的时间内按热键最大次数
#MenuMaskKey vkE8  ;将掩码键改成未分配的按键, 如 vkE8 等.20240229
;KeyHistory					;显示脚本信息和最近键击和鼠标点击的历史
ListLines,Off ;不显示最近执行的脚本行
SendMode Input ;使用更速度和可靠方式发送键鼠点击
;SendMode InputThenPlay ;如因速度过快导致发送不正常请则注释此行,影响Listary/Utools弹出
SetBatchLines -1 ;脚本全速执行(默认10ms)
SetKeyDelay 0 ;设置每次Send和ControlSend发送键击后自动的延时,使用-1表示无延时
SetWinDelay,0 ;执行窗口命令后,最小自动的延时(0 默认100ms),-1 表示无延时
SetControlDelay,0 ;控件修改命令自动延时(默认20)
SetTitleMatchMode, 2 ;窗口标题模糊匹配. RegEx ;窗口标题RegEx正则匹配
SetTitleMatchMode, slow ;窗口标题慢速模式匹配
Process Priority,,High ;线程,主,高级别
DetectHiddenWindows, On ;显示隐藏窗口
SetCapsLockState, AlwaysOff ;强制按键保持CapsLock关闭状态
CoordMode,Menu,Window ;~坐标相对活动窗口
CoordMode,Mouse,Window ;~坐标相对活动窗口
}

;************** group定义^ ****************** {{{1
{
;浏览器组,Caps+r|w,前进|后退,增强F2,F3,F4.启用Space系列快件键
; GroupAdd, Group_browser, ahk_class St.HDBaseWindow
GroupAdd, Group_browser, ahk_class IEFrame ;IE
; GroupAdd, Group_browser, ahk_class ApplicationFrameWindow ;Edge
GroupAdd, Group_browser, ahk_class MozillaWindowClass ;Firefox
GroupAdd, Group_browser, ahk_class QQBrowser_WidgetWin_1
GroupAdd, Group_browser, ahk_exe chrome.exe ;Chrome
GroupAdd, Group_browser, ahk_exe msedge.exe ;Edge
GroupAdd, Group_browser, ahk_exe 115chrome.exe ;115的播放器
GroupAdd, Group_browser, YywPlayerOperateFrame ahk_class XMLWnd
GroupAdd, Group_browser, ahk_exe 360chrome.exe ;360Chrome
GroupAdd, Group_browser, ahk_exe 360Chromex.exe ;360ChromeX.exe


;Ctrl+Space黑名单,禁用全局快捷键Ctrl+Space等
GroupAdd, Group_disableCtrlSpace, ahk_exe excel.exe
GroupAdd, Group_disableCtrlSpace, ahk_exe pycharm.exe
GroupAdd, Group_disableCtrlSpace, ahk_exe SQLiteStudio.exe
GroupAdd, Group_disableCtrlSpace, ahk_exe gvim.exe
GroupAdd, Group_disableCtrlSpace, ahk_class NotebookFrame


;打开|保持|...等对话框组,模仿Listary跳转目标路径,!w,!g,^g,!s,!f,Caps+w
GroupAdd, GroupDiagOpenAndSave, 新建 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 选择 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 保存 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 另存 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 存储 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 打开 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 上传 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 导入 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 导出 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 插入 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 浏览 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, Open ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, Save ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, Select ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, Browse ahk_class #32770

;上面为Ez原版GroupDiagOpenAndSave. 下面为Tuutg增加的组
GroupAdd, GroupDiagOpenAndSave, 并入 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 查找 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 发布 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 更改 ahk_class #32770

; GroupAdd, GroupDiagOpenAndSave, 添加 ahk_class #32770 ;此项影响!w-智能跳转,原因未知
GroupAdd, GroupDiagOpenAndSave, 输入 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 输出 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 替换 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 位置 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, 下载 ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, Acrobat ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, PDF ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, XPS ahk_class #32770
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe acad.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe Acrobat.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe chrome.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe Everything.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe iexplore.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe RunAny.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe RunAnyU64.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class #32770 ahk_exe Snipaste.exe

;下面为Tuutg增加的特殊非标准的GroupDiagOpenAndSave组
GroupAdd, GroupDiagOpenAndSave, ahk_exe FileShred.exe
GroupAdd, GroupDiagOpenAndSave, 浏览 ahk_exe BCompare.exe
GroupAdd, GroupDiagOpenAndSave, ahk_class TSelectFolderForm
GroupAdd, GroupDiagOpenAndSave, 打开 ahk_class WindowsForms10.Window.8.app.0.3ce0bb8_r34_ad1
GroupAdd, GroupDiagOpenAndSave, 另存 ahk_class WindowsForms10.Window.8.app.0.3ce0bb8_r34_ad1
GroupAdd, GroupDiagOpenAndSave, ahk_class ATL:003F83B0 ahk_exe HRConfig.exe


;WPS-Office组,方法1,uTools: $!f::模仿Listary, 跳转目标路径,会有失败概率
GroupAdd, Group_WPS, ahk_exe wpp.exe
GroupAdd, Group_WPS, ahk_exe et.exe
GroupAdd, Group_WPS, ahk_exe wps.exe
GroupAdd, Group_WPS, ahk_exe wpspdf.exe


;资源管理器组,模仿TC:F2,F3,F7,F8,压缩|隐藏,双击右键,返回目录.quicklook预览
; GroupAdd, Group_explorer, ahk_class TTOTAL_CMD	;TC资管
; GroupAdd, Group_explorer, ahk_exe explorer.exe	;Win-1分4
GroupAdd, Group_explorer, ahk_class CabinetWClass  	;Win1X资管
GroupAdd, Group_explorer, ahk_class ExploreWClass 	;Win7资管
GroupAdd, Group_explorer, ahk_exe Q-Dir.exe
GroupAdd, Group_explorer, ahk_exe Q-Dir32.exe
GroupAdd, Group_explorer, ahk_class 360ExplorerFrame
GroupAdd, Group_explorer, ahk_exe clover.exe
GroupAdd, Group_explorer, ahk_exe XYplorer.exe
GroupAdd, Group_explorer, ahk_exe OneCommander.exe
GroupAdd, Group_explorer, ahk_exe Multi Commander.exe
GroupAdd, Group_explorer, ahk_exe EFCW.exe
GroupAdd, Group_explorer, ahk_exe dopus.exe
GroupAdd, Group_explorer, ahk_class WinRarWindow

;桌面组,模仿TC:F2,F3,F7,F8,压缩|隐藏,双击右键,返回目录.quicklook预览
GroupAdd, Group_Desktop, ahk_class Progman 	  	;Win1X桌面
GroupAdd, Group_Desktop, ahk_class WorkerW		;Win7桌面


;资源管理器组,模仿TC:F2,F3,F7,F8,压缩|隐藏,双击右键,返回目录.quicklook预览
GroupAdd, CapsLockKeysAsBackSpace, ahk_class TTOTAL_CMD	;TC资管
GroupAdd, CapsLockKeysAsBackSpace, ahk_class CabinetWClass	;Win1X资管
GroupAdd, CapsLockKeysAsBackSpace, ahk_class ExploreWClass	;Win7资管
GroupAdd, CapsLockKeysAsBackSpace, ahk_class 360ExplorerFrame
GroupAdd, CapsLockKeysAsBackSpace, ahk_class WinRarWindow
GroupAdd, CapsLockKeysAsBackSpace, ahk_exe Q-Dir.exe


;代码编辑器组,增加注释,查找,定位,替换,保存,比较快捷键
; GroupAdd, Group_code, ahk_class SciTEWindow
GroupAdd, Group_code, ahk_exe AutoAHK.exe
GroupAdd, Group_code, ahk_exe AHKEditor.exe
GroupAdd, Group_code, Adventure ahk_class AutoHotkeyGUI	;Adventure.exe
GroupAdd, Group_code, Code ahk_class Chrome_WidgetWin_1	;Code.exe
GroupAdd, Group_code, GVIM ahk_class Vim	;GVim.exe
GroupAdd, Group_code, VIM ahk_class ConsoleWindowClass	;Vim.exe
GroupAdd, Group_code, ahk_class Notepad
GroupAdd, Group_code, ahk_class Notepad2U
GroupAdd, Group_code, ahk_class Notepad3U
GroupAdd, Group_code, ahk_class Notepad3
GroupAdd, Group_code, ahk_class Notepad++
GroupAdd, Group_code, ahk_class Qt5152QWindowIcon ahk_exe Notepad--.exe
GroupAdd, Group_code, ahk_class PX_WINDOW_CLASS	;Python
GroupAdd, Group_code, uTools ahk_class Chrome_WidgetWin_1	;uTools
GroupAdd, Group_code, ahk_class ConsoleWindowClass	;cmd.exe
GroupAdd, Group_code, ahk_exe SourceTree.exe
GroupAdd, Group_code, ahk_exe GitHubDesktop.exe
GroupAdd, Group_code, ahk_class SunAwtFrame	;webstorm64.exe|pycharm64.exe
GroupAdd, Group_code, ahk_exe EmEditor.exe
GroupAdd, Group_code, ahk_class TkTopLevel	;ahk_exe pythonw.exe
GroupAdd, Group_code, ahk_exe BCompare.exe
GroupAdd, Group_code, ahk_exe uc.exe	;UltraCompare
GroupAdd, Group_code, ahk_exe WinMergeU.exe


;打印机组,快速选择打印机,单击中键=盲点Enter,打印,OK等......
GroupAdd, Group_打印, 打印 ahk_exe wps.exe	;wps
GroupAdd, Group_打印, 打印 ahk_class #32770	;通用
GroupAdd, Group_打印, ahk_class PSFloatC	;Photoshop所有简单弹出对话框
GroupAdd, Group_打印, 打印 ahk_exe xnviewmp.exe	;xnviewmp.exe
GroupAdd, Group_打印, 打印 ahk_class bosa_sdm_XL9 ;wps_et


;Snipaste和PixPin黑名单,恢复被截图软件占用的全局快捷键F1,F3等
GroupAdd, Group_disableSnipaste, ahk_exe Adventure.exe
GroupAdd, Group_disableSnipaste, ahk_class SciTEWindow
GroupAdd, Group_disableSnipaste, ahk_exe regedit.exe


;截图软件等中启用单独Space模式用于工具切换,而非默认的符号数字输入模式
;恢复Adobe软件等中原始Space功能或其他单独Space模式,而非符号输入模式
GroupAdd, Group_SingleSpace, ahk_exe Snipaste.exe	;Space模式用于工具切换
GroupAdd, Group_SingleSpace, ahk_exe PixPin.exe	;Space模式用于工具切换
GroupAdd, Group_SingleSpace, 图像 ahk_class #32770	;恢复Snipaste|PixPin另存为打字功能
GroupAdd, Group_SingleSpace, ahk_class XLMAIN	;Space模式用于工具|数字,20240307
GroupAdd, Group_SingleSpace, ahk_class Photoshop	;原始Space功能和替代Ctrl+...
; GroupAdd, Group_SingleSpace, ahk_class Premiere	;原始Space功能
; GroupAdd, Group_SingleSpace, ahk_exe Animate.exe	;原始Space功能
; GroupAdd, Group_SingleSpace, ahk_class AcrobatSDIWindow ;原始Space功能
; GroupAdd, Group_SingleSpace, ahk_exe Dreamweaver.exe 	;原始Space功能
; GroupAdd, Group_SingleSpace, ahk_exe AfterFX.exe	;原始Space功能
; GroupAdd, Group_SingleSpace, ahk_class illustrator ;原始Space功能
GroupAdd, Group_SingleSpace, QUICKSEARCH ahk_class TQUICKSEARCH ;20240309
GroupAdd, Group_SingleSpace, ahk_exe WeChat.exe	;快速联系人用原始Space
; GroupAdd, Group_SingleSpace, ahk_exe QQ.exe ;Space模式用于工具切换,20240108
; GroupAdd, Group_SingleSpace, ahk_exe TIM.exe ;Space模式用于工具切换,20240108
; GroupAdd, Group_SingleSpace, ahk_class SciTEWindow ;符号|数字输入模式,20240311




;Runany黑名单,禁用全局快捷键`
; GroupAdd, Group_disableRunany, ahk_exe mainfree.exe
; GroupAdd, Group_disableRunany, ahk_exe Tdxw.exe
; GroupAdd, Group_disableRunany, ahk_exe dzh2.exe
GroupAdd, Group_disableRunany, ahk_exe Snipaste.exe	;鼠标穿透
GroupAdd, Group_disableRunany, ahk_exe PixPin.exe	;鼠标穿透


;中键(MButton)关闭标签组,单击中键缩放100%->保存/双击中键关闭
GroupAdd, Group_MButtonDoubleClose, ahk_exe Notepad++.exe
GroupAdd, Group_MButtonDoubleclose, ahk_exe MindMaster.exe
GroupAdd, Group_MButtonDoubleclose, ahk_exe XMind.exe
GroupAdd, Group_MButtonDoubleclose, ahk_class AcrobatSDIWindow
GroupAdd, Group_MButtonDoubleclose, ahk_class QWidget ;wpspdf.exe
GroupAdd, Group_MButtonDoubleclose, ahk_class Photoshop
GroupAdd, Group_MButtonDoubleclose, ahk_class DOCBOX_PDF_FRAME
GroupAdd, Group_MButtonDoubleclose, ahk_class Notepad ;Win11记事本


;中键(MButton)盲点“确定”或者OK按钮,右键(RButton)双击关闭
GroupAdd, Group_MButtonClickOk, ahk_class #32770
GroupAdd, Group_MButtonClickOk, ahk_exe 360EyeGuardian.exe
GroupAdd, Group_MButtonClickOk, Adobe ahk_class #32770	;Adobe
GroupAdd, Group_MButtonClickOk,	页面ahk_class #32770	;Adobet替换页面
GroupAdd, Group_MButtonClickOk, ahk_class #32770 ahk_exe Acrobat.exe
GroupAdd, Group_MButtonClickOk, ahk_class #32770 ahk_exe TOTALCMD.EXE
GroupAdd, Group_MButtonClickOk, ahk_class #32770 ahk_exe TOTALCMD64.EXE
GroupAdd, Group_MButtonClickOk, ahk_class #32770 ahk_exe Everything.exe
GroupAdd, Group_MButtonClickOk, ahk_class TCheckMsgBox
GroupAdd, Group_MButtonClickOk, ahk_class TInpComboDlg
GroupAdd, Group_MButtonClickOk, ahk_class TExtMsgForm
GroupAdd, Group_MButtonClickOk, ahk_exe QuickJump.exe
GroupAdd, Group_MButtonClickOk, ahk_class TOverWriteForm


;中键(MButton)盲点,快速自动输入U-Key等密码口令
GroupAdd, MButtonClickPassWord, 阿里云盘分享 ahk_class Chrome_WidgetWin_1
GroupAdd, MButtonClickPassWord, 口令 ahk_class #32770 ahk_exe Acrobat.exe
GroupAdd, MButtonClickPassWord, 文档属性 ahk_class #32770 ahk_exe Acrobat.exe


;中键(MButton)盲点,快速自动输入Cqc-U-Key密码口令
GroupAdd, Group_CQCCAPassWord, inputpasswdui ahk_class #32770
GroupAdd, Group_CQCCAPassWord, 核对数字证书口令 ahk_class #32770
GroupAdd, Group_CQCCAPassWord, Dialog ahk_exe certTool.exe
GroupAdd, Group_CQCCAPassWord, Verify PIN ahk_class #32770


;微信中的页面,增加单键翻页,双击右键,关闭退出
GroupAdd, 微信中的页面, 微信 ahk_class CefWebViewWnd
GroupAdd, 微信中的页面, 微信 ahk_class Chrome_WidgetWin_0
GroupAdd, 微信中的页面, 公众号 ahk_class H5SubscriptionProfileWnd
GroupAdd, 微信中的页面, ahk_class FileManagerWnd


;Ctrl+A增强组,增加全选后默认复制动作
GroupAdd, Group_ableCtrlAC, ahk_exe IDMan.exe


;EZTC-32位版中禁用右键(RButton)双击返回上级目录,EZTC自带功能
GroupAdd, Group_disableRButtonBackspace, 10.50 - Frank Zheng ahk_exe TOTALCMD.EXE
GroupAdd, Group_disableRButtonBackspace, 11.02 - Frank Zheng ahk_exe TOTALCMD.EXE
; GroupAdd, Group_disableRButtonBackspace, 11.03 - Frank Zheng ahk_exe TOTALCMD.EXE


;Listary5|6搜索框增强.功能:双右键=ESC,双Caps={Ctrl 2},单击Caps={Ctrl},结果列表跳转到资管等
GroupAdd, Group_ListarySearchBox, ahk_class Listary_WidgetWin_0	;Listary5搜索框
GroupAdd, Group_ListarySearchBox, ahk_class Listary_WidgetWin_1	;Listary5搜索框
GroupAdd, Group_ListarySearchBox, Search ahk_exe Listary.exe	;Listary6搜索框
;GroupAdd, Group_ListarySearchBox, SearchBarWindow ahk_exe Listary.exe ;Listary6
;GroupAdd, Group_ListarySearchBox, LauncherSearchWindow ahk_exe Listary.exe ;Listary6
GroupAdd, Group_ListarySearchBox, Listary ahk_exe Listary.exe ;Listary6.3文件搜索窗口


;Space符号模式,快速输入>符号,TC中数字小键盘等
GroupAdd, SpaceKeysAsShiftInTC, ahk_exe Listary.exe
GroupAdd, SpaceKeysAsShiftInTC, ahk_class TTOTAL_CMD
GroupAdd, SpaceKeysAsShiftInTC, ahk_class EVERYTHING


GroupAdd, DisableGridMove, ahk_class Photoshop
; GroupAdd, DisableGridMove, ahk_exe Acrobat.exe


;（注：ahk_class后面是AHK检测出的class名）
;************** group定义$ **************
}

;**************脚本初始设置^ ****************** {{{1
; Label_DefVar: ; 初始化变量|设置
global INI := % A_ScriptDir "\Capstg_inRa.ini" ; 配置文件
global GV_ToggleWheelOnCursor,COMMANDER_PATH,SOFTDIR,ScreenShotPath,RunCaptX,QQTimFPath

;设定5分钟重启一次脚本，防止卡键 1000*60*15
GV_ReloadTimer := % 1000*60*5
GV_ToggleReload := 1
gosub,Label_ReadINI
gosub,AutoReloadInit
gosub,CreatTrayMenu


;Esc键的作用，默认WinClose，作为alt+f4关闭程序，可选CapsLock，作为切换大小写
;GV_EscKeyAs := "WinClose"
GV_EscKeyAs := "Escape"
;GV_EscKeyAs := "CapsLock"
;GV_EscKeyAs := "BackSpace"

;启动器选择，可选为popsel和qsel
;GV_PopSel_QSel := "popsel"
GV_PopSel_QSel := "qsel"

;是否启用光标下滚轮, 默认关闭,0 (Win7设置为1)
; GV_ToggleWheelOnCursor := 0

;tab系列组合键，适合左键右鼠，启用后直接按tab会感觉有一点延迟，默认开启，开关为ctrl+win+alt+花号
GV_ToggleTabKeys := 1

;启用`花号键，与ranany冲突，默认关闭,0
GV_ToggleHhjKeys := 0

;启用空格系列快捷键，code等文本编辑器启用,会影响打字，在tc中会不能按住连选文件，默认开启，开关为ctrl+win+alt+空格
GV_ToggleSpaceKeys := 1

;空格键模式切换, 默认和Capslock模式一致,启用1
;Capslock模式,通用,Spk+EDSF=上下左右,约等于Ctrl
GV_SpaceKeysAsCapsLock := 1

;Shift符号模式,在Code|TC等中,左手符号|数字快速输入,启用1
GV_SpaceKeysAsShiftInTC := 1

;在浏览器中启用空格系列快捷键, 默认开启,1
GV_GroupBrowserToggleSpaceKeys := 1

;在浏览器中切换滚轮模式，默认关闭,0
;视频中滚轮为左右快进，主要是用来看视频网站，开关默认为左边alt加空格或者双击侧边键1
GV_GroupBrowserToggleWheelModeLeftRight := 0
;页面中滚轮为翻页，几行和一页间切换
GV_GroupBrowserToggleWheelModeUpDown := 0
;在浏览器中切换侧边键作为中键模式
GV_GroupBrowserToggleMButtonMode := 0


;在Totalcmd中使用数字键，单击快速打开文件，双击跳转标签, 默认开启,1
GV_TotalcmdToggleJumpByNumber := 1

;单键模式，开关按键为caps+/, 默认关闭,0
GV_ToggleKeyMode := 0

;置顶模式，开关按键为#F1, 默认关闭,0
GV_ToggleAlwaysontopKeys := 0

;截图文件临时变量
global SSFileName
;截图的时候同时进剪贴板
global GV_ScreenShot2Clip := 1

;64位的Win7下，在输入框中是148003967
GV_CursorInputBox_64Win710 := 148003967
;正常鼠标指针
GV_CursorNormal_64Win710 := 124973738
;超链接鼠标指针
GV_CursorClick_64Win710 := 1197314685

GV_CursorInputBox := GV_CursorInputBox_64Win710
GV_CursorClick := GV_CursorClick_64Win710
GV_CursorNormal := GV_CursorNormal_64Win710

;处于编辑状态
GV_Edit_Mode := 0


gv_url_tdx_f10 := "http://data.eastmoney.com/notices/stock/"
gv_url_html := ".html"

;设置TC主目录在本机的位置
;global COMMANDER_PATH := % A_ScriptDir
;global COMMANDER_PATH := "D:\RunCaptX\GreenTools\Totalcmd\SoftDir\totalcmd_ez"
if A_Is64bitOS AND FileExist(COMMANDER_PATH . "\" . "TOTALCMD64.EXE"){
	COMMANDER_NAME := "TOTALCMD64.EXE"
} else {
	COMMANDER_NAME := "TOTALCMD.EXE"
}
global COMMANDER_EXE := COMMANDER_PATH . "\" . COMMANDER_NAME
EnvSet,COMMANDER_PATH, %COMMANDER_PATH%
EnvSet,COMMANDER_EXE, %COMMANDER_EXE%
EnvSet,RunCaptX ,%RunCaptX%
; EnvSet,RunCaptX , D:\RunCaptX

;GV_ToolsPath := % GF_GetSysVar("ToolsPath")
GV_TempPath := % GF_GetSysVar("TEMP")
RunCaptX := % GF_GetSysVar("RunCaptX")

;绿软根目录SoftDir，默认在tc目录的上一层，这里是脚本内的环境变量，所有从ahk中启动的程序都会继承这个变量，
;如果电脑相对固定，则可以考虑在右键菜单中选添加系统的环境变量固定下来
;用EnvUpdate 会导致卡顿
SOFTDIR := % GF_GetSysVar("SoftDir")
if !SOFTDIR
{
	SOFTDIR := RegExReplace(COMMANDER_PATH,"\\[^\\]+\\?$")
	EnvSet,SoftDir, % SOFTDIR
}


;默认双击快捷键间隔300微秒
GV_KeyTimer := 300
GV_MouseTimer := 400
GV_KeyClickAction1 :=
GV_KeyClickAction2 :=
GV_KeyClickAction3 :=
;长按的按钮，0为默认不管，1左键2右键3中键
GV_MouseButton := 0
GV_LongClickAction :=

TC_Msg := 1075
CM_OpenDrives := 2122
CM_OpenDesktop := 2121
CM_OpenPrinters := 2126
CM_OpenNetwork := 2125
CM_OpenControls := 2123
CM_OpenRecycled := 2127
CM_CopySrcPathToClip := 2029
CM_CopyFullNamesToClip := 2018
CM_ConfigSaveDirHistory := 582

;ScreenShotPath := "C:\Temp\"

;Tim中座标位置
Tim_Start_X := 100
Tim_Start_Y := 100
Tim_Bar_Height := 60

;QQ中座标位置
QQ_Start_X := 100
QQ_Start_Y := 30
QQ_Bar_Height := 45

WX_Start_X := 180
WX_Start_Y := 100
WX_Bar_Height := 62

TG_Start_X := 100
TG_Start_Y := 110
TG_Bar_Height := 62


;用ramdisk的时候，有时候不能自动的建立Temp目录
;FileDelete,% GV_TempPath
;FileCreateDir, % GV_TempPath
;Run nircmd execmd mkdir "%GV_TempPath%"
;FileCreateDir, % GV_TempPath . "\ChromeCache"
;**************脚本初始设置$ ******************

;************** 在光标下方滚轮^ ************** {{{1
;Autoexecute code
MinLinesPerNotch := 1
MaxLinesPerNotch := 5
AccelerationThreshold := 100
AccelerationType := "L" ;Change to "P" for parabolic acceleration
StutterThreshold := 10

;************** 在光标下方滚轮开始^ ************** {{{2
;Function definitions
;See above for details on parameters
FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType, StutterThreshold)
{
	SetBatchLines, -1 ;Run as fast as possible
	CoordMode, Mouse, Screen ;All coords Relative to Screen

	;Stutter filter: Prevent stutter caused by cheap mice by ignoring successive WheelUp/WheelDown events that occur to close together.
	If(A_TimeSincePriorHotkey < StutterThreshold) ;Quickest succession time in ms
		If(A_PriorHotkey = "WheelUp" Or A_PriorHotkey ="WheelDown")
		return

		MouseGetPos, m_x, m_y,, ControlClass2, 2
		ControlClass1 := DllCall( "WindowFromPoint", "int64", (m_y << 32) | (m_x & 0xFFFFFFFF), "Ptr") ;32-bit and 64-bit support

		lParam := (m_y << 16) | (m_x & 0x0000FFFF)
		wParam := (120 << 16) ;Wheel delta is 120, as defined by MicroSoft

	;Detect WheelDown event
	If(A_ThisHotkey = "WheelDown" Or A_ThisHotkey = "^WheelDown" Or A_ThisHotkey = "+WheelDown" Or A_ThisHotkey = "*WheelDown")
		wParam := -wParam ;If scrolling down, invert scroll direction

	;Detect modifer keys held down (only Shift and Control work)
	If(GetKeyState("Shift","p"))
		wParam := wParam | 0x4
	If(GetKeyState("Ctrl","p"))
		wParam := wParam | 0x8

		;Adjust lines per notch according to scrolling speed
		Lines := LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType)

	If(ControlClass1 != ControlClass2)
	{
		loop %Lines%
		{
			SendMessage, 0x20A, wParam, lParam,, ahk_id %ControlClass1%
			SendMessage, 0x20A, wParam, lParam,, ahk_id %ControlClass2%
		}
	}
	else
	{
		SendMessage, 0x20A, wParam * Lines, lParam,, ahk_id %ControlClass1%
	}
}

;All parameters are the same as the parameters of FocuslessScroll()
;return value: returns the number of lines to be scrolled calculated from the current scroll speed.
LinesPerNotch(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold, AccelerationType)
{
	T := A_TimeSincePriorHotkey

	if((T > AccelerationThreshold) Or (T = -1)) ;T = -1 if this is the first Hotkey ever Run
	{
		Lines := MinLinesPerNotch
	}
	else
	{
		if(AccelerationType = "P")
		{
			A := (MaxLinesPerNotch-MinLinesPerNotch)/(AccelerationThreshold**2)
			B := -2 * (MaxLinesPerNotch - MinLinesPerNotch)/AccelerationThreshold
			C := MaxLinesPerNotch
			Lines := Round(A*(T**2) + B*T + C)
		}
		else
		{
			B := (MinLinesPerNotch-MaxLinesPerNotch)/AccelerationThreshold
			C := MaxLinesPerNotch
			Lines := Round(B*T + C)
		}
	}
return Lines
}

;在任务栏上滚轮调整音量等 {{{2
#If MouseIsOver("ahk_class Shell_TrayWnd") or MouseIsOver("ahk_class Shell_SecondaryTrayWnd")
WheelUp::gosub,Sub_volUp
WheelDown::gosub,Sub_volDown

;中键静音
$MButton::gosub,Sub_volMute
$!MButton::gosub,Sub_volMute

;启动svv
;~LButton::
	;GV_LongClickAction := "gosub,Sub_sv"
	;GV_MouseButton := 1
	;gosub,Sub_ButtonLongPress
;return
;****************************************************
$!q::SendInput,#q	;Windows1X_搜索中心

CapsLock & w:: ;启动激活微信|微信文件传输助手
	IfWinNotExist,ahk_exe WeChat.exe
	{
		gosub,RunWechat	;启动激活微信
		WinActivate, ahk_exe WeChat.exe
		WinWait, ahk_exe WeChat.exe
	}
	else {
		SendInput,^!w	;激活微信,20231216
		Sleep,100
		gosub,微信文件传输助手
	}
return

$!e::Run,%COMMANDER_PATH%\Tools\AutoHotkey\SciTE\SciTE.exe

$!r::	;启动激活Rolan
	IfWinNotExist,Rolan ahk_exe Rolan.exe
	{
		Run,%RunCaptX%\GreenTools\Rolan\Rolan.exe
		WinWait, Rolan ahk_exe Rolan.exe
		SendInput,!r
		}
	else {
		SendInput,!r
	}
return

$!t::	;呼出任务管理器窗口|tagLyst主窗口
	if WinExist("ahk_exe tagLyst.exe"){
		SendInput,^#t	;呼出/隐藏tagLyst主窗口
		WinActivate, tagLyst ahk_class Chrome_WidgetWin_1
		WinWait, tagLyst ahk_class Chrome_WidgetWin_1
		WinMove, tagLyst ahk_class Chrome_WidgetWin_1, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	}
	else {
		SendInput,^+{Esc}	;呼出任务管理器窗口
	}
return
;****************************************************
; $!a::SendInput,!a ;微信截图|一键Anytext搜索|Listray_智能命令

$!s::
	if WinExist("ahk_exe WindowSpy.exe"){
		WinActivate, Window Spy ahk_class AutoHotkeyGUI
	}
	else {
		Run,%COMMANDER_PATH%\Tools\AutoHotkey\WindowSpy.exe
		WinActivate, Window Spy ahk_class AutoHotkeyGUI
	}
return

$!d::SendInput,#d	;呼出/隐藏桌面

$!f::gosub,TextToEverything	;一键everything搜索

$!g::SendInput,!g	;呼出Utools_goole_翻译
;****************************************************
;$!z::	;预留
$!x::	;启动AnyTXT Searcher
	IfWinNotExist,ahk_exe ATGUI.exe
	{
	Run,"%RunCaptX%\GreenTools\AnyTXT Searcher\ATGUI.exe"
	WinActivate, ATGUI.exe
	WinWait, ATGUI.exe
	}
return

$!c:: ;gosub,DbRButtonGoDesktop	;预留给UTools,OCR_识别复制|显示桌面
	if (WinExist("ahk_exe Loom.exe") or WinExist("ahk_exe uTools.exe")){
		SendInput,!c	;呼出Loom|Utools_OCR_识别复制
	}
	else {	;显示桌面
		SendInput,#d	;显示桌面
	}
return

$!v::
	IfExist, D:\Program Files\Microsoft VS Code\Code.exe
		Run,"D:\Program Files\Microsoft VS Code\Code.exe"	;呼出Code.exe
	else IfExist,%RunCaptX%\GreenTools\Notepad--\notepad--.exe
		Run,%RunCaptX%\GreenTools\Notepad--\notepad--.exe	;呼出Notpad--
	else Run,notepad.exe ;系统自带notepad.exe
return

$!b::	;呼出Bandicam
	IfExist, %RunCaptX%\GreenTools\SCapture\Bandicam\Bandicam.exe
	Run,%RunCaptX%\GreenTools\SCapture\Bandicam\Bandicam.exe
return
;****************************************************
$!w::	;激活TOTAL_CMD,并开启半屏显示
	IfWinNotExist,ahk_class TTOTAL_CMD
	{
		Run, %COMMANDER_EXE%
		WinActivate, ahk_class TTOTAL_CMD
		WinWait, ahk_class TTOTAL_CMD
		WinMove, ahk_class TTOTAL_CMD, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	}
	else {
		WinActivate, ahk_class TTOTAL_CMD
		WinWait, ahk_class TTOTAL_CMD
		WinMove, ahk_class TTOTAL_CMD, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	}
return

;任务栏,双击右键,显示桌面
$RButton::	;20240317
	GV_MouseTimer := 400
	GV_KeyClickAction1 := "SendInput,{Click,Right}"
	GV_KeyClickAction2 := "SendInput,#d" ;显示桌面
	GV_LongClickAction := "SendInput,{Click,Right}"
	gosub,Sub_MouseClick123
return
#If

Sub_volDown:
	SetTimer,SliderOff,1000
	SoundSet,-2
	gosub,DisplaySlider
return

Sub_volUp:
	SetTimer,SliderOff,1000
	SoundSet,+2
	gosub,DisplaySlider
return

Sub_volMute:
	SetTimer,SliderOff,1000
	SoundSet, +1, , mute
	SoundGet, master_mute, , mute
	if master_mute = Off
		gosub,DisplaySlider
	else if master_mute = On
		Progress,0,0, ,音量大小
return

SliderOff:
	Progress,Off
return

DisplaySlider:
	SoundGet,Volume
	Volume:=Round(Volume)
	Progress,%Volume%,%Volume%, ,音量大小
return

Sub_sv:
	Run, SndVol.exe
return

#IfWinActive ahk_exe SndVol.exe
	$RButton::WinClose A
	$MButton::WinClose A
#IfWinActive

Sub_svv:
	Run, soundvolumeview.exe
return

#IfWinActive ahk_exe soundvolumeview.exe
$MButton::SendInput, ^{6 10}

;5%
k::SendInput, ^4
j::SendInput, ^3
WheelUp::SendInput, ^4
WheelDown::SendInput, ^3

; 1%
!k::SendInput, ^2
!j::SendInput, ^1
!WheelUp::SendInput, ^2
!WheelDown::SendInput, ^1

; 10%
^k::SendInput, ^4
^j::SendInput, ^3
^WheelUp::SendInput, ^4
^WheelDown::SendInput, ^3

; Toggle mute
m::SendInput, {F9}
Esc::SendInput, !fx
$RButton::
	GV_MouseTimer := 400
	GV_KeyClickAction1 := "SendInput,{Click,Right}"
	GV_KeyClickAction2 := "SendInput,!fx"
	gosub,Sub_MouseClick123
return
#IfWinActive

;Win10里面已经不需要光标下滚轮这个功能
#If (GV_ToggleWheelOnCursor=1) and (A_OSVersion in WIN_2003,WIN_XP,WIN_7)
{
WheelUp::FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold,AccelerationType, StutterThreshold)
WheelDown::FocuslessScroll(MinLinesPerNotch, MaxLinesPerNotch, AccelerationThreshold,AccelerationType, StutterThreshold)
^WheelUp::SendInput,^{WheelUp}
^WheelDown::SendInput,^{WheelDown}
!WheelUp::SendInput,!{WheelUp}
!WheelDown::SendInput,!{WheelDown}
}
#If

;************** 在光标下方滚轮结束 ************** {{{2


;************** 定时重启脚本部分，别动位置^ ************** {{{1
AutoReloadInit:
	SetTimer, ForceSelfReload, % GV_ReloadTimer
return

SelfReload:
	if (GV_ToggleReload && !GV_GroupBrowserToggleMButtonMode && !GV_GroupBrowserToggleWheelModeLeftRight && !GV_GroupBrowserToggleWheelModeUpDown)
	{
		SendInput,{Space Up}
		SendInput,{Tab up}
		SendInput,{CapsLock Up}
		SendInput,{ScrollLock Up}

		SendInput,{LWin Up}
		SendInput,{RWin Up}

		SendInput,{Shift Up}
		SendInput,{LShift Up}
		SendInput,{RShift Up}

		SendInput,{Alt Up}
		SendInput,{LAlt Up}
		SendInput,{RAlt Up}

		SendInput,{Control Up}
		SendInput,{LControl Up}
		SendInput,{RControl Up}

		SendInput,{Volume_Down Up}
		SendInput,{Volume_Up Up}
		;SendInput,{Volume_Mute Up}
		Sleep 100
		Reload
	}
return

ForceSelfReload:
	SendInput,{Space Up}
	SendInput,{Tab up}
	Send,{CapsLock up}
	SendInput,{ScrollLock Up}

	Send,{LWin Up}
	Send,{RWin Up}

	Send,{Shift Up}
	Send,{LShift Up}
	Send,{RShift Up}

	Send,{Alt Up}
	Send,{LAlt Up}
	Send,{RAlt Up}

	Send,{Control Up}
	Send,{LControl Up}
	Send,{RControl Up}

	SendInput,{F1 Up}
	SendInput,{F2 Up}
	SendInput,{F3 Up}
	SendInput,{F4 Up}
	SendInput,{F5 Up}
	SendInput,{F6 Up}
	SendInput,{F7 Up}
	SendInput,{F8 Up}
	SendInput,{F9 Up}
	SendInput,{F10 Up}
	SendInput,{F11 Up}
	SendInput,{F12 Up}

	Send,{Volume_Down Up}
	Send,{Volume_Up Up}
	;SendInput,{Volume_Mute Up}
	Sleep 100
	Reload
return
;************** 定时重启脚本部分，别动位置$ **************


;************** caps+鼠标滚轮调整窗口透明度^ ************** {{{1
;caps+鼠标滚轮调整窗口透明度（设置30-255的透明度，低于30基本上就看不见了，如需要可自行修改）
;~LShift & WheelUp::
CapsLock & WheelUp::
	;透明度调整，增加。
	WinGet, Transparent, Transparent,A
	if (Transparent="")
		Transparent=255
		Transparent_New:=Transparent+20
	if (Transparent_New > 254)
		Transparent_New =255
		WinSet,Transparent,%Transparent_New%,A

		ToolTip 原透明度: %Transparent_New% `n新透明度: %Transparent%
		SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

CapsLock & WheelDown::
	;透明度调整，减少。
	WinGet, Transparent, Transparent,A
	if (Transparent="")
	Transparent=255
	Transparent_New:=Transparent-20
	if (Transparent_New < 30)
	Transparent_New = 30
	WinSet,Transparent,%Transparent_New%,A
	ToolTip 原透明度: %Transparent_New% `n新透明度: %Transparent%
	SetTimer, RemoveToolTip_transparent_Lwin, 1500
return

;设置CapsLock 加侧边键 直接恢复透明度到255。没有侧边键的就算了，毕竟滚轮滚一下也快得很
;CapsLock & XButton1::
	;WinGet, Transparent, Transparent,A
	;WinSet,Transparent,255,A
	;ToolTip 恢复透明度
	;SetTimer, RemoveToolTip_transparent_Lwin, 1500
;return

RemoveToolTip_transparent_Lwin:
	ToolTip
	SetTimer, RemoveToolTip_transparent_Lwin, Off
return

;************caps+鼠标滚轮调整窗口透明度$***********


;************ 按住Caps拖动鼠标^    ************* {{{1
;按住caps加左键拖动窗口
;Escape & LButton::
CapsLock & LButton::
	CoordMode, Mouse ; switch to Screen/absolute coordinates.
	MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
	WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
	WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
	if EWD_WinState = 0 ; Only if the window isn't maximized
		SetTimer, EWD_WatchMouse, 10 ; Track the Mouse as the user drags it.
return

EWD_WatchMouse:
	GetKeyState, EWD_LButtonState, LButton, P
	if EWD_LButtonState = U ; Button has been released, so drag is complete.
	{
		SetTimer, EWD_WatchMouse, off
		return
	}

	;GetKeyState, EWD_EscapeState, Escape, P
	;if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
	;{
	;	SetTimer, EWD_WatchMouse, off
	;	WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
	;	return
	;}

	;Otherwise, reposition the window to match the change in mouse coordinates
	;caused by the user having dragged the mouse:
	CoordMode, Mouse
	MouseGetPos, EWD_MouseX, EWD_MouseY
	WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
	SetWinDelay, -1 ; Makes the below move faster/smoother.
	WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
	EWD_MouseStartX := EWD_MouseX ; Update for the next timer-call to this subroutine.
	EWD_MouseStartY := EWD_MouseY
return

;按住caps加右键放大和缩小窗口
;Escape & RButton::
CapsLock & RButton::
	CoordMode, Mouse, Screen ; switch to Screen/absolute coordinates.
	MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
	WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY, EWD_WinWidth, EWD_WinHeight, ahk_id %EWD_MouseWin%
	EWD_StartPosX := EWD_WinWidth - EWD_MouseStartX
	EWD_StartPosY := EWD_WinHeight - EWD_MouseStartY

	if ((EWD_MouseStartX - EWD_OriginalPosX)/EWD_WinWidth)<0.5 && ((EWD_MouseStartY - EWD_OriginalPosY)/EWD_WinHeight)<0.5
		LeftUpCorner = 1
	else
		LeftUpCorner = 0
		WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
	if EWD_WinState = 0 ; Only if the window isn't maximized
		SetTimer, EWD_ResizeWindow, 10 ; Track the Mouse as the user drags it.
return

EWD_ResizeWindow:
	if not GetKeyState("RButton", "P"){
		SetTimer, EWD_ResizeWindow, off
		return
	}
		CoordMode, Mouse, Screen ; switch to Screen/absolute coordinates.
		MouseGetPos, EWD_MouseX, EWD_MouseY
		SetWinDelay, -1 ; Makes the below move faster/smoother.
	if LeftUpCorner
		WinMove, ahk_id %EWD_MouseWin%,, EWD_OriginalPosX-(EWD_MouseStartX-EWD_MouseX), EWD_OriginalPosY-(EWD_MouseStartY-EWD_MouseY), EWD_WinWidth+(EWD_MouseStartX-EWD_MouseX),EWD_WinHeight+(EWD_MouseStartY-EWD_MouseY)
	else
		WinMove, ahk_id %EWD_MouseWin%,, EWD_OriginalPosX, EWD_OriginalPosY, EWD_StartPosX + EWD_MouseX, EWD_StartPosY + EWD_MouseY
return
;************** 按住Caps拖动窗口$    **************

;按住caps加中键窗口最大化|常规大小循环切换
CapsLock & MButton::gosub,Sub_MaxRestore

;LWin & LButton::gosub,Sub_MaxRestore
;Win加右键给了popsel作为启动器，关键是滥用置顶并不好，所以给难受的中键

;对于置顶最好用快捷键来的更准确一点,加入提示,方便置顶查看状态
LWin & MButton::
#F1::
	WinSet, Alwaysontop, Toggle, A
	GV_ToggleAlwaysontopKeys := !GV_ToggleAlwaysontopKeys
	if(GV_ToggleAlwaysontopKeys == 1)
	ToolTip 置顶启用
	else
	ToolTip 置顶关闭
	Sleep 1000
	ToolTip
return

;从默认Ctrl＋W是关闭标签上修改一点成关闭程序。
;Escape & LButton::WinClose A
#w::WinClose A

;按住Win加滚轮来调整音量大小
LWin & WheelUp::gosub,Sub_volUp
LWin & WheelDown::gosub,Sub_volDown
;************** 按住Caps拖动窗口$ ********************


;************** 自定义方法^ ************** {{{1
;自定义方法/函数
MouseIsOver(WinTitle){
	MouseGetPos,,, Win
return WinExist(WinTitle . " ahk_id " . Win)
}

;fp,全路径文件名 1路径,2全文件名,3仅文件名,4扩展名,5添加64字样
GetFileInfo(fp,act){
	;D:\Tools\Office\EverEdit\eeie.exe
	;InStr(Haystack, Needle [, CaseSensitive = false, StartingPos = 1, Occurrence = 1]):
	;SubStr(String, StartingPos [, Length])

	dot := InStr(fp,".",false,0,1)	;返回指定字符在字符串中位置编号
	slash := InStr(fp,"\",false,0,1)

	if(act==1)
		return % SubStr(fp,1,slash)	;截取字符串中一个或多个字符
	else if(act==2)
		return % SubStr(fp,slash+1)
	else {
		;当文件名没有后缀名
		if(dot==0){
			if(act==3)
				return % SubStr(fp,slash+1)
			else if(act==4)
				return ""
			else if(act==5){
				if(A_Is64bitOS)
					return % fp . "64"
				else
					return % fp
				}
		}
		else {
			if(act==3)
				return % SubStr(fp,slash+1,dot-slash-1)
			else if(act==4)
				return % SubStr(fp,dot+1)
			else if(act==5){
				if(A_Is64bitOS)
					return % SubStr(fp,1,dot-1) . "64" . SubStr(fp,dot)
				else
					return % fp
				}
		}
	}
}

AscSend(str){
	SetFormat, Integer, H
	for k,v in StrSplit(str)
	out.="{U+ " Ord(v) "}"
	SendInput % out
}

EzTip(tip,s){
	s:=(s>0) ? s*1000 : 2000
	ToolTip % tip
	Sleep % s
	ToolTip
}

;适合单击直接调用
CoordWinClick(x,y){
	CoordMode, Mouse, Window
	Click %x%, %y%
}

CoordWinMove(x,y){
	CoordMode, Mouse, Window
	Click %x%, %y%, 0
}

;适合双击直接调用
CoordWinDbClick(x,y){
	CoordMode, Mouse, Window
	Click %x%, %y%, 2
}

;在调用的过程前面统一加上一句 , CoordMode, Mouse, Window 较好，下同
ClickSleep(x,y,s){
	CoordMode, Mouse, Window
	Click %x%, %y%
	Sleep, % 100*s
}

ControlClickSleep(ctl,s){
	CoordMode, Mouse, Window
	ControlClick, %ctl%
	Sleep, % 100*s
}

MyWinWaitActive(title){
	CoordMode, Mouse, Window
	WinWait, %title%,
	IfWinNotActive, %title%, , WinActivate, %title%,
	WinWaitActive, %title%,
	WinMove, %title%, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	Sleep,500
	ControlSend,,{Click},%title% ;选中,即光标在文件上,20240114
}

MyWinWaitActive1(title){
	CoordMode, Mouse, Window
	WinWait, %title%,
	IfWinNotActive, %title%, , WinActivate, %title%,
	WinWaitActive, %title%,
	WinShow, %title%,
	; WinMove, %title%, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	; Sleep,500
	; ControlSend,,{Click},%title% ;选中,即光标在文件上,20240114
}

GetCursorShape(){ ;获取光标特征码 by nnrxin
	VarSetCapacity( PCURSORINFO, 20, 0) ;为鼠标信息 结构 设置出20字节空间
	NumPut(20, PCURSORINFO, 0, "UInt") ;*声明出 结构 的大小cbSize = 20字节
	DllCall("GetCursorInfo", "Ptr", &PCURSORINFO) ;获取 结构-光标信息
	if ( NumGet( PCURSORINFO, 4, "UInt")="0" ) ;当光标隐藏时，直接输出特征码为0
		return, 0
		VarSetCapacity( ICONINFO, 20, 0) ;创建 结构-图标信息
		DllCall("GetIconInfo", "Ptr", NumGet(PCURSORINFO, 8), "Ptr", &ICONINFO) ;获取 结构-图标信息
		VarSetCapacity( lpvMaskBits, 128, 0) ;创造 数组-掩图信息（128字节）
		DllCall("GetBitmapBits", "Ptr", NumGet( ICONINFO, 12), "UInt", 128, "UInt", &lpvMaskBits) ;读取 数组-掩图信息
		loop, 128{ ;掩图码
		MaskCode += NumGet( lpvMaskBits, A_Index, "UChar") ;累加拼合
	}
	if (NumGet( ICONINFO, 16, "UInt")<>"0"){ ;颜色图不为空时（彩色图标时）
		VarSetCapacity( lpvColorBits, 4096, 0) ;创造 数组-色图信息（4096字节）
		DllCall("GetBitmapBits", "Ptr", NumGet( ICONINFO, 16), "UInt", 4096, "UInt", &lpvColorBits) ;读取 数组-色图信息
		loop, 256{ ;色图码
		ColorCode += NumGet( lpvColorBits, A_Index*16-3, "UChar") ;累加拼合
		}
	} else
		ColorCode := "0"
		DllCall("DeleteObject", "Ptr", NumGet( ICONINFO, 12)) ; *清理掩图
		DllCall("DeleteObject", "Ptr", NumGet( ICONINFO, 16)) ; *清理色图
		VarSetCapacity( PCURSORINFO, 0) ;清空 结构-光标信息
		VarSetCapacity( ICONINFO, 0) ;清空 结构-图标信息
		VarSetCapacity( lpvMaskBits, 0) ;清空 数组-掩图
		VarSetCapacity( lpvColorBits, 0) ;清空 数组-色图
return, % MaskCode//2 . ColorCode ;输出特征码
}

; /*
fun_KeyClickAction123(act){
	if RegExMatch(act,"i)^(Run,)",m){
		Run,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(Send,)",m){
		Send,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(SendInput,)",m){
		SendInput,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(gosub,)",m){
		gosub,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(GoFun,)",m){
		funString := % SubStr(act,StrLen(m1)+1)
		funName := SubStr(funString,1,InStr(funString,"(")-1)
		funPara := SubStr(funString,InStr(funString,"(")+1,InStr(funString,")")-InStr(funString,"(")-1)
		RetVal := funName.(funPara)
	}
}

;%A_YYYY%-%A_MM%-%A_DD%-%A_MSec%
;msgbox % fun_GetFormatTime("yyyy-MM-dd-HH-mm-ss")
fun_GetFormatTime(f,t=""){
	;FormatTime, TimeString, 200504, 'Month Name': MMMM`n'Day Name': dddd
	;FormatTime, TimeString, ,'Month Name': MMMM`n'Day Name': dddd
	FormatTime, TimeString, %t% ,%f%
	return %TimeString%
}

GF_GetSysVar(sys_var_name){
	EnvGet, sv,% sys_var_name
	return % sv
}

Decimal_to_Hex(var){
	SetFormat, integer, hex
	var += 0
	SetFormat, integer, d
	return var
}
*/

;使用剪貼簿插入文字
AutoInput(InputStr){
	clipboard_save = %ClipboardAll%
	Clipboard:=
	Clipboard = %InputStr%
	ClipWait
	Send ^v
	Sleep, 150
	Clipboard = %clipboard_save%
}

;判断连续双击按键
GV_KeyClick_Continuous(tout){ ;大于判定双击
	return (A_ThisHotkey = A_PriorHotkey) and (A_TimeSincePriorHotkey < tout)
}
;****************************************************
GV_KeyClick_single(ms){ ;大于判定单击
	return (A_ThisHotkey = A_PriorHotkey) and (A_TimeSincePriorHotkey > ms)
}
;****************************************************
;点击PixPin钉图工具坐标
PixPinToolsClick(i){
	WinGetPos,x,y,lengthA,hightA, A
	; MouseGetPos,x, y,VarWin,VarControl, 1
	; Xpos :=lengthA-41*13
	; Ypos :=hightA-18
	; ΔX :=(lengthA-x)/1
	; ΔY :=hightA-y
	; MsgBox, %x%`,%y%`,%ΔX%`,%ΔY%`,%lengthA%`,%hightA%
	; MsgBox, %VarWin%`,%VarControl%`,%lengthA%`,%hightA%
	if (i<=5){
		Xn :=lengthA-50-(i-1)*40
		Yn :=hightA-18
	}else if(6<=i){
		Xn :=lengthA-233-(i-6)*33
		Yn :=hightA-18
	}
	CoordMode, Mouse, Window
	Click %Xn%, %Yn%
}
;****************************************************
;****************************************************
;自定义标签
; /*
Sub_ButtonLongPress:
	if ButtonLongPress{
		ButtonLongPress += 1
		return
	}
	ButtonLongPress = 1
	;SetTimer, ButtonLongPress, -250
	SetTimer, ButtonLongPress, % GV_MouseTimer
return

ButtonLongPress:
	IfEqual, ButtonLongPress, 1
	{
		MouseGetPos, x0, y0
	if GV_MouseButton = 1
		KeyWait, LButton, T0.4
	else if GV_MouseButton = 2
		KeyWait, RButton, T0.4
	else if GV_MouseButton = 3
		KeyWait, MButton, T0.4
		MouseGetPos, x1, y1
	if (ErrorLevel && (x0 = x1 && y0 = y1))
		fun_KeyClickAction123(GV_LongClickAction)
	}
	ButtonLongPress = 0
return
*/

Sub_MouseClick123:
	if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.
	{
		winc_presses += 1
		return
	}
	; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
	; 计时器：
	winc_presses = 1
	SetTimer, KeyWinC, % GV_MouseTimer ; 在 400 毫秒内等待更多的键击.
return

Sub_KeyClick123:
	if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.
	{
		winc_presses += 1
		return
	}
	; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
	; 计时器：
	winc_presses = 1
	SetTimer, KeyWinC, % GV_KeyTimer ; 在 400 毫秒内等待更多的键击.
return

KeyWinC:
	SetTimer, KeyWinC, off
	if winc_presses = 1 ; 此键按下了一次.
	{
	if GV_MouseButton = 0
	{
		fun_KeyClickAction123(GV_KeyClickAction1)
	}
	else {
		MouseGetPos, x0, y0
		if GV_MouseButton = 1
			KeyWait, LButton, T0.4
			else if GV_MouseButton = 2
			KeyWait, RButton, T0.4
			else if GV_MouseButton = 3
			KeyWait, MButton, T0.4
			MouseGetPos, x1, y1
		if (ErrorLevel && (x0 = x1 && y0 = y1))
		{
			fun_KeyClickAction123(GV_LongClickAction)
			;重置为0
			GV_MouseButton = 0
		}
		else {
			fun_KeyClickAction123(GV_KeyClickAction1)
		}
	}
	}
	else if winc_presses = 2 ; 此键按下了两次.
	{
		fun_KeyClickAction123(GV_KeyClickAction2)
	}
	else if winc_presses > 2
	{
		fun_KeyClickAction123(GV_KeyClickAction3)
		;MsgBox, Three or more clicks detected.
	}
	; 不论触发了上面的哪个动作, 都对 count 进行重置
	; 为下一个系列的按下做准备:
	winc_presses = 0
return

/*
fun_KeyClickAction123(act){
	if RegExMatch(act,"i)^(Run,)",m) {
		Run,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(Send,)",m) {
		Send,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(SendInput,)",m) {
		SendInput,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(gosub,)",m) {
		gosub,% SubStr(act,StrLen(m1)+1)
	}
	else if RegExMatch(act,"i)^(GoFun,)",m) {
		funString := % SubStr(act,StrLen(m1)+1)
		funName := SubStr(funString,1,InStr(funString,"(")-1)
		funPara := SubStr(funString,InStr(funString,"(")+1,InStr(funString,")")-InStr(funString,"(")-1)
		RetVal := funName.(funPara)
	}
}

Sub_ButtonLongPress:
	if ButtonLongPress {
		ButtonLongPress += 1
		return
	}
	ButtonLongPress = 1
	;SetTimer, ButtonLongPress, -250
	SetTimer, ButtonLongPress, % GV_MouseTimer
return

ButtonLongPress:
	IfEqual, ButtonLongPress, 1
	{
		MouseGetPos, x0, y0
		if GV_MouseButton = 1
			KeyWait, LButton, T0.4
		else if GV_MouseButton = 2
			KeyWait, RButton, T0.4
		else if GV_MouseButton = 3
			KeyWait, MButton, T0.4
		MouseGetPos, x1, y1
		if (ErrorLevel && (x0 = x1 && y0 = y1))
			fun_KeyClickAction123(GV_LongClickAction)
	}
	ButtonLongPress = 0
return

;%A_YYYY%-%A_MM%-%A_DD%-%A_MSec%
;msgbox % fun_GetFormatTime("yyyy-MM-dd-HH-mm-ss")
fun_GetFormatTime(f,t="")
{
	;FormatTime, TimeString, 200504, 'Month Name': MMMM`n'Day Name': dddd
	;FormatTime, TimeString, ,'Month Name': MMMM`n'Day Name': dddd
	FormatTime, TimeString, %t% ,%f%
	return %TimeString%
}

GF_GetSysVar(sys_var_name)
{
	EnvGet, sv,% sys_var_name
	return % sv
}
*/

Sub_ClipAppend:
	;SendInput,^{Home}^+{End}^c
	SendInput,^c
	Sleep ,300
	StringLeft,clipboard_left,Clipboard,500
	ToolTip,%clipboard_left% ;在鼠标右侧显示clip(Clipboard内容)
	Sleep ,1000
	ToolTip
	FileRead, ClipboardContent,%COMMANDER_PATH%\剪切板\ClipAppend.txt
	ClipboardContent = %Clipboard%`r`n`r`n%ClipboardContent%
	FileDelete, %COMMANDER_PATH%\剪切板\ClipAppend.txt
	FileAppend, %ClipboardContent%, %COMMANDER_PATH%\剪切板\ClipAppend.txt
return


Sub_MaxRestore:
	WinGet, Status_minmax,MinMax,A
	if (Status_minmax=1){
		WinRestore A
	}
	else {
		WinMaximize A
	}
return

Sub_MaxAllWindows:
	WinGet, Window_List, List ; Gather a list of running programs
	loop, %Window_List%
	{
		wid := Window_List%A_Index%
		WinGetTitle, wid_Title, ahk_id %wid%
		WinGet, Style, Style, ahk_id %wid%
		;(WS_CAPTION 0xC00000| WS_SYSMENU 0x80000| WS_MAXIMIZEBOX 0x10000) | WS_SIZEBOX 0x40000
		if (!(Style & 0xC90000) or !(Style & 0x40000) or (Style & WS_DISABLED) or !(wid_Title)) ;skip unimportant windows ;! wid_Title or
			continue
			;MsgBox, % (Style & 0x40000)
			WinGet, es, ExStyle, ahk_id %wid%
			Parent := Decimal_to_Hex( DllCall( "GetParent", "uint", wid ) )
			WinGet, Style_parent, Style, ahk_id %Parent%
			Owner := Decimal_to_Hex( DllCall( "GetWindow", "uint", wid , "uint", "4" ) ) ; GW_OWNER = 4
			WinGet, Style_Owner, Style, ahk_id %Owner%

		if (((es & WS_EX_TOOLWINDOW) and !(Parent)) ; filters out program manager, etc
			or ( !(es & WS_EX_APPWINDOW)
			and (((Parent) and ((Style_parent & WS_DISABLED) =0)) ; These 2 lines filter out windows that have a parent or owner window that is NOT disabled -
			or ((Owner) and ((Style_Owner & WS_DISABLED) =0))))) ; NOTE - some windows result in blank value so must test for zero instead of using NOT operator!
			continue
			WinGet, Status_minmax ,MinMax,ahk_id %wid%
		if (Status_minmax!=1){
			WinMaximize,ahk_id %wid%
		}
		;MsgBox, 4, , Visiting All Windows`n%A_Index% of %Window_List%`n`n%wid_Title%`nContinue?
		;IfMsgBox, NO, break
	}
return


Sub_WindowNoCaption:
	WinGetPos, xTB, yTB,lengthTB,hightTB, ahk_class Shell_TrayWnd
	;msgbox %xTB%
	;msgbox %yTB%
	;msgbox %lengthTB%
	;msgbox %hightTB%
	bd := 8 ;win8Border = 4
	lW := A_ScreenWidth
	hW := A_ScreenHeight
	if(xTB == 0){ ;左边和上、下面的情况
		if(yTB == 0){ ;任务栏在上和左
			if(lengthTB == A_ScreenWidth){ ;在上
			xW := 0
			yW := hightTB
			lW := A_ScreenWidth
			hW := A_ScreenHeight - hightTB
			}
			else { ;在左
			xW := lengthTB
			yW := 0
			lW := A_ScreenWidth - lengthTB
			hW := A_ScreenHeight
			}
		}
		else { ;在下
			xW := 0
			yW := 0
			lW := A_ScreenWidth
			hW := A_ScreenHeight - hightTB
		}
	}
	else { ;在右
		xW := 0
		yW := 0
		lW := A_ScreenWidth - lengthTB
		hW := A_ScreenHeight
	}
	WinSet, Style, ^0xC00000, A
return

/*
Decimal_to_Hex(var)
{
	SetFormat, integer, hex
	var += 0
	SetFormat, integer, d
	return var
}
*/

;打开剪贴板中多个链接
OpenClipURLS:
	loop, Parse, Clipboard, `n, `r ;在 `r 之前指定 `n, 这样可以同时支持对 Windows 和 Unix 文件的解析.
	{
		cu := A_loopField
		if(RegExMatch(A_LoopField,"^http")){
			Sleep 200
			Run, "%A_LoopField%"
		}
		else if(RegExMatch(A_LoopField,"(^[a-zA-Z]:\\)|(^file:\/\/\/[a-zA-Z]:\/)")){
			Sleep 200
			Run,"%COMMANDER_EXE%" /A /T /O /S /R="%A_LoopField%"
		}
	}
return


;map tc :tabnew<cr>"+P
;map <F1> :tabnew<CR>

Sub_CopyAllVim:
	SendInput,^{Home}^+{End}^c
	Sleep 500
	if not WinExist("ahk_class Vim")
		Run %COMMANDER_PATH%\TOOLS\vim\gvim.exe, %COMMANDER_PATH%\TOOLS\vim
		WinActivate
		Sleep 500
		SendInput,{F1}^v
	return

Sub_CopyVim:
	SendInput,^c
	Sleep 500
	if not WinExist("ahk_class Vim")
		Run %COMMANDER_PATH%\TOOLS\vim\gvim.exe, %COMMANDER_PATH%\TOOLS\vim
		WinActivate
		Sleep 500
		SendInput,{Esc}
		Sleep 200
		AscSend("tc")
return
;****************************************************
uTools: ;按2次Alt激活uTools
{
	SendInput,{RAlt Down}
	Sleep,50
	SendInput,{RAlt Up}
	Sleep,50
	SendInput,{RAlt Down}
	Sleep,50
	SendInput,{RAlt Up}
}
return
;****************************************************
Listary: ;按2次Ctrl激活Listary
{
	SendInput,{Ctrl Down}
	Sleep,50
	SendInput,{Ctrl Up}
	Sleep,50
	SendInput,{Ctrl Down}
	Sleep,50
	SendInput,{Ctrl Up}
}
return
;****************************************************
TextToEverything:	;以复制+后处理方式获取文件(夹)名
	; SendInput,{F2}
	; Sleep,50
	SendInput,^c
	Sleep,100
	clip:=
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		clip:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		clip:=Clipboard
	}
	Sleep,100

	;直接搜索|Alt+space激活Everything,20240130
	; Run,%COMMANDER_PATH%\Everything.exe -s %clip%
	IfExist,C:\Windows\SysWOW64\
		Run,"%RunCaptX%\Everything\Everything.exe" -s %clip%
	else
		Run,"%RunCaptX%\Everything\Everything-x86\Everything.exe" -s %clip%
return
;****************************************************
中键设定_Office:	;单击中键缩放100%/双击中键关闭
	if (GV_KeyClick_Continuous(300)){
		;office双击中键关闭
		SendInput,^s
		Sleep ,100
		SendInput,^w
		Sleep ,100
		EzTip("文件保存并关闭成功!",1)
		;return
	}
	else {
		;office单击中键缩放100%
		SendInput,!w	;视图
		Sleep ,200		;WPS延时
		SendInput,j	;缩放100%,wps_excel不适用
		Sleep ,100
		SendInput,^s
		Sleep ,100
		;SendInput,^{Home}
		;EzTip("文件保存成功!",1)
	}
return
;************************** 自定义方法结束$ ****************************


;************** Youdao_网络翻译^ ********* {{{1
;语音+弹窗  翻译-中英互译	by天甜	From:Cando_有道翻译+剪贴板函数+Splash函数+判断调试

<#y::
	原值:=Clipboard
	Clipboard =
	Send ^c
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		Clipboard:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		Clipboard:=Clipboard
	}
	gosub sound
return

sound:
	ClipWait,0.5
	if(ErrorLevel)
	{
		InputBox,varTranslation,请输入,你想翻译啥，我来说
		if !ErrorLevel
		{
			Youdao译文:=YouDaoApi(varTranslation)
			Youdao_网络释义:= json(Youdao译文, "web.value")
			SplashYoudaoMsg("Youdao_网络翻译", Youdao_网络释义)
			spovice:=ComObjCreate("sapi.spvoice")
			spovice.Speak(Youdao_网络释义)
			Sleep, 3000
			SplashTextOff
		}
	}
	else
	{
		varTranslation:=Clipboard
		Youdao译文:=YouDaoApi(varTranslation)
		Youdao_网络释义:= json(Youdao译文, "web.value")
		SplashYoudaoMsg("Youdao_网络翻译", Youdao_网络释义)
		spovice:=ComObjCreate("sapi.spvoice")
		spovice.Speak(Youdao_网络释义)
		Sleep, 3000
		SplashTextOff
	}
	;Clipboard:=原值
	Clipboard:=Youdao_网络释义
return

SplashYoudaoMsg(title, content){
	;SoundBeep 750, 500
	MouseGetPos, MouseX, MouseY ;获得鼠标位置x,y
	MouseZ := MouseX + 100
	SplashTextOn , 400, 60, %title%, %content%
	WinMove, %title%, , %MouseZ%, %MouseY%
	WinSet, Transparent, 200, %title%
}

YouDaoApi(KeyWord)
{
	;KeyWord:=SkSub_UrlEncode(KeyWord,"utf-8")
	url:="http://fanyi.youdao.com/fanyiapi.do?keyfrom=qqqqqqqq123&key=86514254&type=data&doctype=json&version=1.1&q=" . KeyWord
	WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WebRequest.Open("GET", url)
	WebRequest.Send()
	result := WebRequest.ResponseText
	return result
}

json(ByRef js, s, v = "")
{
	j = %js%
	loop, Parse, s, .
	{
		p = 2
		RegExMatch(A_LoopField, "([+\-]?)([^[]+)((?:\[\d+\])*)", q)
		loop{
			if (!p := RegExMatch(j, "(?<!\\)(""|')([^\1]+?)(?<!\\)(?-1)\s*:\s*((\{(?:[^{}]++|(?-1))*\})|(\[(?:[^[\]]++|(?-1))*\])|"
			. "(?<!\\)(""|')[^\7]*?(?<!\\)(?-1)|[+\-]?\d+(?:\.\d*)?|true|false|null?)\s*(?:,|$|\})", x, p))
			return
			else if (x2 == q2 or q2 == "*"){
			j = %x3%
			z += p + StrLen(x2) - 2
			if (q3 != "" and InStr(j, "[") == 1){
				StringTrimRight, q3, q3, 1
				loop, Parse, q3, ], [
				{
				z += 1 + RegExMatch(SubStr(j, 2, -1), "^(?:\s*((\[(?:[^[\]]++|(?-1))*\])|(\{(?:[^{\}]++|(?-1))*\})|[^,]*?)\s*(?:,|$)){" . SubStr(A_LoopField, 1) + 1 . "}", x)
				j = %x1%
				}
			}
			break
			}
			else p += StrLen(x)
			}
	}
	if v !=
	{
		vs = "
		if (RegExMatch(v, "^\s*(?:""|')*\s*([+\-]?\d+(?:\.\d*)?|true|false|null?)\s*(?:""|')*\s*$", vx)
			and (vx1 + 0 or vx1 == 0 or vx1 == "true" or vx1 == "false" or vx1 == "null" or vx1 == "nul"))
		vs := "", v := vx1
		StringReplace, v, v, ", \", All
		js := SubStr(js, 1, z := RegExMatch(js, ":\s*", zx, z) + StrLen(zx) - 1) . vs . v . vs . SubStr(js, z + StrLen(x3) + 1)
	}
return, j == "false" ? 0 : j == "true" ? 1 : j == "null" or j == "nul"
? "" : SubStr(j, 1, 1) == """" ? SubStr(j, 2, -1) : j
}
;************** Youdao_网络翻译$ *********


;************** 组合快捷键部分^ ************** {{{1
;************** Escape相关^ ************** {{{2
; +HJKL 表示左下右上方向
Escape & j:: SendInput,{Down}
Escape & k:: SendInput,{Up}
Escape & h:: SendInput,{Left}
Escape & l:: SendInput,{Right}

Escape & f:: SendInput,^{Right}
Escape & s:: SendInput,^{Left}

Escape & a::SendInput,{PgDn} ;by tuutg 2022/11/13
Escape & q::SendInput,{PgUp}

;************** u,i单击双击^ **************
;Escape & u:: SendInput,^{End}
;Escape & i:: SendInput,^{Home}
;Escape & n:: SendInput,{PgDn}
;Escape & m:: SendInput,{PgUp}

Escape & u::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	gosub,Sub_KeyClick123
return

Escape & i::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	gosub,Sub_KeyClick123
return

Escape & n::
	GV_KeyClickAction1 := "SendInput,{PgDn}"
	GV_KeyClickAction2 := "SendInput,^{PgDn}"
	gosub,Sub_KeyClick123
return

Escape & m::
	GV_KeyClickAction1 := "SendInput,{PgUp}"
	GV_KeyClickAction2 := "SendInput,^{PgUp}"
	gosub,Sub_KeyClick123
return
;************** u,i单击双击$ **************

;***************** 剪贴板相关^ ************** {{{2
Escape & v::
	if EscapeV_presses > 0
	{
	EscapeV_presses += 1
	return
	}
	EscapeV_presses = 1
	SetTimer, KeyEscapeV, 175
return

KeyEscapeV:
	SetTimer, KeyEscapeV, off
	if EscapeV_presses = 1
	{
	gosub,PastePureText
	}
	else if EscapeV_presses = 2
	{
	gosub,EzOtherMenuShow
	}
	EscapeV_presses = 0
return


Escape & c::
	gosub,Sub_ClipAppend
return


;#z::Menu, MyMenu, Show  ; i.e. press the Win-Z hotkey to show the menu.


;***************** 剪贴板相关$ **************
;关闭和刷新
Escape & w::SendInput,^w ;by tuutg 2022/11/13
Escape & r::SendInput,^r
;切换tab
Escape & o::SendInput,^+{Tab}
Escape & p::SendInput,^{Tab}
;右键和DEL
;Escape & y::SendInput,{AppsKey}
Escape & y::SendInput,{Click,Right}
Escape & d::SendInput,{Delete}
;Alttab，Win8下暂时不能用
Escape & .::AltTab
Escape & ,::ShiftAltTab

Escape & `;::WinClose A

;Enter 回车窗口最大化
;Escape & Enter::WinMaximize A
Escape & Enter::gosub,Sub_MaxRestore
Escape & Space::WinMinimize A
^!#Up::gosub,Sub_MaxAllWindows
^#u::gosub,OpenClipURLS

^Escape::SendInput,^{Escape}
+Escape::SendInput,+{Escape}
$!Escape::SendInput,!{Escape}
^+Escape::SendInput,^+{Escape}
^!Escape::SendInput,^!{Escape}
$!+Escape::SendInput,!+{Escape}
^!+Escape::SendInput,^!+{Escape}

;最后一行恢复自身功能，重要

Escape::
	if (GV_EscKeyAs = "WinClose") {
		WinClose A
	}
	if (GV_EscKeyAs = "BackSpace") {
		SendInput,{BackSpace}
	}
	if (GV_EscKeyAs = "Escape") {
		SendInput,{Escape}
	}
	else if (GV_EscKeyAs = "CapsLock") {
		GetKeyState t, CapsLock, T
		IfEqual t,D, SetCapsLockState AlwaysOff
	else SetCapsLockState AlwaysOn
	}
return

/*
~Escape::
	if (A_PriorHotkey=A_ThisHotkey && A_TimeSincePriorHotkey<200){
		;MsgBox You double taped %A_ThisHotkey%
		WinClose A
	}
	else {
		; Sleep 200
		;msgbox press %A_ThisHotkey% for %A_TimeSinceThisHotkey%
		;if (A_TimeSinceThisHotkey > 200 && A_TimeSinceThisHotkey < 1000){
		SendInput {Escape}
		;}
	}
return
*/
;************** Escape相关$     **************


;************** CapsLock相关^ ************** {{{2
;win+caps+按键
;Capslock & e::
	;state := GetKeyState("LWin", "T")  ; 当 CapsLock 打开时为真, 否则为假.
	;if state
		;msgbox handle！
	;else
		;send #e
;return
;左右手结合上下左右, 切换开关, 右手^ & CapsLocK
CapsLock & k::SendInput,{Up}
CapsLock & j::SendInput,{Down}
CapsLock & h::SendInput,{Left}
CapsLock & l::SendInput,{Right}

CapsLock & e::SendInput,{Up} ;by tuutg 2022/11/13
CapsLock & d::SendInput,{Down} ;by tuutg 2022/11/13
CapsLock & s::SendInput,{Left} ;by tuutg 2022/11/13
CapsLock & f::SendInput,{Right} ;by tuutg 2022/11/13

CapsLock & q::
	GV_KeyClickAction1 := "SendInput,^+{tab}"	;标签向左<-
	GV_KeyClickAction2 := "SendInput,{PgUp}"	;20231223
	gosub,Sub_KeyClick123
return

CapsLock & a::		;by tuutg 2023/08/02 22:46
	GV_KeyClickAction1 := "SendInput,^{tab}"	;标签向右->
	GV_KeyClickAction2 := "SendInput,{PgDn}"	;20231223
	gosub,Sub_KeyClick123
return

CapsLock & w:: ;双击关闭/单击保存
	if (GV_KeyClick_Continuous(300)){
		SendInput,^s		;先保存
		Sleep,100
		SendInput,^w		;关闭窗口 by Tuutg 2022/11/13
		EzTip("文件保存并关闭成功!",1)
	}
	else {
		SendInput,^s ;单击保存
		;SendInput,{Enter}
	}
return

CapsLock & r::SendInput,{Delete}	;记忆remove
CapsLock & t::SendInput,{BackSpace} ;by Tuutg 2022/10/17

; CapsLock & a::
CapsLock & g::SendInput,{Enter} ;by tuutg 2024/03/11
	; GV_KeyClickAction1 := "SendInput,{Enter}"
	; GV_KeyClickAction2 := "SendInput,`."
	; gosub,Sub_KeyClick123
; return

CapsLock & z::SendInput,^z	;撤销
$^+z::SendInput,^y	;重做
; $!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
CapsLock & x::SendInput,^x ;by Tuutg 2022/10/17,剪切
;CapsLock & x::SendInput,{Del}
; CapsLock & c::SendInput,^c	;复制
; CapsLock & v::SendInput,^v	;粘贴
; CapsLock & b::gosub,Sub_uToolsSelectTxt	;一键uTools搜索

;右键菜单
;CapsLock & y::SendInput,{AppsKey}
;CapsLock & y::SendInput,{RButton}
;CapsLock & y::Click , , Right , 1
CapsLock & y::SendInput,{Click,Right}

;媒体相关
CapsLock & 9::SendInput,{Media_Prev}
CapsLock & 0::SendInput,{Media_Next}

CapsLock & -::gosub,Sub_volDown
CapsLock & =::gosub,Sub_volUp
CapsLock & Del::gosub,Sub_volMute

CapsLock & BackSpace::SendInput,{Media_Play_Pause}

CapsLock & PgUp::SendInput,{Media_Prev}
CapsLock & PgDn::SendInput,{Media_Next}

;移动鼠标光标，例如用在屏幕取色
CapsLock & Up::MouseMove, 0, -1, 0, R
CapsLock & Down::MouseMove, 0, 1, 0, R
CapsLock & Left::MouseMove, -1, 0, 0, R
CapsLock & Right::MouseMove, 1, 0, 0, R
CapsLock & '::SendInput,{Click} ;鼠标左键单击

;************** u,i单击双击^ **************
;CapsLock & i::SendInput,^{Home}
;CapsLock & u::SendInput,^{End}
;CapsLock & n::SendInput,{PgDn}
;CapsLock & m::SendInput,{PgUp}

CapsLock & u::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	gosub,Sub_KeyClick123
return

CapsLock & i::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	gosub,Sub_KeyClick123
return

CapsLock & n::
	GV_KeyClickAction1 := "SendInput,{PgDn}"
	GV_KeyClickAction2 := "SendInput,^{PgDn}"
	gosub,Sub_KeyClick123
return

CapsLock & m::
	GV_KeyClickAction1 := "SendInput,{PgUp}"
	GV_KeyClickAction2 := "SendInput,^{PgUp}"
	gosub,Sub_KeyClick123
return

;************** u,i单击双击$ ******************

;***************** 剪贴板相关^ ****************
CapsLock & v::
	if (CapsLockV_presses > 0)
	{
		CapsLockV_presses += 1
		return
	}
		CapsLockV_presses = 1
		SetTimer, KeyCapsLockV, 300
return

; CapsLock & v::
	; GV_KeyClickAction1 := "GoSub,PastePureText"
	; GV_KeyClickAction2 := "gosub,EzOtherMenuShow"
	; gosub,Sub_KeyClick123
; return

;调用的标签
KeyCapsLockV:
	SetTimer, KeyCapsLockV, off
	if CapsLockV_presses = 1
	{
		; GoSub,PastePureText	;纯文本粘贴
		SendInput,^{v}	;单击直接粘贴
	}
	else if CapsLockV_presses = 2
	{
		;Menu, MyMenu, Show
		;EzOtherMenuShow()
		gosub,EzOtherMenuShow	;弹出菜单
		;gosub,PastePureText	;纯文本粘贴
	}
	CapsLockV_presses = 0
return

EzOtherMenuShow:
	Menu, MyMenu, UseErrorLevel
	Menu, MyMenu, DeleteAll
	Menu, MyMenu, Add, &B一键百度搜索, Sub_SearchSelectTxt
	Menu, MyMenu, Add, &Everything搜索, Sub_EverythingSelectTxt
	Menu, MyMenu, Add, &Anytext搜索, Sub_AnytextSelectTxt
	Menu, MyMenu, Add, &G-Loom搜索, Sub_LoomSelectTxt
	Menu, MyMenu, Add, u&Tools搜索, Sub_uToolsSelectTxt
	Menu, MyMenu, Add ; 添加分隔线.
	Menu, MyMenu, Add, &B播放器打开, Sub_OpenUrlByPlayer
	Menu, MyMenu, Add ; 添加分隔线.
	Menu, MyMenu, Add, &S纯文本粘贴, PastePureText
	Menu, MyMenu, Add, &Z转换后粘贴, JoinAndPaste
	Menu, MyMenu, Add ; 添加分隔线.
	Menu, MyMenu, Add, 添加&Quote, PasteQuote
	Menu, MyMenu, Add, 添加&Code, PasteCode
	Menu, MyMenu, Add, 添加磁头&Magnet, PasteMagnet

	Menu, MyMenu, Add ; 添加分隔线.
	Menu, MyMenu, Add, &F-MyApps, EzOtherMenu_MyApps
	Menu, MyMenu, Add ; 添加分隔线.

	Menu, MyMenu, Add, 取消[&X],EzOtherMenu_DeleteAll
	Menu, MyMenu, Show
return

EzOtherMenu_DeleteAll:
	Menu, MyMenu, DeleteAll
return


EzOtherMenu_MyApps:
	try {
		MyAppsIni := % A_ScriptDir . "\capsez_mymenus.ini"

		cur_menus := ""
		current_app := ""
		IniRead, apps, %MyAppsIni%, MyMenus
		arr_app := StrSplit(apps, "`n", "`r")
		loop % arr_app.MaxIndex()
		{
			Notepad=ahk_class Notepad
			app := StrSplit(arr_app[A_Index],"=")
			if WinActive(app[2]){
				current_app := app[1]
				break
			}
			else {
				continue
			}
		}

		IniRead, cur_menus, %MyAppsIni%, %current_app%
		arr_cur_menus := StrSplit(cur_menus, "`n", "`r")
		loop % arr_cur_menus.MaxIndex()
		{
			;[Notepad]
			;去掉尾部文字=notepad_trim
			;将空格和tab删除=notepad_cleanWhitespace
			cm := StrSplit(arr_cur_menus[A_Index],"=")
			cm_name := cm[1]
			cm_cmd := cm[2]
			Menu, MyMenu, Add, %cm_name%, %cm_cmd%
		}
	} catch e {
	}
return

PastePureText:
	if WinActive("ahk_class ConsoleWindowClass")
	{
		;SendInput,!{Space}ep
		SendInput,{Click,Right}
	}
	else
	{
		Clipboard = %Clipboard% ;转成纯文本
		SendInput,^v
	}
return

JoinAndPaste:
	clip:=Clipboard
	;例子1
	;对tc中文件复制文件名之后处理，添加双引号并且把多行合并成一行并用竖杠连接
	;clip := RegExReplace(clip, "(.+)(`r`n)?", """$1""`|")
	;例子2
	;对everything的搜索结果进行处理，去掉双引号并且把多行合并成一行并用tab分隔
	clip := RegExReplace(clip, "("".+"")(`r`n)?", "$1`t")
	StringTrimRight, clip, clip, 1
	Clipboard = %clip%
	Send,^v
return


PasteQuote:
	SendInput,^c<quote>^v</quote>
return

PasteCode:
	SendInput,^c<code>^v</code>
return

PasteMagnet:
	SendInput,^cmagnet:?xt=urn:btih:^v
return

#include %A_ScriptDir%\capsez_myapps.ahk

;一键百度搜索
Sub_SearchSelectTxt:
	SendInput,^c
	Sleep,100
	clip:=
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		clip:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		clip:=Clipboard
	}
	if RegExMatch(clip, "^\d{6}$"){
		Out := gv_url_tdx_f10 . clip . gv_url_html
		Run,%Out%	;股票软件F10
	}
	else {
		Run,http://www.baidu.com/s?ie=utf-8&wd=%clip%
	}
return

;一键Ev搜索
Sub_EverythingSelectTxt:
	Send,^c
	Sleep,100
	clip:=
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		clip:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		clip:=Clipboard
	}
	; Run,%COMMANDER_PATH%\Everything.exe -s %clip%
	IfExist,C:\Windows\SysWOW64\
		Run,"%RunCaptX%\Everything\Everything.exe" -s %clip%
	else
		Run,"%RunCaptX%\Everything\Everything-x86\Everything.exe" -s %clip%
return

;一键mpv.exe播放
Sub_OpenUrlByPlayer:
	SendInput,^c
	Sleep,100
	clip:=
	clip:=Clipboard
	Run,%COMMANDER_PATH%\Plugins\WLX\vlister\mpv.exe "%clip%"
return

;一键Anytext搜索, atgui /s {query}
Sub_AnytextSelectTxt:
	Send,^c
	Sleep,100
	clip:=
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		clip:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		clip:=Clipboard
	}
	Run,"%RunCaptX%\GreenTools\AnyTXT Searcher\ATGUI.exe" atgui /s %clip%
return
;***********************************************
CapsLock & c::
	gosub,Sub_ClipAppend
return
;***********************************************
;CapsLock & g:: SendInput,^w	;Ez原版
;***************** 剪贴板相关$ ******************

;**************CapsLock窗口相关^ ****************
CapsLock & o::SendInput,^+{Tab} ;标签向左<-
CapsLock & p::SendInput,^{Tab} ;标签向右->
CapsLock & Alt::SendInput,^{Tab}	;按住Caps不放，再按Alt,标签向右->

;AltTabMenu 用处不大
CapsLock & .::AltTab
CapsLock & ,::ShiftAltTab

;分号最小化/关闭窗口
;CapsLock & `;::WinClose A
CapsLock & `;:: WinMinimize A

;Enter 回车窗口最大化
CapsLock & Enter::gosub,Sub_MaxRestore
;**************CapsLock窗口相关$ ****************

;自定义 , By Tuutg
;***************** CapsLock自定义^ **************
;将单击caps替换为esc,双击caps映射双击Ctrl激活Listary
CapsLock::
	Suspend Permit
	if (GV_KeyClick_Continuous(300)){
		gosub,Listary	;{Ctrl S50 2}
	}else if (WinActive("ahk_group Group_browser")){
		SendInput,{BackSpace}	;浏览器退回
	}else if (WinActive("ahk_exe mspaint.exe")){
		SendInput,{Escape}
		Sleep,50
		SendInput,!hser	;回到选择工具|同PS
	}else if (WinActive("ahk_class Photoshop")){
		SendInput,{Escape}
		Sleep,50
		SendInput,^d	;取消选区选择
		Sleep,50
		SendInput,{v}	;回到移动工具
	}else if (WinActive("ahk_class TTOTAL_CMD")){
		SendInput,{Escape}	;退出|关闭
		Sleep,50
		TcSendUserCommand("cm_ClearAll")  ;取消选择
	}else if (WinActive("ahk_class #32770") and !WinActive("ahk_group GroupDiagOpenAndSave")){
		SendInput,{Escape}	;退出|关闭
	}else {
		SendInput,{Escape}	;退出|关闭
		Sleep,50
		SendInput,{RShift}	;英文输入法
	}
return

;***********************************************
;暂停
CapsLock & Pause::
	Suspend Permit
	Suspend Toggle
return
;***********************************************
; +CapsLock:: CapsLock ;"之前的写法
; ^PrintScreen::
; control + CapsLock to Toggle CapsLock.  alwaysoff/On so that the key does not blink
^CapsLock::     ;开/关CapsLock,右侧Ctrl+CapsLock.防止和Listary激活冲突
; !CapsLock::
	GetKeyState t, CapsLock, T
	IfEqual t,D, SetCapsLockState AlwaysOff
	else SetCapsLockState AlwaysOn
return
;***************** CapsLock自定义$ **************

;************** 全局一键搜索相关^ ***************
;一键Listary搜索
Sub_ListarySelectTxt:
;映射成双击Ctrl激活Listary后搜索选定文件(夹)名,并保留搜索词语
CapsLock & Space::
	;方法1:Listary/quicek中需设定好激活键Win+Alt+S
	;SendInput,#!s
	;方法2,无需设定,保持Listary初始设定,映射成双击Ctrl激活Listary
	;以复制+后处理方式获取文件(夹)名,
	SendInput, ^c
	Sleep,100
	clip:=
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		clip:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		clip:=Clipboard
	}
	Sleep,100
;***********************************************
	;双击Ctrl激活Listary
	SendInput, {Ctrl Down}
	Sleep,50
	SendInput, {Ctrl Up}
	Sleep,50
	SendInput, {Ctrl Down}
	Sleep,50
	SendInput, {Ctrl Up}
	Sleep,100
	SendInput, ^a	;全选
	Sleep,50
	; SendInput, {Del}	;清空搜索框
	; Sleep,50
	SendInput, %clip%
	; Sleep,50
	; clip:=
	; Clipboard :=
return
;***********************************************
;***********************************************
;一键uTools搜索
;uTools 搜索选定文件(夹)名,并保留搜索词语
Sub_uToolsSelectTxt:
CapsLock & b:: ;gosub,uTools
	;以复制+后处理方式获取文件(夹)名
	SendInput, ^c
	Sleep,100
	clip:=
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		clip:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		clip:=Clipboard
	}
	Sleep,100
;***********************************************
	;双击Alt激活uTools
	SendInput, {RAlt Down}
	Sleep,50
	SendInput, {RAlt Up}
	Sleep,50
	SendInput, {RAlt Down}
	Sleep,50
	SendInput, {RAlt Up}
	Sleep,50
	WinActivate, uTools ahk_class Chrome_WidgetWin_1
	Sleep,100
	SendInput, ^a	;全选
	Sleep,50
	; SendInput, {Del}	;清空搜索框
	; Sleep,50
	SendInput, %clip%
	; Sleep,50
	; clip:=
	; Clipboard :=
return
;***********************************************
;***********************************************
;一键Loom搜索
;Loom 搜索选定文件(夹)名,并保留搜索词语
Sub_LoomSelectTxt:
; $!c:: ;gosub,Loom
	;以复制+后处理方式获取文件(夹)名
	SendInput, ^c
	Sleep,100
	clip:=
	if (WinActive("ahk_group Group_explorer") or WinActive("ahk_group Group_Desktop")){
		clip:=GetFileInfo(Clipboard,3)	;只获取文件名
	}
	else {
		clip:=Clipboard
	}
	Sleep,100
;***********************************************
	;!c激活Loom
	SendInput, !c
	WinActivate, ahk_class Window Class ahk_exe Loom.exe
	Sleep,100
	SendInput, ^a	;全选
	Sleep,50
	SendInput, %clip%
	Sleep,50
	; clip:=
	; Clipboard :=
return
;************** 全局一键搜索相关$ ***************
;*****************  CapsLock相关$  **************


;************** 分号;相关^ ************** {{{2
`; & j:: SendInput,{Down}
`; & k:: SendInput,{Up}
`; & h:: SendInput,{Left}
`; & l:: SendInput,{Right}
`; & n:: SendInput,{PgDn}
`; & m:: SendInput,{PgUp}

`; & Space::SendInput,{Delete}

`; & z::
	GV_KeyClickAction1 := "SendInput,{BackSpace}"
	GV_KeyClickAction2 := "SendInput,+{Home}{BackSpace}"
	gosub,Sub_KeyClick123
return

`; & x::
	GV_KeyClickAction1 := "SendInput,{Delete}"
	GV_KeyClickAction2 := "SendInput,+{End}{Delete}"
	gosub,Sub_KeyClick123
return

`; & c::
	GV_KeyClickAction1 := "SendInput,^c"
	GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^c"
	gosub,Sub_KeyClick123
return

`; & b::
	GV_KeyClickAction1 := "SendInput,^x"
	GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^x"
	gosub,Sub_KeyClick123
return

`; & v::
	GV_KeyClickAction1 := "SendInput,^v"
	GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^v"
	gosub,Sub_KeyClick123
return

;粘贴然后回车，多用在搜索框等输入的位置，一个双手，一个单手
`; & g::
	GV_KeyClickAction1 := "SendInput,^v{Enter}"
	GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^v{Enter}"
	gosub,Sub_KeyClick123
return

;搜索选中的文本
`; & s::gosub,Sub_SearchSelectTxt

;清空复制粘贴
`; & d::SendInput,{Home 2}+{End}{BackSpace}
`; & a::SendInput,^{Home}^+{End}{Delete}

;任何地方编辑，复制后转到Vim中粘贴再继续编辑
`; & i::
	GV_KeyClickAction1 := "gosub,Sub_CopyVim"
	GV_KeyClickAction2 := "gosub,Sub_CopyAllVim"
	gosub,Sub_KeyClick123
return

;粘贴并转到,多数浏览器和tc中都可用
`; & u::SendInput,^t!d^v{Enter}
;`; & u::SendInput,^t!dwww.^v{Enter}

`; & 1::AscSend(fun_GetFormatTime("yyyyMMdd"))
;`; & 1::AscSend(fun_GetFormatTime("yyyy-MM-dd"))
`; & 2::AscSend(fun_GetFormatTime("HH:mm"))
`; & 3::AscSend("#" . fun_GetFormatTime("MMdd"))

;恢复分号自身功能
$`;::SendInput,`;

;`;::SendInput,`;
^`;::SendInput,^`;
+`;::SendInput,+`;
^+`;::SendInput,^+`;
!`;::SendInput,!`;
:::SendInput,:
;************** 分号;相关结束$ **************


;************** Space空格键相关^ ************** {{{2
; vim等中冲突排除，但在tc中不能连续空格.左手区设为符号区,切换开关,^!#Space
; 右手通用模式+shift符号模式
#If (GV_ToggleSpaceKeys==1)
Space & j:: SendInput,{Down}
Space & k:: SendInput,{Up}
Space & h:: SendInput,{Left}
Space & l:: SendInput,{Right}

; Space & b::SendInput,^{Left}
; Space & w::SendInput,^{Right}
; Space & a::SendInput,{PgDn}
; Space & q::SendInput,{PgUp}

; Space & c::
	; GV_KeyClickAction1 := "SendInput,^c"
	; GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^c"
	; gosub,Sub_KeyClick123
; return

Space & y::SendInput,{AppsKey} ;鼠标右(Y)键单击
; Space & '::SendInput,{Click} ;单引号'鼠标左键单击
Space & o::SendInput,^+{Tab} ;标签向左<-
Space & p::SendInput,^{Tab} ;标签向右->

Space & u::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	gosub,Sub_KeyClick123
return

Space & i::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	gosub,Sub_KeyClick123
return

Space & n::
	GV_KeyClickAction1 := "SendInput,{PgDn}"
	GV_KeyClickAction2 := "SendInput,^{PgDn}"
	gosub,Sub_KeyClick123
return

Space & m::
	GV_KeyClickAction1 := "SendInput,{PgUp}"
	GV_KeyClickAction2 := "SendInput,^{PgUp}"
	gosub,Sub_KeyClick123
return

;恢复{Space}默认打字功能,开启后微信不能Space输入联系人,可以Sapce+X|C|V
; $Space::SendInput,{Blind}{Space}
; $Space::Space	;恢复{Space}默认打字功能
^Space::^Space
+Space::+Space

Space & 1::	;输入0|!键,相加=11
	GV_KeyClickAction1 := "SendInput,{0}"
	GV_KeyClickAction2 := "SendInput,{Text}!"
	gosub,Sub_KeyClick123
return

Space & 2::	;输入2|@键,相加=11
	GV_KeyClickAction1 := "SendInput,{9}"
	GV_KeyClickAction2 := "SendInput,{Text}@"
	gosub,Sub_KeyClick123
return

Space & 3::	;输入3|#键,相加=11
	GV_KeyClickAction1 := "SendInput,{8}"
	GV_KeyClickAction2 := "SendInput,{Text}#"
	gosub,Sub_KeyClick123
return

Space & 4::	;输入4|$键,相加=11
	GV_KeyClickAction1 := "SendInput,{7}"
	GV_KeyClickAction2 := "SendInput,{Text}$"
	gosub,Sub_KeyClick123
return

Space & 5::	;输入5|%键,相加=11
	GV_KeyClickAction1 := "SendInput,{6}"
	GV_KeyClickAction2 := "SendInput,{Text}%"
	gosub,Sub_KeyClick123
return

Space & 6:: SendInput,{Text}^ ;输入^键
Space & 7:: SendInput,`& ;输入&键
Space & 8:: SendInput,`* ;输入*键
Space & 9:: SendInput,`( ;输入(键
Space & 0:: SendInput,`) ;输入)键
Space & -:: SendInput,`_ ;输入_键
Space & =:: SendInput,{NumpadAdd} ;输入+键
Space & [:: SendInput,{Text}{ ;输入{键
Space & ]:: SendInput,{Text}} ;输入}键
Space & `;:: SendInput,`: ;输入:键
Space & ':: SendInput,`" ;输入"键
Space & \:: SendInput,`| ;输入|键
Space & /:: SendInput,`? ;输入)键
Space & ,:: SendInput,`< ;输入)键
Space & .:: SendInput,`> ;输入)键
#If
;****************************************************
; 通用Capslock增强模式,Spk+EDSF=上下左右,约等于Ctrl,启用1
#If GV_SpaceKeysAsCapsLock==1 and !WinActive("ahk_Group Group_SingleSpace") and !WinActive("ahk_Group Group_browser") and !WinActive("ahk_Group SpaceKeysAsShiftInTC")
Space & q::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	gosub,Sub_KeyClick123
return

Space & w::	;输入^|&键
	GV_KeyClickAction1 := "SendInput,^s"  ;单击保存
	GV_KeyClickAction2 := "SendInput,{Text}&"
	gosub,Sub_KeyClick123
return

Space & e::	;{Up}|输入-键
	GV_KeyClickAction1 := "SendInput,{Up}"
	GV_KeyClickAction2 := "SendInput,`-"
	gosub,Sub_KeyClick123
return

Space & r::	;输入{del}|=|+键
	GV_KeyClickAction1 := "SendInput,{del}"
	GV_KeyClickAction2 := "SendInput,{NumpadAdd}" ;+
	gosub,Sub_KeyClick123
return

Space & t::		;输入{Backspace}|\键
	GV_KeyClickAction1 := "SendInput,{Backspace}"
	GV_KeyClickAction2 := "SendInput,`|"
	gosub,Sub_KeyClick123
return

;***********************************************

Space & a::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	gosub,Sub_KeyClick123
return

Space & s::	;输入/(数字/)
	GV_KeyClickAction1 := "SendInput,{Left}" ;{?/}
	GV_KeyClickAction2 := "SendInput,`/"
	gosub,Sub_KeyClick123
return

Space & d::	;单击{Left},双击输入逗(D)号
	GV_KeyClickAction1 := "SendInput,{Down}"
	GV_KeyClickAction2 := "SendInput,`,"
	gosub,Sub_KeyClick123
return

Space & f::	;单击{Right},双击输入分号(F);键
	GV_KeyClickAction1 := "SendInput,{Right}"
	GV_KeyClickAction2 := "SendInput,`;" ;分号
	gosub,Sub_KeyClick123
return

Space & g:: ;输入句号(g).键
	GV_KeyClickAction1 := "SendInput,{Enter}"
	GV_KeyClickAction2 := "SendInput,`."
	gosub,Sub_KeyClick123
return

;***********************************************

Space & z::
	GV_KeyClickAction1 := "gosub,Space_SgZ" ;输入""键
	GV_KeyClickAction2 := "SendInput,`'" 	;',单引号
	gosub,Sub_KeyClick123
return

Space & x::
	GV_KeyClickAction1 := "gosub,Space_SgX"	;剪切
	GV_KeyClickAction2 := "gosub,Space_DbX" ;{}|]
	gosub,Sub_KeyClick123
return

Space & c::
	GV_KeyClickAction1 := "gosub,Space_SgC" ;复制
	GV_KeyClickAction2 := "gosub,Space_DbC" ;()|'>,Listary->cmd命令行
	gosub,Sub_KeyClick123
return

Space & v::
	GV_KeyClickAction1 := "SendInput,^v" ;粘贴
	GV_KeyClickAction2 := "gosub,Space_DbV" ;{}|]
	gosub,Sub_KeyClick123
return

Space & b::	;鼠标右(Y)键单击|输入单冒号:
	GV_KeyClickAction1 := "SendInput,{Click,Right}" ;鼠标右(Y)键单击
	GV_KeyClickAction2 := "SendInput,`:"   ;单冒号:
	gosub,Sub_KeyClick123
return

Space & F1:: SendInput,{F11} ;加+10
Space & F2:: SendInput,{F12} ;加+10
Space & F3:: SendInput,{F8} ;相加=11
Space & F4:: SendInput,{F7} ;相加=11
Space & F5:: SendInput,{F6} ;相加=11

$Space::SendInput,{Blind}{Space} ;恢复{Space}默认打字功能
#If

;鼠标在微信打字框内
MouseInTextBox(i){
	WinGetPos,wxx,wxy,wxw,wxh, ahk_class WeChatMainWndForPC
	wxwb := wxw - 80
	wxhb := wxh - 60
	if ((wxx>=350) and (wxy>=662))
return, true
}

Space_SgC: ;2024/03/16,显示clip(clipboard内容)
	if WinActive("ahk_class WeChatMainWndForPC"){
		SendInput,{Home}+{End}^c{End} ;全选复制
		Sleep,300 	;等待0.3s, 强制机械等待剪贴板出现内容
		;clip:=clipboard
		StringLeft,clipboard_left,clipboard,500
		Tooltip,%clipboard_left%    ;在鼠标右侧显示clip(clipboard内容)
		Sleep,1500
		Tooltip
		;FileAppend, %Clipboard% `n, %COMMANDER_PATH%\剪切板\ClipAppend.txt
		gosub, ClipAppend
	}
	else {
		SendInput,^c ;复制
		Sleep,300 	;等待0.3s, 强制机械等待剪贴板出现内容
		;clip:=clipboard
		StringLeft,clipboard_left,clipboard,500
		Tooltip,%clipboard_left%    ;在鼠标右侧显示clip(clipboard内容)
		Sleep,1500
		Tooltip
		;FileAppend, %Clipboard% `n, %COMMANDER_PATH%\剪切板\ClipAppend.txt
		gosub, ClipAppend
	}
return

Space_SgX: ;2024/03/16,显示clip(clipboard内容)
	if WinActive("ahk_class WeChatMainWndForPC"){
		SendInput,{Home}+{End}^x{End} ;全选剪切
		Sleep,300 	;等待0.3s, 强制机械等待剪贴板出现内容
		;clip:=clipboard
		StringLeft,clipboard_left,clipboard,500
		Tooltip,%clipboard_left%    ;在鼠标右侧显示clip(clipboard内容)
		Sleep,2000
		Tooltip
		;FileAppend, %Clipboard% `n, %COMMANDER_PATH%\剪切板\ClipAppend.txt
		gosub, ClipAppend
	}
	else {
		SendInput,^x ;全选剪切
		Sleep,300 	;等待0.3s, 强制机械等待剪贴板出现内容
		;clip:=clipboard
		StringLeft,clipboard_left,clipboard,500
		Tooltip,%clipboard_left%    ;在鼠标右侧显示clip(clipboard内容)
		Sleep,2000
		Tooltip
		;FileAppend, %Clipboard% `n, %COMMANDER_PATH%\剪切板\ClipAppend.txt
		gosub, ClipAppend
	}
return

;****************************************************

;左手(Shift符号)输入模式,单击:AHK|编程等用标点符号优先.双击:TC模式,数字小键盘
#If GV_SpaceKeysAsShiftInTC==1 and WinActive("ahk_Group SpaceKeysAsShiftInTC")
Space & q::	;输入!键
	GV_KeyClickAction1 := "gosub,Space_SgQ"
	GV_KeyClickAction2 := "SendInput,{Text}``"	;'Runany
	gosub,Sub_KeyClick123
return

Space & w::	;输入^|&键
	GV_KeyClickAction1 := "gosub,Space_SgW"
	GV_KeyClickAction2 := "SendInput,{Text}&"	;7|&
	gosub,Sub_KeyClick123
return

Space & e::	;输入#键
	GV_KeyClickAction1 := "gosub,Space_SgE"
	GV_KeyClickAction2 := "SendInput,{Text}_" ;_|-
	gosub,Sub_KeyClick123
return

Space & r::	;输入$键
	GV_KeyClickAction1 := "gosub,Space_SgR"
	GV_KeyClickAction2 := "SendInput,{Text}=" ;=|+
	gosub,Sub_KeyClick123
return

Space & t::		;输入%键
	GV_KeyClickAction1 := "gosub,Space_SgT"
	GV_KeyClickAction2 := "SendInput,{Text}~"	;~
	gosub,Sub_KeyClick123
return

;****************************************************

Space & a::	;输入{\|}键
	GV_KeyClickAction1 := "SendInput,`\"
	GV_KeyClickAction2 := "SendInput,`|" ;{\|}键
	gosub,Sub_KeyClick123
return

Space & s::	;输入/(数字/)
	GV_KeyClickAction1 := "SendInput,`/" ;{?/}键,新建夹文件路径分割符
	GV_KeyClickAction2 := "SendInput,{NumpadDiv}"	;EzTc-(数字/)|恢复选择
	gosub,Sub_KeyClick123
return

Space & d::	;单击输入逗(D)号,双击-(数字减号)键
	GV_KeyClickAction1 := "SendInput,`,"	;EzTc,取消全选
	GV_KeyClickAction2 := "gosub,Space_DbD" ;EzTc-Alt+-|-(数字减号)
	gosub,Sub_KeyClick123
return

Space & f::	;输入分号(F);键
	GV_KeyClickAction1 := "SendInput,`;"	;EzTc,F4=cm_Edit
	GV_KeyClickAction2 := "gosub,Space_DbF" ;EzTc-Alt+=|+(数字|加号)
	gosub,Sub_KeyClick123
return

Space & g:: ;输入句号(g).键
	GV_KeyClickAction1 := "gosub,Space_SgG" ;Enter|句号(g).
	GV_KeyClickAction2 := "gosub,Space_DbG" ;EzTc-反选|*(数字|乘号)|句号.
	gosub,Sub_KeyClick123
return

;****************************************************

Space & z::
	GV_KeyClickAction1 := "gosub,Space_SgZ" ;输入""键
	GV_KeyClickAction2 := "SendInput,`'" 	;',单引号
	gosub,Sub_KeyClick123
return

Space & x::
	GV_KeyClickAction1 := "gosub,Space_SgX"	;剪切
	GV_KeyClickAction2 := "gosub,Space_DbX" ;{}|]
	gosub,Sub_KeyClick123
return

Space & c::
	GV_KeyClickAction1 := "gosub,Space_SgC" ;复制
	GV_KeyClickAction2 := "gosub,Space_DbC" ;()|'>,Listary->cmd命令行
	gosub,Sub_KeyClick123
return

Space & v::
	GV_KeyClickAction1 := "SendInput,^v" ;粘贴
	GV_KeyClickAction2 := "gosub,Space_DbV" ;{}|]
	gosub,Sub_KeyClick123
return

Space & b::	;鼠标右(Y)键单击|输入单冒号:,和普通模式相反
	GV_KeyClickAction1 := "gosub,Space_SgB" ;单冒号:|TC-右(Y)键
	GV_KeyClickAction2 := "SendInput,{AppsKey}" ;鼠标右(Y)键单击
	gosub,Sub_KeyClick123
return

Space & 6:: SendInput,`@ ;2和6符号互换

Space & F1:: SendInput,{F10} ;相加=11
Space & F2:: SendInput,{F9} ;相加=11
Space & F3:: SendInput,{F8} ;相加=11
Space & F4:: SendInput,{F7} ;相加=11
Space & F5:: SendInput,{F6} ;相加=11

$Space::SendInput,{Blind}{Space} ;恢复{Space}默认打字功能
#If

;****************************************************

Space_SgQ:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,!v	;EzTc-(~)键,激活常用文件
		}
	else {
		SendInput,{text}! 	;默认!
	}
return

Space_SgW:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,{NumpadDiv}	;EzTc-(除法)/键
		}
	else {
		SendInput,{text}^ 	;默认%
	}
return

Space_SgE:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,{NumpadSub}	;EzTc-(减法)-键
		}
	else {
		SendInput,{text}# 	;默认#
	}
return

Space_SgR:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,{NumpadAdd}	;EzTc-(加法)+键
		}
	else {
		SendInput,{text}$ 	;默认$
	}
return

Space_SgT:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,{NumpadMult}	;EzTc-(乘法)*键
		}
	else {
		SendInput,`% 	;默认%
	}
return

;****************************************************

Space_SgG:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,`.	;EzTc-句号(g).键,激活快搜
		}
	else {
		SendInput,{Enter} 	;默认{Enter}
	}
return

Space_DbG:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,{NumpadMult}	;EzTc-反选|*(数字|乘号)
		}
	else {
		SendInput,`.	;句号(g).键
	}
return

;****************************************************

Space_DbD:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,!`-	;EzTc-Alt+-,取消选择相同扩展名的文件
		}
	else {
		SendInput,{NumpadSub} ;-(数字|减号)
	}
return

Space_DbF:
	if WinActive("ahk_class TTOTAL_CMD"){
			SendInput,!`=	; EzTc-Alt+＝,选择相同扩展名的文件
		}
	else {
		SendInput,{NumpadAdd} ;+(数字|加号)
	}
return

;****************************************************

Space_SgZ:
	if WinActive("ahk_class TTOTAL_CMD"){
		SendInput,`'	; EzTc-',单引号=右键
	}
	else {
		SendInput,`"`"	;输入""键
		Sleep,100
		SendInput,{Left}
	}
return

Space_DbX:
	if WinActive("ahk_class TTOTAL_CMD"){
		SendInput,`[	;输入[键
	}
	else {
		SendInput,`[`]	;输入[]键
		Sleep,100
		SendInput,{Left}
	}
return

Space_DbC:
	if WinActive("ahk_group SpaceKeysAsShiftInTC") {
		SendInput,`>	;输入>键
	}
	else {
		SendInput,{text}()	;输入()键
		Sleep,100
		SendInput,{Left}
	}
return

Space_DbV:
	if WinActive("ahk_class TTOTAL_CMD"){
		SendInput,`]	;输入]键
	}
	else {
		SendInput,{text}{}	;输入{}键
		Sleep,100
		SendInput,{Left}
	}
return

Space_SgB:
	if WinActive("ahk_class TTOTAL_CMD"){
		SendInput,{AppsKey}	;鼠标右(Y)键单击
	}
	else {
		SendInput,{text}:	;输入单冒号:
	}
return
;************** Space空格键相关$ **************


;************** `花号键相关^ ************** {{{2
;这个位置顺手，主要是在按住做了选择之后，再去按ctrl或者；分号等就显得远了,默认自带Shift效果
;切换开关, Escape & /
#If (GV_ToggleHhjKeys ==1)	;默认关闭0,和Runany有冲突
{
	` & 1::SendInput,^x
	` & 2::SendInput,^c
	` & 3::SendInput,^v
	` & 4::SendInput,{Del}
	` & `;::SendInput,{Home}+{End}

	` & e::SendInput,^+{Up} ;by tuutg 2022/11/13
	` & d::SendInput,^+{Down} ;by tuutg 2022/11/13
	` & s::SendInput,^+{Left} ;by tuutg 2022/11/13
	` & f::SendInput,^+{Right} ;by tuutg 2022/11/13

	` & j:: SendInput,+{Down}
	` & k:: SendInput,+{Up}
	` & h:: SendInput,+{Left}
	` & l:: SendInput,+{Right}

	` & b::SendInput,^+{Left}
	` & w::SendInput,^+{Right}

	` & o::SendInput,^{PgUp}
	` & p::SendInput,^{PgDn}
	` & n:: SendInput,+{PgDn}
	` & m:: SendInput,+{PgUp}
	;` & y:: SendInput,{Home}+{End}
	;` & u:: SendInput,+{End}
	;` & i:: SendInput,+{Home}

	` & u::
		GV_KeyClickAction1 := "SendInput,+{End}"
		GV_KeyClickAction2 := "SendInput,^+{End}"
		gosub,Sub_KeyClick123
	return

	` & i::
		GV_KeyClickAction1 := "SendInput,+{Home}"
		GV_KeyClickAction2 := "SendInput,^+{Home}"
		gosub,Sub_KeyClick123
	return

	` & y::
		GV_KeyClickAction1 := "SendInput,{Home}+{End}"
		GV_KeyClickAction2 := "SendInput,^{Home}^+{End}"
		gosub,Sub_KeyClick123
	return

	;点不是默认的“确定”或者OK按钮，如果没有就点第一个Button1，适用与那种简单的对话框，比如TC的备注
	` & Enter::
		try{
			SetTitleMatchMode RegEx
			SetTitleMatchMode Slow
			ControlClick, i).*确定|OK.*, A
		} catch e{
			ControlClick, Button1, A
		}
	return


	+`::SendInput,~
	$`::SendInput,``
	^`::SendInput,^``
	$!`::SendInput,!``
	+!`::SendInput,+!``
	;`::EzMenuShow()
}
#If
;************** `花号键相关$ **************


;************** Alttab相关^ ************** {{{2
;按住左键再进行滚轮，在AltaTab菜单中，可以点击右键或者按空格进行确认选择。
;多用在把文件拖到别的程序中打开，或者类似于qq微信传文件。也可以将浏览器中的图片直接拖到文件管理器中保存
~LButton & WheelUp::ShiftAltTab
~LButton & WheelDown::AltTab
;就没必要还用这个了
;LWin & WheelUp::ShiftAltTab
;LWin & WheelDown::AltTab

;鼠标中操作
#If WinActive("ahk_class TaskSwitcherWnd")
{
	;Win10自己已经支持alttab中按空格选择程序
	if A_OSVersion in WIN_2003, WIN_XP, WIN_7
	{
		$!Space::SendInput,{Alt Up}
		$Space::SendInput,{Alt Up}
	}

	;在alttab的菜单中，点右键选中对应的程序
	!RButton::SendInput,{Alt Up}
	~LButton & RButton::SendInput,{Alt Up}

	;alt+shift+tab，切换到上一个窗口功能，放在一起共用TaskSwitcherWnd算了
	;<+Tab::ShiftAltTab


	;左手
	!q::SendInput,{Left}
	!d::SendInput,{Down}
	!e::SendInput,{Up}
	!s::SendInput,{Left}
	!f::SendInput,{Right}

	;右手
	!j::SendInput,{Down}
	!k::SendInput,{Up}
	!h::SendInput,{Left}
	!l::SendInput,{Right}
	!u::SendInput,{End}
	!i::SendInput,{Home}
	!,::SendInput,{Left}
	!.::SendInput,{Right}
}
;Win10改成了MultitaskingViewFrame,Win11改成了XamlExplorerHostIslandWindow
#If WinActive("ahk_class MultitaskingViewFrame") or WinActive("ahk_class XamlExplorerHostIslandWindow")
{
	!RButton::SendInput,{Alt Up}
	~LButton & RButton::SendInput,{Alt Up}
	;左手
	!q::SendInput,{Left}
	!d::SendInput,{Down}
	!e::SendInput,{Up}
	!s::SendInput,{Left}
	!f::SendInput,{Right}

	;右手
	!j::SendInput,{Down}
	!k::SendInput,{Up}
	!h::SendInput,{Left}
	!l::SendInput,{Right}
	!u::SendInput,{End}
	!i::SendInput,{Home}
	!,::SendInput,{Left}
	!.::SendInput,{Right}
}
#If
;************** Alttab相关$ **************


;************** tab相关^ ************** {{{2
;基本操作上下左右，还可以扩展，主要用在左键右鼠的操作方式,默认自带Ctrl效果
;开关为ctrl+win+alt+花号/^!#`
#If (GV_ToggleTabKeys==1)
{
	Tab & e::SendInput,^{Up} ;by tuutg 2022/11/13
	Tab & d::SendInput,^{Down} ;by tuutg 2022/11/13
	Tab & s::SendInput,^{Left} ;by tuutg 2022/11/13
	Tab & f::SendInput,^{Right} ;by tuutg 2022/11/13
	Tab & q::SendInput,^{PgUp}
	Tab & a::SendInput,^{PgDn} ;by tuutg 2022/11/13

	;对应任务栏上固定的前5个程序快速切换
	Tab & 1::SendInput,#1
	Tab & 2::SendInput,#2
	Tab & 3::SendInput,#3
	Tab & 4::SendInput,#4
	Tab & 5::SendInput,#5

	;常用的三个按键
	Tab & r::SendInput,{Del}
	Tab & w::SendInput,^s
	Tab & Space::WinMinimize A

	;这个位置按起来不舒服，但先留着
	Tab & x::SendInput,^x
	Tab & t::SendInput,{BackSpace}

	;右手模式，和caps一样，随便按哪一个都行，自由发挥吧
	Tab & j::SendInput,^{Down}
	Tab & k::SendInput,^{Up}
	Tab & h::SendInput,^{Left}
	Tab & l::SendInput,^{Right}
	Tab & n::SendInput,^{PgDn}
	Tab & m::SendInput,^{PgUp}
	Tab & u::SendInput,^{End}
	Tab & i::SendInput,^{Home}

	;各个程序对应小菜单
	Tab & v::gosub,EzOtherMenuShow

	;粘贴然后回车，多用在搜索框等输入的位置，一个双手，一个单手
	Tab & g::
		GV_KeyClickAction1 := "SendInput,^v{Enter}"
		GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^v{Enter}"
		gosub,Sub_KeyClick123
	return

	;转到Vim进行编辑
	Tab & c::
		GV_KeyClickAction1 := "gosub,Sub_CopyVim"
		GV_KeyClickAction2 := "gosub,Sub_CopyAllVim"
		gosub,Sub_KeyClick123
	return

	;重要的alttab菜单
	<!Tab::AltTab

	;恢复tab自身功能,用~恢复Tab,用于热字符串终止键
	Tab::SendInput,{Tab}

	;Tab::	;双击tab，会明显减慢tab的响应速度，不用
		;GV_KeyTimer := 300
		;GV_KeyClickAction1 := "SendInput,{Tab}"
		;GV_KeyClickAction2 := "SendInput,#{Tab}"
		;gosub,Sub_KeyClick123
	;return

	#Tab:: SendInput,#{Tab}
	+Tab::SendInput,+{Tab}
	;CapsLock & Alt::	;按住Caps不放，再按Alt.2023/08/24 08:25
	^Tab::SendInput,^{Tab}
	^+Tab::SendInput,^+{Tab}
}
#If
;************** tab相关$ **************


;************** 单键模式^ ************** {{{2
;开关按键为caps+/
#If (GV_ToggleKeyMode==1)
{
	j::SendInput,{Down}
	k::SendInput,{Up}
	h::SendInput,{Left}
	l::SendInput,{Right}
	y::SendInput,{Click,Right}

	u::
		GV_KeyClickAction1 := "SendInput,{End}"
		GV_KeyClickAction2 := "SendInput,^{End}"
		gosub,Sub_KeyClick123
	return

	i::
		GV_KeyClickAction1 := "SendInput,{Home}"
		GV_KeyClickAction2 := "SendInput,^{Home}"
		gosub,Sub_KeyClick123
	return

	n::
		GV_KeyClickAction1 := "SendInput,{PgDn}"
		GV_KeyClickAction2 := "SendInput,^{PgDn}"
		gosub,Sub_KeyClick123
	return

	m::
		GV_KeyClickAction1 := "SendInput,{PgUp}"
		GV_KeyClickAction2 := "SendInput,^{PgUp}"
		gosub,Sub_KeyClick123
	return

	o::SendInput,^+{Tab}
	p::SendInput,^{Tab}
	.::SendInput,^w
	;w::SendInput,^w

	`;::SendInput,{Click}
	,::SendInput,{Escape}
	q::SendInput,{F3} ;quicklook
	w::SendInput,^w
	e::SendInput,{Enter}
	r::SendInput,{F2}
	t::SendInput,{BackSpace}
	a::SendInput,^+s ;另存
	s::SendInput,^s
	d::SendInput,{del}y
	f::SendInput,^f
	g::SendInput,^g
	b::SendInput,^h
	v::SendInput,^v
	c::SendInput,^c
	x::SendInput,^x
	z::SendInput,^z
}
#If
;************** 单键模式$ **************


;******* 截图小功能,截图并打开保存路径^******** {{{2
>!Space::fun_NircmdScreenShot(1)	;ActiveWin
#^PrintScreen::fun_NircmdScreenShot(0)	;全屏截图
#+PrintScreen::fun_NircmdScreenShot(1)	;ActiveWin
;前提是用管理员运行nircmd.exe->拷进系统System32目录
; ScreenShotPath := "D:\RunCaptX\PixPinTg截图"

fun_NircmdScreenShot(wd)
{
	;1 ActiveWin ,0 WholeDesktop
	;ScreenShotPath := "D:\"
	if(wd = 1){
		SSFileName := % ScreenShotPath . "\SSAW-" . fun_GetFormatTime( "yyyy-MM-dd HH-mm-ss" ) . ".png"
		Run nircmd savescreenshotwin "%SSFileName%"
		if(GV_ScreenShot2Clip = 1){
			Sleep,1000
			Run,nircmd Clipboard copyimage "%SSFileName%"
		}
	}
	else {
		SSFileName := % ScreenShotPath . "\SSWD-" . fun_GetFormatTime( "yyyy-MM-dd HH-mm-ss" ) . ".png"
		Run nircmd savescreenshot "%SSFileName%"
		if(GV_ScreenShot2Clip = 1){
			Sleep,1000
			Run,nircmd Clipboard copyimage "%SSFileName%"
		}
	}
	Sleep,1000
	EzTip(SSFileName,2)
	Run,%ScreenShotPath%
}
;************** 截图小功能$ **************


;************** 窗口相关^ ************** {{{2
;去掉标题栏
#f11::
	;WinSet, Style, ^0xC00000, A ;用来切换标题行，主要影响是无法拖动窗口位置。
	;WinSet, Style, ^0x40000, A ;用来切换sizing border，主要影响是无法改变窗口大小。
	gosub, Sub_WindowNoCaption
return
;************** 窗口相关$ **************


;************** Mouse鼠标相关^ ************** {{{2
;鼠标侧边键XButton2,ahk只认这两个，可以自行去掉注释
XButton2::SendInput,{PgUp}
XButton1::SendInput,{PgDn}
XButton2 & XButton1::SendInput,{Escape}
XButton1 & XButton2::SendInput,{Escape}

;**************************************************
;鼠标自定义代码,添加到此处
;快速打印
$+MButton::
Space & MButton::	;20240105
	SendInput,^p ;打印
return
;************** Mouse鼠标相关$ *******************


;********** 几种模式的开关，暂停重启^ ********** {{{2
;单键模式启用/关闭
ScrollLock::
CapsLock & /::
	GV_ToggleKeyMode := !GV_ToggleKeyMode
	if(GV_ToggleKeyMode == 1)
		ToolTip 单键模式启用
	else
		ToolTip 单键模式关闭
		Sleep 2000
		ToolTip
return
;****************************************************
;Space启用/关闭
^!#Space::
	GV_ToggleSpaceKeys := !GV_ToggleSpaceKeys
	if(GV_ToggleSpaceKeys == 1)
		ToolTip 空格组合键启用
	else
		ToolTip 空格组合键关闭
	Sleep 2000
	ToolTip
return
;****************************************************
;Tab启用/关闭
;直接用ctrl+win+alt+tab键会引发alttab，不合适。而caps和花号是不考虑模式都在的。故用花号。
^!#`::
	GV_ToggleTabKeys := !GV_ToggleTabKeys
	if(GV_ToggleTabKeys == 1)
		ToolTip Tab组合键启用
	else
		ToolTip Tab组合键关闭
	Sleep 2000
	ToolTip
return
;****************************************************
;暂停热键，可以再按恢复
Pause::
^!#t::
;Escape & Pause::
;CapsLock & Pause::
	Suspend Permit
	Suspend Toggle
return
;****************************************************
;暂停脚本，可以右键菜单选择或者用重启脚本恢复
^!#z::
	Suspend Permit
	Pause Toggle
return
;****************************************************
;重启脚本
^#!r::
#F5::
CapsLock & F5::
	gosub,ForceSelfReload
return
;****************************************************
;解决Win10中任务栏无法切换的臭毛病
^!#e::Run,nircmd shellrefresh
;****************************************************
;`花号键，与ranany冲突，默认关闭,一键启用/关闭,默认自带Shift效果
Escape & /::
	GV_ToggleHhjKeys := !GV_ToggleHhjKeys
	if (GV_ToggleHhjKeys == 1)
		ToolTip 花号组合键启用
	else
		ToolTip 花号组合键关闭
	Sleep 2000
	ToolTip
return
;************ 几种模式的开关，暂停重启$ *************


;************** 应用程序相关^ ************** {{{1
;************** Group_browser^相关^ ******** {{{2
;以360极速浏览器X模板,其他浏览器个别按键可能有不起作用
#If WinActive("ahk_group Group_browser")
{
	CapsLock & r::SendInput,!{Right}	;->前进,20231116
	CapsLock & w::SendInput,!{Left}		;<-后退,20231116

	; $F1::SendInput,^t
	$F2::SendInput,^+{Tab}
	$F3::SendInput,^{Tab}
	$F4::SendInput,^w
	$F9::ControlSend,,{F9}	;油小猴超级翻译助手

	$!q::ControlSend,,!q	;Chrono Power Action|屏蔽Ra
	$!w::SendInput,!w	;沉浸式翻译-翻译网页/显示原文
	$!e::SendInput,^+t	;恢复最后关闭页面
	$!r::ControlSend,,!a	;沉浸式翻译-翻译页面全部区域|屏蔽微信
	$!t::SendInput,!t	;篡改猴测试版-Open dashboard|设置面板
	$+!t::SendInput,^+m	;打开Chrome设置面板|360X浏览器静音

	$!a::SendInput,^a	;全选
	; $!s::SendInput,!s	;RA-搜索
	$!+s::ControlSend,,!+s ;ChatGPT Shortcut|屏蔽Ra
	; $!d::		;聚集地址框
	$!+d::ControlSend,,!+d ;Dark Reader|屏蔽Ra
	$!f::SendInput,^f	;网页内查找
	$!g::SendInput,^j	;自带下载

	$!z::SendInput,^0	;缩放100%
	$!x::SendInput,^h	;历史记录
	$+!x::SendInput,^+{del} ;清除历史记录
	$!c::SendInput,{F11}	;全屏
	$!v::SendInput,{F12}	;开发者模式
	$!b::SendInput,^d	;添加到书签


	`;::
	;msgbox % GetCursorShape()
	;64位的Win7下，在输入框中是148003967
	if (GetCursorShape() = GV_CursorInputBox) ;I型光标
		SendInput,`;
	else
		SendInput,{Click}
	return

	!`;::SendInput,{Click,Right}
	^`;::SendInput,`;

	;按住左键点中键发送Ctrl+t新建标签
	~LButton & MButton::SendInput,^t

	;~LButton::
		;GV_LongClickAction := "SendInput,{MButton}"
		;GV_MouseButton := 1
		;gosub,Sub_ButtonLongPress
	;return

	XButton1 & RButton::SendInput,^c
	XButton2 & RButton::SendInput,^c

	XButton2 & XButton1::gosub,Sub_Idm2Mpv
	XButton1 & XButton2::gosub,Sub_Idm2Mpv

	XButton1 & WheelUp::SendInput,{Left}
	XButton2 & WheelUp::SendInput,{Left}
	XButton1 & WheelDown::SendInput,{Right}
	XButton2 & WheelDown::SendInput,{Right}

	Tab & WheelUp:: SendInput,{Left}
	Tab & WheelDown::SendInput,{Right}

	XButton2::
		p := ClickAndLongClick()
		if (p = "0") {
			;单击
			if GV_GroupBrowserToggleWheelModeLeftRight
			SendInput,{MButton}
			else
			Send,{PgUp}
		} else if (p = "00") {
			;双击
			GV_GroupBrowserToggleWheelModeLeftRight := !GV_GroupBrowserToggleWheelModeLeftRight
			EzTip("切换鼠标滚轮模式" . GV_GroupBrowserToggleWheelModeLeftRight,2)
		}
	return

	XButton1::
	p := ClickAndLongClick()
	if (p = "0") {
		;单击
		if GV_GroupBrowserToggleMButtonMode
		SendInput,{MButton}
		else
		Send,{PgDn}
	} else if (p = "00") {
		;双击
		GV_GroupBrowserToggleMButtonMode := !GV_GroupBrowserToggleMButtonMode
		EzTip("切换侧边键作为中键" . GV_GroupBrowserToggleMButtonMode,2)
	} else if (p = "01") {
		;双击再按住
		GV_GroupBrowserToggleWheelModeUpDown := !GV_GroupBrowserToggleWheelModeUpDown
		EzTip("切换滚轮为翻页" . GV_GroupBrowserToggleWheelModeUpDown,2)
	}
	return


	;浏览器中切换滚轮模式，主要是方便看视频，西瓜和B站
	<!Space::
		GV_GroupBrowserToggleWheelModeLeftRight := !GV_GroupBrowserToggleWheelModeLeftRight
		EzTip("鼠标滚轮模式切换" . GV_GroupBrowserToggleWheelModeLeftRight,2)
	return

	WheelUp::
		if GV_GroupBrowserToggleWheelModeLeftRight {
			SendInput,{Left}
		} else if GV_GroupBrowserToggleWheelModeUpDown {
			SendInput,{PgUp}
		} else {
			SendInput,{WheelUp}
		}
	return

	WheelDown::
		if GV_GroupBrowserToggleWheelModeLeftRight {
			SendInput,{Right}
		} else if GV_GroupBrowserToggleWheelModeUpDown {
			SendInput,{PgDn}
		} else {
			SendInput,{WheelDown}
		}
	return

	$!WheelUp::SendInput,!{Left}	;<-,20231116
	$!WheelDown::SendInput,!{Right}	;->,20231116
}
#If
;****************************************************
;在浏览器中单独启用空格组合键
;一键启用/关闭 Ctrl+Win+Alt+Space
;按住 Space 后，搭配其它键，你可以实现以下功能：
#If WinActive("ahk_group Group_browser") and (GV_GroupBrowserToggleSpaceKeys == 1)
{
	Space & j:: SendInput,{Down}
	Space & k:: SendInput,{Up}
	Space & h:: SendInput,{Left}
	Space & l:: SendInput,{Right}

	Space & WheelUp::SendInput,{Left}{Space up}
	Space & WheelDown::SendInput,{Right}{Space up}

	Space & q::SendInput,^{PgUp}	;切换至下个标签
	Space & w::SendInput,!{Left}	;<-,20231116
	Space & e::SendInput,{PgUp} ;向上翻页
	Space & r::SendInput,!{Right}	;->,20231116
	;Space & r::SendInput,{Del}	;20231116
	Space & t::SendInput,{BackSpace} ;20231116

	;先将鼠标光标停在链接上，在链接上右键菜单，然后选另存为
	Space & a::
		SendInput,{Click,Right}
		Sleep,200
		SendInput,k
	return
	Space & s::SendInput,^v{Enter}
	Space & d::SendInput,{PgDn} 	;向下翻页
	Space & f::gosub,Sub_Idm2Mpv
	Space & g::SendInput,{Enter}	;20231116

	Space & z::SendInput,^0		;缩放100%
	Space & x::
		GV_KeyClickAction1 := "gosub,Space_SgX"
		GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^x"
		gosub,Sub_KeyClick123
	return

	Space & c::
		GV_KeyClickAction1 := "gosub,Space_SgC"
		GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^c"
		gosub,Sub_KeyClick123
	return

	Space & v::
		GV_KeyClickAction1 := "SendInput,^v"
		GV_KeyClickAction2 := "SendInput,^{Home}^+{End}^v"
		gosub,Sub_KeyClick123
	return

	Space & b::SendInput,!{Right}	;->,20231116
	Space & \::SendInput,^a^v{Enter}

	Space & u::
		GV_KeyClickAction1 := "SendInput,{End}"
		GV_KeyClickAction2 := "SendInput,^{End}"
		gosub,Sub_KeyClick123
	return

	Space & i::
		GV_KeyClickAction1 := "SendInput,{Home}"
		GV_KeyClickAction2 := "SendInput,^{Home}"
		gosub,Sub_KeyClick123
	return

	Space & n::
		GV_KeyClickAction1 := "SendInput,{PgDn}"
		GV_KeyClickAction2 := "SendInput,^{PgDn}"
		gosub,Sub_KeyClick123
	return

	Space & m::
		GV_KeyClickAction1 := "SendInput,{PgUp}"
		GV_KeyClickAction2 := "SendInput,^{PgUp}"
		gosub,Sub_KeyClick123
	return

	;复制文本
	; Space & RButton::SendInput,^c

	;粘贴
	XButton2 & LButton::
	; Space & LButton::
	if (GetCursorShape() = GV_CursorInputBox){
		SendInput,{Click}
		Sleep,100
		SendInput,^v{Enter}
	} else if(GetCursorShape() = GV_CursorClick) {
		SendInput,{MButton}
	} else {
		SendInput,{Enter}
	}
	return

	;连击3下用来选中文本段落，然后复制
	Space & XButton1::
		SendInput,{Click 3}
		Sleep 100
		SendInput,^c
	return

	$Space::SendInput,{Blind}{Space}	;恢复{Space}默认打字功能
	; $Space::Space		;恢复{Space}默认打字功能
	^Space::^Space
	+Space::+Space
}
#If

Sub_Idm2Mpv:
	;先点击IDM浮动
	ControlGetPos, x, y, w, h, IDM Download Button class1
	ControlClick, IDM Download Button class1, , , Left, 1, x12 y8
	Sleep 500
	MouseMove, x,y
	;再来处理，自己选择具体哪一条清晰度等
	Sleep 3000

	WinWait, 下载文件信息 ahk_class #32770, , 20
	IfWinNotActive, 下载文件信息 ahk_class #32770, , WinActivate, 下载文件信息 ahk_class #32770
		WinWaitActive, 下载文件信息 ahk_class #32770, , 20

	;WinWaitActive, 下载文件信息 ahk_class #32770, , 20
	if !ErrorLevel
	{
		;ControlGetText,Out,Edit1,下载文件信息 ahk_class #32770 ahk_exe IDMan.exe
		ControlGetText,Out,Edit1,下载文件信息 ahk_class #32770
		WinClose,下载文件信息 ahk_class #32770
		Run,%COMMANDER_PATH%\Plugins\WLX\vlister\mpv.exe "%Out%"
	}
return


#IfWinActive ahk_group Group_disableCtrlSpace
	^Space::ControlSend,,^{Space}
	+Space::ControlSend,,+{Space}
#IfWinActive


;totalcmd中特殊的按住左键点右键移动
;#IfWinNotActive ahk_class TTOTAL_CMD
;~LButton & RButton::
	;opera 等少数软件之中都可以有自己的按住左键点右键功能
	;if not WinActive("ahk_class OperaWindowClass") and not WinActive("GreenBrowser"){
	;Send ^w
	;}
;return
;#IfWinNotActive
;************** Group_browser^相关$ *******


;************** 记事本 ************** {{{1

;启动记事本并去标题等 {{{3
$!#n::
	Run "%COMMANDER_PATH%\Tools\notepad\Notepad3.exe" /f "%COMMANDER_PATH%\Tools\notepad\Lite.ini", , , OutputVarPID
	Sleep 100
	WinWait ahk_pid %OutputVarPID%
	if ErrorLevel
	{
		ToolTip 超时了，再试一下？
		Sleep 2000
		ToolTip
		return
	}
	else
	{
		PID = %OutputVarPID%
		WinGet, ThisHWND, ID, ahk_pid %PID%
		;设置位置和大小, x,y,width,height
		;WinMove, ahk_id %ThisHWND%,, 700,400,550,350
		WinMove, ahk_id %ThisHWND%,, 700,600,310,144
		;WinMove, ahk_pid %PID%,, 700,400,550,350
		;去标题
		;WinSet, Style, ^0xC00000, ahk_pid %PID%
		;不能改变大小
		;WinSet, Style, ^0x40000, ahk_pid %PID%
		;去菜单
		DllCall("SetMenu", "Ptr", ThisHWND, "Ptr", 0)
		;顶端
		;Winset, Alwaysontop, On,  ahk_pid %PID%
	}
return
;****************************************************
;启动记事本并去标题等，并收集剪贴板 {{{3
$^#n::
	Run "%COMMANDER_PATH%\Tools\notepad\Notepad3.exe" /b /f "%COMMANDER_PATH%\Tools\notepad\Lite.ini", , , OutputVarPID
	Sleep 100
	WinWait ahk_pid %OutputVarPID%
	if ErrorLevel
	{
		ToolTip 超时了，再试一下？
		Sleep 2000
		ToolTip
		return
	}
	else
	{
		PID = %OutputVarPID%
		WinGet, ThisHWND, ID, ahk_pid %PID%
		;设置位置和大小, x,y,width,height
		;WinMove, ahk_id %ThisHWND%,, 700,400,550,350
		WinMove, ahk_id %ThisHWND%,, 700,600,310,144
		;WinMove, ahk_pid %PID%,, 700,400,550,350
		;去标题
		;WinSet, Style, ^0xC00000, ahk_pid %PID%
		;不能改变大小
		;WinSet, Style, ^0x40000, ahk_pid %PID%
		;去菜单
		DllCall("SetMenu", "Ptr", ThisHWND, "Ptr", 0)
		;顶端
		;Winset, Alwaysontop, On,  ahk_pid %PID%
	}
return
;************** 记事本$ **************


;************ 例子,建议从这里修改^ ************ {{{1
;建议的绿色便携的小菜单程序PopSel,Qsel，这两个二选一即可
$!#p::
$!#Q::
	if(GV_PopSel_QSel="popsel") {
		Run %COMMANDER_PATH%\Tools\popsel\PopSel.exe /pc /T500
		Sleep 500
		MyWinWaitActive("PopSel - ahk_class WindowClass_0")
	}
	else if(GV_PopSel_QSel="qsel") {
		Run,"%COMMANDER_PATH%\Tools\qsel\Qsel.exe", %COMMANDER_PATH%\Tools\qsel
		Sleep 500
		MyWinWaitActive("Qsel ahk_class WindowClass_0")
	}
return

$!#RButton::
	if(GV_PopSel_QSel="popsel") {
		Run %COMMANDER_PATH%\Tools\popsel\PopSel.exe /i /T500
		Sleep 500
		MyWinWaitActive("PopSel - ahk_class WindowClass_0")
	}
	else if(GV_PopSel_QSel="qsel") {
		Run,"%COMMANDER_PATH%\Tools\qsel\Qsel.exe", %COMMANDER_PATH%\Tools\qsel
		Sleep 500
		MyWinWaitActive("Qsel ahk_class WindowClass_0")
	}
return

;#z::
	; Run %COMMANDER_PATH%\Tools\popsel\PopSel.exe /pc /T500
	; Sleep 500
	; MyWinWaitActive("PopSel - ahk_class WindowClass_0")
;return

;#RButton::
	; Run %COMANDER_PATH%\Tools\popsel\PopSel.exe /i /T500
	; Sleep 500
	; MyWinWaitActive("PopSel - ahk_class WindowClass_0")
;return

;建议的绿色便携的小菜单程序Qsel，这两个二选一即可
;#z::
	; Run,"%COMMANDER_PATH%\Tools\qsel\Qsel.exe", %COMMANDER_PATH%\Tools\qsel
	; Sleep 500
	; MyWinWaitActive("Qsel  ahk_class WindowClass_0")
;return

;#RButton::
	; Run,"%COMMANDER_PATH%\Tools\qsel\Qsel.exe", %COMMANDER_PATH%\Tools\qsel
	; Sleep 500
	; MyWinWaitActive("Qsel  ahk_class WindowClass_0")
;return

; #f::
	; Run,%COMMANDER_PATH%\Everything.exe
	; IfExist,C:\Windows\SysWOW64\
		; Run,"%RunCaptX%\Everything\Everything.exe" -s "%getZz%"
	; else
		; Run,"%RunCaptX%\Everything\Everything-x86\Everything.exe" -s "%getZz%"
	; Sleep 500
	; MyWinWaitActive("ahk_class EVERYTHING")
; return

;$!#c::Run, cmd
;管理员权限cmd
$^#c::Run, *RunAs cmd
#^!#n::Run, %COMMANDER_PATH%\Tools\notepad\Notepad3.exe /c

;可以改成自己的软件目录,默认在TC的SoftDir
#F6::
	IfExist, %SoftDir%\Office\MicroOffice\MicroWord.exe
	Run, %SoftDir%\Office\MicroOffice\MicroWord.exe
return

#F7::
	IfExist, %SoftDir%\Office\MicroOffice\microexcel.exe
	Run, %SoftDir%\Office\MicroOffice\microexcel.exe
return

#F8::
	IfExist, %SoftDir%\Office\MicroOffice\SmartPPT.exe
	Run, %SoftDir%\Office\MicroOffice\SmartPPT.exe
return
;************** 例子,建议从这里修改$ **************


;************* 各程序快捷键或功能^ ************* {{{1
;调用任务栏相关程序快捷键 {{{2
;用鼠标中键作为组合键来进行切换，默认注释掉
;$MButton::SendInput,{MButton}
;$MButton & Tab::
XButton1 & Tab::
XButton2 & Tab::
`; & Tab::
	;Totalcmd
	SendInput,#1
return

XButton1 & CapsLock::
XButton2 & CapsLock::
`; & CapsLock::
	;Vim
	SendInput,#2
return

XButton1 & q::
XButton2 & q::
`; & q::
	;QQ
	SendInput,#3
return

XButton1 & w::
XButton2 & w::
`; & w::
	;微信
	SendInput,#4
return

XButton1 & e::
XButton2 & e::
`; & e::
	SendInput,#5
return

XButton1 & r::
XButton2 & r::
`; & r::
	SendInput,#6
return

XButton1 & t::
XButton2 & t::
`; & t::
	SendInput,#7
return
;调用任务栏相关程序快捷键$


;***********全局热键Tc|Ev|At|Fl************
;Ctrl+Alt+左键点击，定位程序到对应的目录
$^!LButton::
$+!MButton::	;20240306
	SendInput,{Click}
	WinGet, ProcessPath, ProcessPath, A
	;Run Explorer /select`, %ProcessPath%
	Run,"%COMMANDER_EXE%" /T /O /S /R="%ProcessPath%"
	WinActivate, ahk_class TTOTAL_CMD
	WinWait, ahk_class TTOTAL_CMD
	WinMove, ahk_class TTOTAL_CMD, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
return
;****************************************************
;Win+Alt+左键点击,定位文件到对应的目录,Quicker设定好+!s为定位文件目录动作
$#!LButton::
	SendInput,{Click}
	if WinExist("ahk_exe Quicker.exe"){
		SendInput,+!s	;Quicker设定好+!s为定位文件目录动作
	}
	else {
		SendInput,#!d	;Ra_XiaoYao_plus设定好#!d为定位文件目录动作
	}
return
;****************************************************
$!#z::gosub,TextToEverything ;一键everything搜索
;****************************************************


;把资源管理器中选中的文件用tc打开   {{{2
;Win10|Win7的资源管理器+360文件管理器等
#If WinActive("ahk_Group Group_explorer") ;20240228
{
	; $!q::SendInput,!q	;Runany_启动管理

	CapsLock & w:: ;启动激活微信|微信文件传输助手->发送文件
		IfWinNotExist,ahk_exe WeChat.exe
		{
			gosub,RunWechat	;启动激活微信
			WinActivate, ahk_exe WeChat.exe
			WinWait, ahk_exe WeChat.exe
		}
		else {	;微信文件传输助手->发送文件
			SendInput,{Click}
			SendInput,^c
			Sleep,100
			clip:=GetFileInfo(Clipboard,3)	;只获取文件名
			if (clip!=""){
				SendInput,^!w	;激活微信,20231216
				Sleep,100
				gosub,微信文件传输助手
				Sleep,1000
				SendInput,^v
			}
			else {
				SendInput,^!w	;激活微信,20231216
				Sleep,100
				gosub,微信文件传输助手
			}
		}
	return

	$!e::SendInput,#e	;打开系统资管
	; $!e::Run,%COMMANDER_PATH%\Tools\AutoHotkey\SciTE\SciTE.exe

	$!r::SendInput,{F2}	;重命名

	$!t::	;呼出任务管理器窗口|tagLyst主窗口
		if WinExist("ahk_exe tagLyst.exe")
		{
			SendInput,^#t	;呼出/隐藏tagLyst主窗口
			WinActivate, tagLyst ahk_class Chrome_WidgetWin_1
			WinWait, tagLyst ahk_class Chrome_WidgetWin_1
			WinMove, tagLyst ahk_class Chrome_WidgetWin_1, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
		}
		else {
			SendInput,^+{Esc}	;呼出任务管理器窗口
		}
	return
;****************************************************
	$!a::
		if WinExist("ahk_exe WeChat.exe"){
			SendInput,!a	;微信截图
		}
		else if (WinExist("ahk_exe ATGUI.exe") and !WinExist("ahk_exe WeChat.exe")){
			gosub,Sub_AnytextSelectTxt	;一键Anytext搜索|Listray_智能命令
		}
		else {
			SendInput,^a	;全选
		}
	return

	; $!s::Run,%COMMANDER_PATH%\Tools\AutoHotkey\WindowSpy.exe	;预留给Ra搜索

	; $!d::SendInput,#d	;呼出/隐藏桌面|保持系统默认,聚集地址栏

	$!f::gosub,TextToEverything	;一键everything搜索

	; $!g::SendInput,!g	;呼出Ra插件管理
;****************************************************
	$!z::SendInput,^z	;撤销

	; $!x::	;预留激活AnyTXT Searcher,要在AnyTXT设置!x激活热键

	$!c::SendInput,#d	;显示桌面|呼出Loom|Utools_OCR_识别复制
		; if (WinExist("ahk_exe Loom.exe") or WinExist("ahk_exe uTools.exe"))
		; {
			; SendInput,!c	;呼出Loom|Utools_OCR_识别复制
		; }
		; else {	;显示桌面
			; SendInput,#d	;显示桌面
		; }
	; return

	$!v::
		if WinExist("ahk_exe QuickJump.exe")
		{
			SendInput,^d	;QuickJump,^d,弹出菜单列表
		}
		else {	;打开编辑器QuickJump 4.1 内测版
			IfExist, D:\Program Files\Microsoft VS Code\Code.exe
				Run,"D:\Program Files\Microsoft VS Code\Code.exe"	;呼出Code.exe
			else IfExist,%RunCaptX%\GreenTools\Notepad--\notepad--.exe
				Run,%RunCaptX%\GreenTools\Notepad--\notepad--.exe	;呼出Notpad--
			else Run,notepad.exe ;系统自带notepad.exe
		}
	return

	$!b::	;呼出Bandicam
		IfExist, %RunCaptX%\GreenTools\SCapture\Bandicam\Bandicam.exe
		Run,%RunCaptX%\GreenTools\SCapture\Bandicam\Bandicam.exe
	return
;****************************************************
	$!w::	;explorer->TC,并开启半屏显示
		if(COMMANDER_EXE="")
			return
		selected := Explorer_Get("",true)

		;如果没有选中文件，那就直接用当前目录
		if(selected = "")
		{
			WinGetText, CurWinAllText
			loop, Parse, CurWinAllText, `n, `r
			{
				if RegExMatch(A_LoopField, "^地址: "){
					curWinPath := SubStr(A_LoopField,5)
					break
				}
			}
			selected := curWinPath
		}

		selected := """" selected """"
		;msgbox % selected
		;WinClose A  ;把当前资源管理器关闭
		Run, %COMMANDER_EXE% /T /O /S /A /L=%selected%
		WinActivate, ahk_class TTOTAL_CMD
		WinWait, ahk_class TTOTAL_CMD
		WinMove, ahk_class TTOTAL_CMD, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	return
}
#If
;****************************************************
;Win10_11桌面|Win7
#If WinActive("ahk_class Progman") or WinActive("ahk_class WorkerW")
{
	; $!q::SendInput,!q	;Runany_启动管理

	CapsLock & w:: ;启动激活微信|微信文件传输助手
		IfWinNotExist,ahk_exe WeChat.exe
		{
			gosub,RunWechat	;启动激活微信
			WinActivate, ahk_exe WeChat.exe
			WinWait, ahk_exe WeChat.exe
		}
		else {
			SendInput,^!w	;激活微信,20231216
			; Sleep,100
			; gosub,微信文件传输助手
		}
	return

	$!e::SendInput,#e	;打开系统资管
	; $!e::Run,%COMMANDER_PATH%\Tools\AutoHotkey\SciTE\SciTE.exe

	$!r::SendInput,{F2}	;重命名

	$!t::	;呼出任务管理器窗口|tagLyst主窗口
		if WinExist("ahk_exe tagLyst.exe")
		{
			SendInput,^#t	;呼出/隐藏tagLyst主窗口
			WinActivate, tagLyst ahk_class Chrome_WidgetWin_1
			WinWait, tagLyst ahk_class Chrome_WidgetWin_1
			WinMove, tagLyst ahk_class Chrome_WidgetWin_1, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
		}
		else {
			SendInput,^+{Esc}	;呼出任务管理器窗口
		}
	return
;****************************************************
	; $!a::gosub,Sub_AnytextSelectTxt	;微信截图|一键Anytext搜索|Listray_智能命令

	; $!s::Run,%COMMANDER_PATH%\Tools\AutoHotkey\WindowSpy.exe	;预留给Ra搜索

	$!d::SendInput,#d	;呼出/隐藏桌面

	$!f::gosub,TextToEverything	;一键everything搜索

	;$!g::SendInput,!g	;呼出Ra插件管理
;****************************************************
	; $!z::	;预留|=^Z,撤销

	; $!x::	;预留|一键Anytext搜索

	$!c::gosub,DbRButtonGoExplorer	;桌面双击右键,打开资管左侧半屏显示
		; if (WinExist("ahk_exe Loom.exe") or WinExist("ahk_exe uTools.exe"))
		; {
			; SendInput,!c	;呼出Loom|Utools_OCR_识别复制
		; }
		; else {	;开启左侧半屏显示
			; gosub,DbRButtonGoExplorer	;桌面双击右键,打开资管左侧半屏显示
		; }
	; return

	$!v::
		if WinExist("ahk_exe QuickJump.exe")
		{
			SendInput,^d	;QuickJump,^d,弹出菜单列表
		}
		else {	;打开编辑器
			IfExist, D:\Program Files\Microsoft VS Code\Code.exe
				Run,"D:\Program Files\Microsoft VS Code\Code.exe"	;呼出Code.exe
			else IfExist,%RunCaptX%\GreenTools\Notepad--\notepad--.exe
				Run,%RunCaptX%\GreenTools\Notepad--\notepad--.exe	;呼出Notpad--
			else Run,notepad.exe ;系统自带notepad.exe
		}
	return

	$!b::	;呼出Bandicam
		IfExist, %RunCaptX%\GreenTools\SCapture\Bandicam\Bandicam.exe
		Run,%RunCaptX%\GreenTools\SCapture\Bandicam\Bandicam.exe
	return
;****************************************************
	$!w:: ;explorer->TC,并开启半屏显示
		if(COMMANDER_EXE="")
			return
		selected := Explorer_Get("",true)
		if(selected = ""){
		selected := """" A_Desktop """"
			Run, %COMMANDER_EXE% /T /O /A /S /L=%selected%
			WinActivate, ahk_class TTOTAL_CMD
			WinWait, ahk_class TTOTAL_CMD
			WinMove, ahk_class TTOTAL_CMD, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
			Sleep 200
			selected := """" A_DesktopCommon """"
			Run, %COMMANDER_EXE% /T /O /A /S /R=%selected%
			WinActivate, ahk_class TTOTAL_CMD
			WinWait, ahk_class TTOTAL_CMD
			WinMove, ahk_class TTOTAL_CMD, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
		}
		else {
			selected := """" selected """"
			Run, %COMMANDER_EXE% /T /O /S /A /L=%selected%
			WinActivate, ahk_class TTOTAL_CMD
			WinWait, ahk_class TTOTAL_CMD
			WinMove, ahk_class TTOTAL_CMD, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
		}
	return

	;桌面双击右键,打开资管左侧半屏显示
	$RButton::	;20240108
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "gosub,DbRButtonGoExplorer" ;资管左侧半屏显示
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return
}
#If
;****************************************************
;用到的跳转标签,桌面双击右键,打开资管左侧半屏显示
DbRButtonGoExplorer:
if (WinExist("ahk_exe Loom.exe") or WinExist("ahk_exe uTools.exe")){
	SendInput,!c	;呼出Loom|Utools_OCR_识别复制
}
else {	;开启左侧半屏显示
	BlockInput On
	SendInput,#e
	Sleep,1000
	SendInput,^#!2	;开启左侧半屏显示,需要Gridmove支持
	BlockInput Off
}
return

;用到的跳转标签,任务栏双击右键,显示桌面,
DbRButtonGoDesktop:
if (WinExist("ahk_exe Loom.exe") or WinExist("ahk_exe uTools.exe")){
	SendInput,!c	;呼出Loom|Utools_OCR_识别复制
}
else {	;开启左侧半屏显示
	BlockInput On
	SendInput,#d
	Sleep,1000
	BlockInput Off
}
return
;****************************************************
;用到的函数
Explorer_GetPath(hwnd="")
{
	if !(window := Explorer_GetWindow(hwnd))
		return ErrorLevel := "ERROR"
	if (window="desktop")
		return A_Desktop
		path := window.LocationURL
		path := RegExReplace(path, "ftp://.*@","ftp://")
		StringReplace, path, path, file:///
		StringReplace, path, path, /, \, All
		loop
		if RegExMatch(path, "i)(?<=%)[\da-f]{1,2}", hex)
			StringReplace, path, path, `%%hex%, % Chr("0x" . hex), All
		else break
		return path
}

Explorer_GetWindow(hwnd="")
{
	WinGet, Process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")
	WinGetClass class, ahk_id %hwnd%

	if (Process!="explorer.exe")
		return
	if (class ~= "(Cabinet|Explore)WClass")
	{
		try {
			for window in ComObjCreate("Shell.Application").Windows
			if (window.hwnd==hwnd)
			return window
		}
		catch {
			return ""
		}
	}
	else if (class ~= "Progman|WorkerW")
	return "desktop"
}

Explorer_Get(hwnd="",selection=false)
{
	if !(window := Explorer_GetWindow(hwnd))
		return ErrorLevel := "ERROR"
	if (window="desktop")
	{
		ControlGet, hwWindow, HWND,, SysListView321, ahk_class Progman
		if !hwWindow
			ControlGet, hwWindow, HWND,, SysListView321, A
			ControlGet, Files, List, % ( selection ? "Selected":"") "Col1",,ahk_id %hwWindow%
			base := SubStr(A_Desktop,0,1)=="\" ? SubStr(A_Desktop,1,-1) : A_Desktop
		loop, Parse, Files, `n, `r
		{
			path := base "\" A_LoopField
			IfExist %path%
			ret .= path "`n"
		}
	}
	else
	{
		if selection
			collection := window.document.SelectedItems
		else
			collection := window.document.Folder.Items
		for item in collection
			ret .= item.path "`n"
	}
return Trim(ret,"`n")
}
;**************** TTOTAL_CMD $ ****************


;QQ,Tim中快速定位聊天位置   {{{2
;Tim
;QQTimFPath := % "E:\Users\Tuutg\Personal\Tencent Files\XXXXXXXXX\FileRecv\"
#If WinActive("ahk_class TXGuiFoundation") or WinActive("ahk_exe Tim.exe")
{
	!1::CoordWinClick(Tim_Start_X, Tim_Start_Y+(1-1)*Tim_Bar_Height)
	!2::CoordWinClick(Tim_Start_X, Tim_Start_Y+(2-1)*Tim_Bar_Height)
	!3::CoordWinClick(Tim_Start_X, Tim_Start_Y+(3-1)*Tim_Bar_Height)
	!4::CoordWinClick(Tim_Start_X, Tim_Start_Y+(4-1)*Tim_Bar_Height)
	!5::CoordWinClick(Tim_Start_X, Tim_Start_Y+(5-1)*Tim_Bar_Height)
	!6::CoordWinClick(Tim_Start_X, Tim_Start_Y+(6-1)*Tim_Bar_Height)
	!7::CoordWinClick(Tim_Start_X, Tim_Start_Y+(7-1)*Tim_Bar_Height)
	!8::CoordWinClick(Tim_Start_X, Tim_Start_Y+(8-1)*Tim_Bar_Height)
	!9::CoordWinClick(Tim_Start_X, Tim_Start_Y+(9-1)*Tim_Bar_Height)
	!0::CoordWinClick(Tim_Start_X, Tim_Start_Y+(10-1)*Tim_Bar_Height)
	!-::CoordWinClick(Tim_Start_X, Tim_Start_Y+(11-1)*Tim_Bar_Height)
	!=::CoordWinClick(Tim_Start_X, Tim_Start_Y+(12-1)*Tim_Bar_Height)

	$!w::
	$!f::
		;这里改成自己对应的路径
		Run,"%COMMANDER_EXE%" /T /O /S /R="%QQTimFPath%"
		Sleep 500
		MyWinWaitActive("ahk_class TTOTAL_CMD")
	return

	$RButton::	;20240108
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,!{F4}"	;{Escape}
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return

	$Space::SendInput,{Blind}{Space}	;恢复{Space}.20240108

	Escape::SendInput,!{F4}	;{Escape}
}
#If
;****************************************************
;QQ
#If WinActive("ahk_class TXGuiFoundation") or WinActive("ahk_exe QQ.exe")
{
	!1::CoordWinClick(QQ_Start_X, QQ_Start_Y+(1-1)*QQ_Bar_Height)
	!2::CoordWinClick(QQ_Start_X, QQ_Start_Y+(2-1)*QQ_Bar_Height)
	!3::CoordWinClick(QQ_Start_X, QQ_Start_Y+(3-1)*QQ_Bar_Height)
	!4::CoordWinClick(QQ_Start_X, QQ_Start_Y+(4-1)*QQ_Bar_Height)
	!5::CoordWinClick(QQ_Start_X, QQ_Start_Y+(5-1)*QQ_Bar_Height)
	!6::CoordWinClick(QQ_Start_X, QQ_Start_Y+(6-1)*QQ_Bar_Height)
	!7::CoordWinClick(QQ_Start_X, QQ_Start_Y+(7-1)*QQ_Bar_Height)
	!8::CoordWinClick(QQ_Start_X, QQ_Start_Y+(8-1)*QQ_Bar_Height)
	!9::CoordWinClick(QQ_Start_X, QQ_Start_Y+(9-1)*QQ_Bar_Height)
	!0::CoordWinClick(QQ_Start_X, QQ_Start_Y+(10-1)*QQ_Bar_Height)
	!-::CoordWinClick(QQ_Start_X, QQ_Start_Y+(11-1)*QQ_Bar_Height)
	!=::CoordWinClick(QQ_Start_X, QQ_Start_Y+(12-1)*QQ_Bar_Height)

	$!w::
	$!f::
		;这里改成自己对应的路径
		Run,"%COMMANDER_EXE%" /T /O /S /R="%QQTimFPath%"
		Sleep 500
		MyWinWaitActive("ahk_class TTOTAL_CMD")
	return

	$RButton::	;20240108
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,!{F4}"	;{Escape}
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return

	$Space::SendInput,{Blind}{Space}	;恢复{Space}.20240108

	Escape::SendInput,!{F4}	;{Escape}
}
#If
;****************************************************
;****************************************************
;微信PC客户端全局 {{{2	;20240305
#If WinActive("ahk_exe WeChat.exe")
{
	;恢复~Space,打字和用于热字符串终止键.20240315
	~$Space::SendInput,{Blind}{Space}{BackSpace}
	~$Tab::SendInput,{Blind}{Tab}{BackSpace}

	;双击右键关闭
	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,!{F4}"	;{Escape}.20240105
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return

	;修复Caps+X|C,复制|剪切时,单按CapsLock退出微信
	CapsLock::
		Suspend Permit
		GV_MouseTimer := 400
		GV_KeyClickAction1 := ""
		GV_KeyClickAction2 := "SendInput,!{F4}"	;{Escape}.20240105
		gosub,Sub_KeyClick123
	return

	; CapsLock & w::gosub,微信文件传输助手

	Escape::SendInput,!{F4}	;{Escape}
}
#If

;修复微信中在打开|保持等弹出对话框时按caps|+W弹出文件助手的问题,更改为caps|+W=Enter
#If (WinActive("ahk_exe WeChat.exe") and !WinActive("ahk_group GroupDiagOpenAndSave"))
{
	CapsLock & w::gosub,微信文件传输助手
}
#If

;****************************************************

; SingleSpace增强模式,Spk+EDSF=上下左右,约等于Ctrl,启用1
#If (WinActive("ahk_exe WeChat.exe") and (GV_SpaceKeysAsCapsLock==1))
Space & q::
	GV_KeyClickAction1 := "SendInput,{Home}"
	GV_KeyClickAction2 := "SendInput,^{Home}"
	gosub,Sub_KeyClick123
return

Space & w::	;输入^|&键
	GV_KeyClickAction1 := "SendInput,^s"  ;单击保存
	GV_KeyClickAction2 := "SendInput,{Text}&"
	gosub,Sub_KeyClick123
return

Space & e::	;{Up}|输入_键
	GV_KeyClickAction1 := "SendInput,{Up}"
	GV_KeyClickAction2 := "SendInput,{Text}_"
	gosub,Sub_KeyClick123
return

Space & r::	;输入{del}|-键
	GV_KeyClickAction1 := "SendInput,{del}"
	GV_KeyClickAction2 := "SendInput,{Text}+"
	gosub,Sub_KeyClick123
return

Space & t::		;输入{Backspace}|%键
	GV_KeyClickAction1 := "SendInput,{Backspace}"
	GV_KeyClickAction2 := "SendInput,`|"
	gosub,Sub_KeyClick123
return

;***********************************************

Space & a::
	GV_KeyClickAction1 := "SendInput,{End}"
	GV_KeyClickAction2 := "SendInput,^{End}"
	gosub,Sub_KeyClick123
return

Space & s::	;输入/(数字/)
	GV_KeyClickAction1 := "SendInput,{Left}" ;{?/}
	GV_KeyClickAction2 := "SendInput,`/"
	gosub,Sub_KeyClick123
return

Space & d::	;单击{Left},双击输入逗(D)号
	GV_KeyClickAction1 := "SendInput,{Down}"
	GV_KeyClickAction2 := "SendInput,`,"
	gosub,Sub_KeyClick123
return

Space & f::	;单击{Right},双击输入分号(F);键
	GV_KeyClickAction1 := "SendInput,{Right}"
	GV_KeyClickAction2 := "SendInput,`;" ;分号
	gosub,Sub_KeyClick123
return

Space & g:: ;输入句号(g).键
	GV_KeyClickAction1 := "SendInput,{Enter}"
	GV_KeyClickAction2 := "SendInput,`."
	gosub,Sub_KeyClick123
return

;***********************************************

Space & z::
	GV_KeyClickAction1 := "gosub,Space_SgZ" ;输入""键
	GV_KeyClickAction2 := "SendInput,`'" 	;',单引号
	gosub,Sub_KeyClick123
return

Space & x::
	GV_KeyClickAction1 := "gosub,Space_SgX"	;剪切
	GV_KeyClickAction2 := "gosub,Space_DbX" ;{}|]
	gosub,Sub_KeyClick123
return

Space & c::
	GV_KeyClickAction1 := "gosub,Space_SgC" ;复制
	GV_KeyClickAction2 := "gosub,Space_DbC" ;()|'>,Listary->cmd命令行
	gosub,Sub_KeyClick123
return

Space & v::
	GV_KeyClickAction1 := "SendInput,^v" ;粘贴
	GV_KeyClickAction2 := "gosub,Space_DbV" ;{}|]
	gosub,Sub_KeyClick123
return

Space & b::	;鼠标右(Y)键单击|输入单冒号:
	GV_KeyClickAction1 := "SendInput,{Click,Right}" ;鼠标右(Y)键单击
	GV_KeyClickAction2 := "SendInput,`:"   ;单冒号:
	gosub,Sub_KeyClick123
return

Space & F1:: SendInput,{F10} ;相加=11
Space & F2:: SendInput,{F9} ;相加=11
Space & F3:: SendInput,{F8} ;相加=11
Space & F4:: SendInput,{F7} ;相加=11
Space & F5:: SendInput,{F6} ;相加=11
#If
;****************************************************
;微信PC客户端聊天主窗口
#IfWinActive 微信 ahk_class WeChatMainWndForPC
{
	;聚焦搜索框
	!s::CoordWinClick(100,36)
	!/::CoordWinClick(100,36)

	;点击绿色聊天的数字,未读新消息
	!,::
		CoordMode, Mouse, Window
		Click 28,90 2
		Sleep,100
		Click 180,100
	return

	;聚焦打字框
	!`;::
		WinGetPos, wxx, wxy,wxw,wxh, ahk_class WeChatMainWndForPC
		wxw := wxw - 80
		wxh := wxh - 60
		CoordWinClick(wxw,wxh)
	return

	;点击联系人
	!1::CoordWinClick(WX_Start_X, WX_Start_Y+(1-1)*WX_Bar_Height)
	!2::CoordWinClick(WX_Start_X, WX_Start_Y+(2-1)*WX_Bar_Height)
	!3::CoordWinClick(WX_Start_X, WX_Start_Y+(3-1)*WX_Bar_Height)
	!4::CoordWinClick(WX_Start_X, WX_Start_Y+(4-1)*WX_Bar_Height)
	!5::CoordWinClick(WX_Start_X, WX_Start_Y+(5-1)*WX_Bar_Height)
	!6::CoordWinClick(WX_Start_X, WX_Start_Y+(6-1)*WX_Bar_Height)
	!7::CoordWinClick(WX_Start_X, WX_Start_Y+(7-1)*WX_Bar_Height)
	!8::CoordWinClick(WX_Start_X, WX_Start_Y+(8-1)*WX_Bar_Height)
	!9::CoordWinClick(WX_Start_X, WX_Start_Y+(9-1)*WX_Bar_Height)
	!0::CoordWinClick(WX_Start_X, WX_Start_Y+(10-1)*WX_Bar_Height)

	;这里请修改everything中的书签，确保ev中书签名字保持一致
	!e::	;20240130
		; Run, "%COMMANDER_PATH%\everything.exe" -bookmark wechatfile
		IfExist,C:\Windows\SysWOW64\
			Run,"%RunCaptX%\Everything\Everything.exe" -bookmark wechatfile
		else
			Run,"%RunCaptX%\Everything\Everything-x86\Everything.exe" -bookmark wechatfile
	return
	;这里请修改tc中搜索条件的目录位置, 改成自己的 E:\Users\Tuutg\Personal\WeChat Files\wxid_7886778867612\FileStorage\File\

	;将tc中默认D:\My Documents\WeChat files\xxx(自己用户名)\FileStorage\MsgAttach改成自己的MsgAttac所在目录全路径
	$!w::
	$!f::
		;Wx_Path = % "E:\Users\Tuutg\Personal\WeChat Files\wxid_7886778867612\FileStorage\File\" . fun_GetFormatTime( "yyyy-MM" )
		;Run,"%COMMANDER_EXE%" /T /O /S /R="%wx_path%"
		;Sleep 500
		;MyWinWaitActive("ahk_class TTOTAL_CMD")
		Run,"%COMMANDER_EXE%" /T /O /S /R=
		MyWinWaitActive("ahk_class TTOTAL_CMD")
		Sleep,100
		;MyWinWaitActive("ahk_class TTOTAL_CMD")
		TcSendUserCommand("em_loadSearchWechatFile")
		Sleep,500
		SendInput,!s
		Sleep,2000
		SendInput,!l
	return

	;点右键选删除
	!d::
		;SendInput,{RButton}
		SendInput,{Click,Right}
		Sleep,200
		SendInput,{Up 2}{Enter}
		Sleep,500
		SendInput,{Enter}
	return

	;点右键选撤回
	!z::
		SendInput,{RButton}
		Sleep,100
		SendInput,{Down 2}{Enter}
	return

	;点右键一键复制
	!c::
		SendInput,{Click,Right}
		Sleep 100
		SendInput,{Up 1}{Enter}
		WinGetPos, wxx, wxy,wxw,wxh, ahk_class WeChatMainWndForPC
		wxw := wxw - 80
		wxh := wxh - 60
		CoordWinClick(wxw,wxh)
	return

	;(图片)点右键另存为|在文件夹中显示
	$MButton::
		SendInput,{Click,Right}
		Sleep 100
		SendInput,{Up 3}{Enter}
	return

	;(文件)点右键另存为|在文件夹中显示
	$+MButton::
		SendInput,{Click,Right}
		Sleep 100
		SendInput,{Up 4}{Enter}
	return

	;点右键一键转发,适用图片/视频/文字 | 点右键一键收藏,适用非图片文件
	!v::
	$!LButton::
		SendInput,{Click,Right}
		Sleep 100
		SendInput,{Down 3}{Enter}
	return

	;点右键一键转发,适用非图片文件 | 点右键一键复制,适用图片/视频
	!b::
	$!MButton::
		SendInput,{Click,Right}
		Sleep 100
		SendInput,{Down 2}{Enter}
	return

	;...聊天信息
	CapsLock & f::
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA-18,35)
	return

	;...聊天记录
	CapsLock & s::
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA-18,35)
		Sleep,100
		WinActivate ahk_class SessionChatRoomDetailWnd
		Sleep,500
		Click,130,130
	return
}
#IfWinActive
;****************************************************
;一键文件传输助手
微信文件传输助手:
	SendInput, ^f	;定位搜索框
	Sleep,50
	SendInput, ^a	;选中搜索框
	Sleep,50
	SendInput, {Del}  ;清空搜索框
	Sleep,50
	SendInput, {text}文件传输助手 ;AutoInput("文件传输助手")
	Sleep,600 ;等待出现文件传输助手,不要改动
	SendInput, {Shift}{Enter}
	Click, 170,100
return
;****************************************************
;微信图片查看器
;#If WinActive("图片查看 ahk_exe WeChat.exe")
#If WinActive("图片查看 ahk_class ImagePreviewWnd") or WinActive("微信 ahk_class ImagePreviewLayerWnd")
{
	XButton1::SendInput,{Right}
	XButton2::SendInput,{Left}
	$!WheelUp::SendInput,{Left}
	$!WheelDown::SendInput,{Right}
	Space & WheelUp::SendInput,{Left}
	Space & WheelDown::SendInput,{Right}

	$h::SendInput,{Left}
	$l::SendInput,{Right}
	$k::Click, 121, 16 	 ;+/放大
	$j::Click, 154, 16 	 ;-/缩小

	$`;::SendInput,{Esc}           ;分号=Esc

	~$Enter::
	$MButton::
	CapsLock & g::gosub,Sub_MaxRestore ;最大化

	;对视频内容点击播放
	$Space::
		WinGetPos, x, y,lengthA,hightA, A
		;MouseMove, % lengthA/2 ,hightA/2
		CoordWinClick(lengthA/2,hightA/2)
	return

	$q::Click, 80, 16 	 ;预览
	$w::Click, 340, 16 	 ;OCR/提取文字
	$e::Click, 121, 16 	 ;+/放大
	$r::Click, 233, 16 	 ;旋转
	$t::Click, 305, 16 	 ;翻译

	$a::Click, 373, 16 ;另存
	$s::SendInput,{Left} ;<--
	$d::Click, 154, 16 	 ;-/缩小
	$f::SendInput,{Right} ;-->
	$g::Click, 189, 16 	 ;1:1=左键双击

	$z::				 	 ;收藏
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Up 3}{Enter}
	return

	$x::SendInput,{Esc} ;Esc

	$c::				 ;复制
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 1}{Enter}
	return

	$v::				;转发
	$!v::
	$!LButton::
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 4}{Enter}
	return

	$b::Click, 265, 18 ;编辑
}
#If
;****************************************************
;微信图片编辑器,在非全屏模式下,相对坐标法,以马赛克为中心.20240105
#If WinActive("图片编辑 ahk_class EditPicWnd") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
	XButton1::WheelUp		;+/放大
	XButton2::WheelDown		;-/缩小

	$h::WheelUp		;+/放大
	$j::WheelUp		;+/放大
	$k::WheelDown	;-/缩小
	$L::WheelDown	;-/缩小

	$e::WheelUp		;+/放大
	$d::WheelDown	;-/缩小
	$s::SendInput,{Blind]^z ;撤销
	$f::SendInput,{Blind]^y ;恢复

	$MButton::
		SendInput,{Click}
		Sleep,100
		gosub,Sub_MaxRestore ;最大化
	return

	$q::	;(铅)画笔
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-40*1,hightA+20)
	return

	$w::	;箭头
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-40*2,hightA+20)
	return

	; $e::WheelUp		;+/放大

	$r::	;矩形|方框
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-42.5*5,hightA+20)
	return

	$t::	;文字
	$!t::
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+45*1,hightA+20)
	return


	$a::	;另存为
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+39.5*6,hightA+20)
	return

	; $s::SendInput,{Blind]^z ;撤销

	; $d::WheelDown	;-/缩小

	; $f::SendInput,{Blind]^y ;恢复

	$g::	;裁剪
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+44.5*2,hightA+20)
	return


	$z::	;马赛克
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+40*0,hightA+20)
	return

	$x::	;马赛克
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+40*0,hightA+20)
	return

	$c::	;椭圆
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-42.5*4,hightA+20)
	return

	$v::	;转发
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+39*5,hightA+20)
	return

	$b::	;表情
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-42*3,hightA+20)
	return

	~$Enter::
	CapsLock & g::	;SendInput,{Enter}	;打钩
		WinGetPos, x, y,lengthA,hight
		CoordWinClick(lengthA/2+41.5*8,hightA+20)
	return
#If
;****************************************************
;微信中的页面,增加单键模式
#If WinActive("ahk_group 微信中的页面") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
{
	d::SendInput,{PgDn}
	e::SendInput,{PgUp}
	s::SendInput,{Home}
	f::SendInput,{End}

	j::SendInput,{PgDn}
	k::SendInput,{PgUp}
	h::SendInput,{Home}
	l::SendInput,{End}

	u::SendInput,{End}
	i::SendInput,{Home}
	a::SendInput,{End}
	q::SendInput,{Home}

	$!e::	;右键>用默认浏览器打开
		WinGetPos, x, y,lengthA,hightA
		CoordWinClick(lengthA-118,26)
		SendInput,{Down 3}{Enter}
		CoordWinMove(lengthA/2,hightA)
	return
}
#IfWinActive
;****************************************************
;微信中转发的聊天记录
#If WinActive("ahk_class ChatRecordWnd") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
$MButton::	;点击发送
$Enter::
	CoordMode, Mouse, Window
	Click, 380 400 1
return
#IfWinActive
;****************************************************
;微信中转发文件窗口
#If WinActive("ahk_class SelectContactWnd") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
$MButton::
$Enter::gosub,点击发送A
#IfWinActive
;****************************************************
点击发送A:
	CoordMode, Mouse, Window
	Click, 380 400 1
return
;****************************************************
;从系统中拖动文件到微信窗口发送
#If WinActive("ahk_class DragAttachWnd") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
$MButton::
$Enter::gosub,点击发送B
#IfWinActive
;****************************************************
点击发送B:
	CoordMode, Mouse, Window
	Click, 100 250 1
return
;****************************************************
;设置标签 ahk_class StandardConfirmDialog
#If WinActive("ahk_class StandardConfirmDialog") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
$MButton::
$Enter::
	CoordMode, Mouse, Window
	Click, 235 195 1
return
#If
;****************************************************
;设置备注和标签 ahk_class WeUIDialog
#If WinActive("ahk_class WeUIDialog") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
$MButton::
$Enter::
	CoordMode, Mouse, Window
	Click, 125 505 1
return
#If
;****************************************************
;****************************************************
;QQ Tim中查看照片,在非全屏模式下,相对坐标法
#If WinActive("图片查看 ahk_class TXGuiFoundation") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
{
	XButton1::SendInput,{Left}
	XButton2::SendInput,{Right}
	$!WheelUp::SendInput,{Left}
	$!WheelDown::SendInput,{Right}

	$h::SendInput,{Left}
	$l::SendInput,{Right}
	$s::SendInput,{Left}
	$f::SendInput,{Right}

	`;::SendInput,!{F4} ;=esc,退出

	Space & WheelUp::SendInput,{Left}
	Space & WheelDown::SendInput,{Right}

	$q::	;(铅)画笔
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-48.5*6,hightA-35)
	return

	$w::	;文字
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-46*5,hightA-35)
	return

	$e::WheelUp		;+/放大

	$r::	;旋转
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+38*4,hightA-35)
	return

	$t::	;翻译
	$!t::
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-43.5*4,hightA-35)
	return
;****************************************************
	$a::	;另存为
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+41.5*7,hightA-35)
	return

	; $s::SendInput,{Left}

	$d::WheelDown	;-/缩小

	; $f::SendInput,{Right}

	$g::	;1:1
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+45*2,hightA-35)
	return
;****************************************************
	$z::	;定位聊天
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Up 2}{Enter}
	return

	$x::	;裁剪
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+41.5*6,hightA-35)
	return

	$c::	;右键>复制
		SendInput,{Click,Right}
	Sleep,100
	SendInput,{Down 1}{Enter}
	return

	$v::	;右键>转发
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 2}{Enter}
	return

	$b::	;编辑
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+40*5,hightA-35)
	return

	$MButton::gosub,Sub_MaxRestore ;最大化
	CapsLock & g::gosub,Sub_MaxRestore ;最大化
;****************************************************
;QQ Tim中查看照片编辑器,在非全屏模式下,相对坐标法,启用空格模式
	$^1::
	CapsLock & 1::
	Space & a::	;矩形/椭圆
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-48.5*6,hightA-35)
	return

	$^2::
	CapsLock & 2::
	Space & s::	;椭圆
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-48.5*5,hightA-35)
	return

	$^3::
	CapsLock & 3::
	Space & d:: ;标箭头
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-48.5*4,hightA-35)
	return

	$^4::
	CapsLock & 4::
	Space & f::	;铅画笔|记号笔
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-48.5*3,hightA-35)
	return

	$^5::
	CapsLock & 5::
	Space & g::	;马赛克
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-50*2,hightA-35)
	return
;****************************************************
	$^9::
	CapsLock & 9::
	Space & 2::
	Space & w::
	CapsLock & w::SendInput,^s			;保存 ctrl+S

	~$Enter::
	Space & e::	;完成
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+41.5*7,hightA-35)
	return

	Space & r::							;重做 ctrl+Y

	$^6::#
	CapsLock & 6::
	Space & 5::
	Space & t:: ;文字
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-55*1,hightA-35)
	return

	$^7::
	CapsLock & 7::
	Space & 4::
	Space & b:: ;标序号
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2-10,hightA-35)
	return

	$^8::
	CapsLock & 8::
	Space & 3::
	Space & z::SendInput,^z				;撤销 ctrl+z
	; CapsLock & z::SendInput,^z  		;撤销,Capstg默认

	$^0::
	CapsLock & 0::
	Space & 1::
	Space & v::	;发送到手机
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+48*3,hightA-35)
	return
;****************************************************
	Space & q::	;编辑|X退出编辑
	Space & x::	;编辑|X退出编辑
		WinGetPos, x, y,lengthA,hightA, A
		CoordWinClick(lengthA/2+49.7*4,hightA-35)
	return

	Space & c::SendInput,^c			;复制 ctrl+c
	$!c::SendInput,^+c				;复制纯文本ctrl+shift+c

	Space & y::						;重做 ctrl+Y
	$!+z::ControlSend,,^y			;重做,屏蔽火绒弹窗拦截冲突
}
#If
;****************************************************
;****************************************************
;F4menu中
#If WinActive("F4Menu ahk_class F4Menu")
{
	$Space::SendInput,{Enter}
}
#If
;****************************************************
;****************************************************
;telegram {{{2
#IfWinActive ahk_exe Telegram.exe
{
	!/::CoordWinClick(150,52)
	!1::CoordWinClick(TG_Start_X, TG_Start_Y+(1-1)*TG_Bar_Height)
	!2::CoordWinClick(TG_Start_X, TG_Start_Y+(2-1)*TG_Bar_Height)
	!3::CoordWinClick(TG_Start_X, TG_Start_Y+(3-1)*TG_Bar_Height)
	!4::CoordWinClick(TG_Start_X, TG_Start_Y+(4-1)*TG_Bar_Height)
	!5::CoordWinClick(TG_Start_X, TG_Start_Y+(5-1)*TG_Bar_Height)
	!6::CoordWinClick(TG_Start_X, TG_Start_Y+(6-1)*TG_Bar_Height)
	!7::CoordWinClick(TG_Start_X, TG_Start_Y+(7-1)*TG_Bar_Height)
	!8::CoordWinClick(TG_Start_X, TG_Start_Y+(8-1)*TG_Bar_Height)
	!9::CoordWinClick(TG_Start_X, TG_Start_Y+(9-1)*TG_Bar_Height)
	!0::CoordWinClick(TG_Start_X, TG_Start_Y+(10-1)*TG_Bar_Height)

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,!{F4}"	;{Escape}
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return
}
#IfWinActive
;****************************************************
;****************************************************
;IDM的下载对话框中，提取url链接，然后用MPC播放 {{{2
#IfWinActive 下载文件信息 ahk_class #32770 ahk_exe IDMan.exe
;单击右键,双击右键下载 , 右键长按Idm2Mpv(Mpv播放)
$RButton::
{
	GV_MouseTimer := 400
	GV_KeyClickAction1 := "RButton"	;RButton
	GV_KeyClickAction2 := "SendInput,!ss"	;点击下载
	GV_MouseButton := 2
	GV_LongClickAction := "gosub,Idm2Mpv"
	gosub,Sub_MouseClick123
return
}

$!v::gosub,Idm2Mpv
Idm2Mpv:
{
	ControlGetText,Out,Edit1
	WinClose A
	;Run,%COMMANDER_PATH%\Tools\MPC\mpc.exe "%Out%"
	Run,%COMMANDER_PATH%\Plugins\WLX\vlister\mpv.exe "%Out%"
return
}

$!w::	;点{Enter}/保存->Listary跳转目标路径->开始下载
CapsLock & w::	;ahk_group GroupDiagOpenAndSave,已经定义,20231229
{
	if (GV_KeyClick_Continuous(300)){
	SendInput,+{Enter} ;IDM直接下载保存
	}
	else {
		CoordMode, Mouse, Window
		Click, 453,100
		Sleep,500
		SendInput,^g			;QuickJump或Listary跳转转目标路径
		Sleep,100
		; ControlClick,Button1	;单击保存,开始下载
	}
}
return

;点{Enter}/保存>自动复制文件名>搜索本地目录>跳转>粘贴文件名+补扩展名
$!f::	;ahk_group GroupDiagOpenAndSave,已经定义,,20231229
$!d::
$MButton::	;2023/12/15 00:40
{
	WinActivate,下载文件信息 ahk_class #32770 ahk_exe IDMan.exe
	;1.提取处理文件名和扩展名
	ControlGetText,Out1,Edit4,下载文件信息 ahk_class #32770 ;全文件名
	; 使用正则表达式提取文件名和扩展名
	Longfilename := RegExReplace(Out1, ".*\\([^\\]*\\)\\..*", "$1")
	; 使用正则表达式提取扩展名
	extension := GetFileInfo(Longfilename,4)
	; EzTip(extension,1)
	; 使用正则表达式去掉路径部分,去掉路径部分扩展名
	ShortFilename := RegExReplace(Longfilename, "^.*\\", "")
	ShortFilename := RegExReplace(ShortFilename, "\[www.ghxi.com\]", "")
	ClipBoard = %ShortFilename%
	EzTip(ShortFilename,1)
	; ListaryQuery := RegExReplace(ShortFilename, "\.([^.]*)$", "") ;去掉扩展名
	; 使用正则表达式将文件名中的所有数字、减号、下划线替换为空
	ListaryQuery := RegExReplace(ShortFilename, "[0-9]", "")
	ListaryQuery := RegExReplace(ListaryQuery, "_v", "")
	ListaryQuery := RegExReplace(ListaryQuery, "-v", "")
	ListaryQuery := RegExReplace(ListaryQuery, "_mod", "")
	ListaryQuery := RegExReplace(ListaryQuery, "-mod", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Setup", "")
	ListaryQuery := RegExReplace(ListaryQuery, "bit", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Portable", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Green", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Single", "")
	ListaryQuery := RegExReplace(ListaryQuery, "[\\-\\.\\_\\(\\)]", " ")
	; EzTip(ListaryQuery,1)
	Sleep,100

	;2.点击...(浏览)->Listary跳转目标路径->粘贴文件名
	CoordMode, Mouse, Window
	Click, 453,100	;点击...(浏览)
	Sleep,100
	; SendInput,^a	;全选(Quicker方法)
	; SendInput,#!s	;Listary复制粘贴文件名(Quicker设定)
	SendInput,^g	;QuickJump或Listary跳转转目标路径
	Sleep,1000	;延时等待,另存为窗口打开
	SendInput,{Blind}^v	;粘贴文件名

	;3.激活Listary搜索框->输入搜索词->定位到下载目录
	gosub,Listary	;按2次Ctrl,激活Listary搜索框
	Sleep,100
	SendInput,{Text}%ListaryQuery%	;输入搜索词
	Sleep,1000	;延时等待,搜索词匹配目标对象
	; SendInput,{Right}	;适配Listary5
	; Sleep,1000 ;延时等待,搜索词匹配目标对象
	SendInput,{Blind}^{Enter}	;适用Listary5.0|6.0版本,定位到下载目录
	Sleep,1000

	;4.粘贴文件名->鼠标移动到保存按钮->开始下载
	WinActivate,另存为 ahk_class #32770 ahk_exe IDMan.exe
	SetControlDelay -1
	ControlFocus,Edit1,另存为 ahk_class #32770 ahk_exe IDMan.exe
	ControlSend,Edit1,{Del},另存为 ahk_class #32770 ahk_exe IDMan.exe
	Sleep,1000	;延时等待,清空不正确的文件名
	SendInput,{Blind}^v	;粘贴文件名
	Sleep,100
	WinGetPos,x,y,lengthA,hightA,另存为 ahk_class #32770 ahk_exe IDMan.exe
	Sleep,100
	CoordWinMove(lengthA-170,hightA-35) ;保存按钮
}
return
#IfWinActive

;IDM的下载完成对话框中，提取文件信息，然后跳转到tc
#If WinActive("下载完成 ahk_class #32770 ahk_exe IDMan.exe")
{
$!w::
$!f::
$MButton::
$RButton::
	ControlGetText,Out,Edit4
	WinClose A
	Run,"%COMMANDER_EXE%" /A /T /O /S /R="%Out%"
	Sleep 500
	MyWinWaitActive("ahk_class TTOTAL_CMD")
return
}
#If

;IDM主界面,双击中键,打开目录.提前是设置双击打开属性
#If WinActive("Internet Download Manager ahk_class #32770 ahk_exe IDMan.exe")
{
$!f:: ; 修改成自己的下载目录
	Run,"%COMMANDER_EXE%" /T /O /S /R="G:\TDownload\360Download\IDM\"
	Sleep 500
	MyWinWaitActive("ahk_class TTOTAL_CMD")
return

$!w::
MButton::
	SendInput,{Click 2}
return

$F2::
	SendInput,{Click,Right}
	Sleep,100
	SendInput,{Down 4}{Enter}
return
}
#If

;IDM主界面>中键>文件属性对话框中，提取文件信息，然后跳转到tc
#If WinActive("文件属性 ahk_class #32770 ahk_exe IDMan.exe")
{
$!w::
$!f::
MButton::
	ControlGetText,Out,Edit1
	WinClose A
	Run,"%COMMANDER_EXE%" /A /T /O /S /R="%Out%"
	Sleep 500
	MyWinWaitActive("ahk_class TTOTAL_CMD")
return
}
#If

;IDM文件属性对话框中,全选=全选+复制
#If WinActive("ahk_Group Group_ableCtrlAC")
$!a::
$^a::
	SendInput,{Home}+{End}	;全选
	; SendInput,^a	;全选
	Sleep 100
	SendInput,^c	;复制
return
#If
;****************************************************
;****************************************************
;360X浏览器的下载对话框中，提取url链接，文件名 {{{2
#IfWinActive 建下载任务 ahk_class Chrome_WidgetWin_2
$RButton::
	GV_MouseTimer := 400
	GV_KeyClickAction1 := "RButton"	;RButton
	GV_KeyClickAction2 := "SendInput,{Click,390, 250}"	;点击下载
	GV_MouseButton := 2
	GV_LongClickAction := "SendInput,{Click,390, 250}"	;点击下载
	gosub,Sub_MouseClick123
return

;点{Enter}/保存>自动复制文件名>搜索本地目录>跳转>粘贴文件名+补扩展名
$!f::	;ahk_group GroupDiagOpenAndSave,已经定义,,20231229
$!d::
$MButton::	;2023/12/15 00:40
{
	WinActivate,建下载任务 ahk_class Chrome_WidgetWin_2
	;1.提取处理文件名
	ShortFilename := ClipBoard
	ShortFilename := RegExReplace(ShortFilename, "\[www.ghxi.com\]", "")
	EzTip(ShortFilename,1)
	; 使用正则表达式将文件名中的所有数字、减号、下划线替换为空
	ListaryQuery := RegExReplace(ShortFilename, "[0-9]", "")
	ListaryQuery := RegExReplace(ListaryQuery, "_v", "")
	ListaryQuery := RegExReplace(ListaryQuery, "-v", "")
	ListaryQuery := RegExReplace(ListaryQuery, "_mod", "")
	ListaryQuery := RegExReplace(ListaryQuery, "-mod", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Setup", "")
	ListaryQuery := RegExReplace(ListaryQuery, "bit", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Portable", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Green", "")
	ListaryQuery := RegExReplace(ListaryQuery, "Single", "")
	ListaryQuery := RegExReplace(ListaryQuery, "[\\-\\.\\_\\(\\)]", " ")
	; EzTip(ListaryQuery,1)
	Sleep,100
	;2.点击...(浏览)->Listary跳转目标路径->粘贴文件名
	CoordMode, Mouse, Window
	Click, 475,170	;点击...(浏览)
	Sleep,100
	; SendInput,^a	;全选(Quicker方法)
	; SendInput,#!s	;Listary复制粘贴文件名(Quicker设定)
	SendInput,^g	;QuickJump或Listary跳转转目标路径
	Sleep,1000	;延时等待,另存为窗口打开
	SendInput,{Blind}^v	;粘贴文件名
	;3.激活Listary搜索框->输入搜索词->定位到下载目录
	gosub,Listary	;按2次Ctrl,激活Listary搜索框
	Sleep,100
	SendInput,{Text}%ListaryQuery%	;输入搜索词
	Sleep,1000	;延时等待,搜索词匹配目标对象
	; SendInput,{Right}	;适配Listary5
	; Sleep,1000 ;延时等待,搜索词匹配目标对象
	SendInput,{Blind}^{Enter}	;适用Listary5.0|6.0版本,定位到下载目录
	Sleep,1000
	;4.粘贴文件名->鼠标移动到保存按钮->开始下载
	WinActivate,下载 ahk_class #32770
	SetControlDelay -1
	ControlFocus,Edit1,下载 ahk_class #32770
	ControlSend,Edit1,{Del},下载 ahk_class #32770
	Sleep,1000	;延时等待,清空不正确的文件名
	SendInput,{Blind}^v	;粘贴文件名
	Sleep,100
	WinGetPos,x,y,lengthA,hightA,下载 ahk_class #32770
	Sleep,100
	CoordWinMove(lengthA-170,hightA-35) ;保存按钮
}
return
#IfWinActive

;360X浏览器的下载完成对话框中,点击第一个(浏览)->下载目标,20240314
#IfWinActive 下载 ahk_class Chrome_WidgetWin_2
$MButton::
	SetTitleMatchMode,3
	CoordMode, Mouse, Window
	Click, 615,70	;点击...(浏览)
return
;****************************************************
;****************************************************
;TC设定开始
TC_Focus_Edit(){
	if (A_Cursor = "IBeam" ){
		GV_Edit_Mode := 1
	} else if(A_Cursor = "Arrow" ) {
		GV_Edit_Mode := 0
	}
	ControlGetFocus theFocus, A
	return (InStr(theFocus , "Edit") or (GV_Edit_Mode = 1))
}

fun_TCselectFileByNum(n){
	if TC_Focus_Edit(){
		SendInput,%n%
	}
	else {
		;如果是0就获取总共几个
		if(n=0){
			;1000 to get active panel: 1=left, 2=right (32/64)
			tcLeftRight := fun_TcGet(1000)
			sMsg := % 1000 + tcLeftRight
			;1001/1002 to get number of items in left/right list (32/64)
			n := fun_TcGet(sMsg) - 1
		}
	ControlGetFocus, Ctrl, AHK_CLASS TTOTAL_CMD
	PostMessage, 0x19E, %n%, 1, %Ctrl%, AHK_CLASS TTOTAL_CMD
	SendInput,{Enter}
	}
}

;判断当前tc中是否正在显示着收藏夹菜单
fun_TcExistHotMenu(){
	Dlg_HWnd := WinExist("ahk_class #32768 ahk_exe TOTALCMD.EXE")
	return Dlg_HWnd
}

fun_TcGet(n)
{
	SendMessage,1074, %n%, 0, , Ahk_class TTOTAL_CMD
	return % ErrorLevel
}

ClickAndLongClick(timeout = 200) { ;
	tout := timeout/1000
	key := RegExReplace(A_ThisHotkey,"[\*\~\$\#\+\!\^]")
	loop {
		t := A_TickCount
		KeyWait %key%
		Pattern .= A_TickCount-t > timeout
		KeyWait %key%,DT%tout%
	if (ErrorLevel)
		return Pattern
	}
}
;0单击
;00双击
;01就短按+长按
;001就是双击+长按


Sub_TcSrcActivateLastTab:
	TcSendPos(5001)
	TcSendPos(3006)
return

;TC备注中快速星号评级
#IfWinActive 文件备注 ahk_class TCmtEditForm ahk_exe totalcmd.exe
{
	!0::
	!1::
	!2::
	!3::
	!4::
	!5::
		ControlFocus, TMyMemo1
		ControlGetText, preText, TMyMemo1
		cnt := SubStr(A_ThisHotkey,2)
		text := StrRepeat("★", cnt) . StrRepeat("☆", 5-cnt)
		if StrLen(preText) >0
		text .= "`r`n" preText
		ControlSetText, TMyMemo1, %text%
	return
}
#IfWinActive

StrRepeat(str, count){
	res =
	loop, % count{
	res .= str
	}
	return res
}


;Totalcmd中快搜
#IfWinActive QUICKSEARCH ahk_class TQUICKSEARCH
{
	;快搜输入框中不能直接数字，就用空格加数字，也可以先按caps取消输入框状态再单独按数字
	;眼睛适合辨认的也就前5
	Space & 1::
		SendInput,{Esc}
		 Sleep,100
		fun_TCselectFileByNum(1)
	return

	Space & 2::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(2)
	return

	Space & 3::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(3)
	return

	Space & 4::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(4)
	return

	Space & 5::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(5)
	return

	Space & 6::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(6)
	return

	Space & 7::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(7)
	return

	Space & 8::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(8)
	return

	Space & 9::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(9)
	return

	Space & 0::
		SendInput,{Esc}
		Sleep,100
		fun_TCselectFileByNum(0)
	return

	;左手alt+e作为F4
	$!e::
		BlockInput On
		SendInput,{Esc}
		Sleep,100
		SendInput,{Alt Up}
		SendInput,{F4}
		BlockInput Off
	return

	;避免聚焦在输入框中而无法生效
	`;::
		SendInput,{Esc}
		Sleep,100
		SendInput,{F4}
	return

	CapsLock & Enter::return
	;CapsLock & Space::return

	$Space::SendInput,{Blind}{Space}	;默认打字功能
	^Space::^Space
	+Space::+Space
}
#IfWinActive

;Eztc totalcmd中快捷键,20231122 {{{2
#IfWinActive ahk_class TTOTAL_CMD
{
	$^,::TcSendUserCommand("cm_SelectAll")	;全选,同Ctrl+A
	CapsLock & b::TcSendUserCommand("cm_ClearAll")  ;取消选择
	Space & ,::TcSendUserCommand("cm_RestoreSelection") ;恢复选择
	$F1::TcSendUserCommand("cm_MultiRenameFiles")   ;批量重命名,同Ctrl+M
	$F2::TcSendUserCommand("cm_RenameSingleFile")	;同F2,重命名
	$F3::ControlSend,,{F3}				;查看,cm_List,屏蔽截图等
	$F4::ControlSend,,{F4}				;F4,cm_Edit,屏蔽讯飞语音
	$F5::ControlSend,,{F5}				;F5,cm_Copy,屏蔽讯飞语音
	$F6::ControlSend,,{F6}				;F6,cm_RenMov,屏蔽讯飞语音
	$F7::ControlSend,,{F7}				;F7,cm_MkDir,屏蔽讯飞语音
	$F8::ControlSend,,{F8}				;F8,cm_Delete,屏蔽讯飞语音
	$F9::ControlSend,,{F9}				;F9,MPV,屏蔽讯飞语音
	$F10::ControlSend,,{F10}			;F10,ACDSee,屏蔽讯飞语音
	Escape & f4::SendInput,!{F3}			;同F4,cm_Edit
	CapsLock & Enter::SendInput,{Enter}		;同Enter
	$!+z::ControlSend,,!+z		;桌面文件夹,屏蔽火绒弹窗拦截冲突
	$+!^z::TcSendUserCommand("cm_OpenDesktop") 	;桌面文件夹
	$!+x::TcSendUserCommand("em_ToUpx")	;用Upx压缩exe等文件
	$!^x::TcSendUserCommand("em_ToFUpx") ;用FUpx压缩exe等文件

	$!q::TcSendUserCommand("cm_SrcQuickview")	;查看模式
	; $!w						;Win资管->TC|智能跳转
	; $!e::TcSendUserCommand("cm_Edit")		;同F4,cm_Edit
	$!r::TcSendUserCommand("cm_RenameSingleFile")	;同F2,重命名
	$^r::TcSendUserCommand("cm_RereadSource")	;刷新
	$!t::TcSendUserCommand("cm_SwitchSeparateTree")	;树状模式

	$!a::TcSendUserCommand("cm_SelectAll")	;全择,同Ctrl+A
	$!s::TcSendUserCommand("em_StartExplorer") 	;TC->Win资管
	$!d::TcSendUserCommand("cm_EditPath") 	;聚焦地址栏
	$!f::TcSendUserCommand("em_EverythingByFilename") ;Everyting
	CapsLock & g::
		if (GV_KeyClick_Continuous(300)){	;确定|树状视图
			TcSendUserCommand("cm_SrcTree") ;树状视图
		}
		else {	;单击{Enter},确定
			SendInput,{Enter}
		}
	return
	$!g::  ;新建文件(夹)|树状视图,屏蔽Ra插件管理|goole翻译
	if (GV_KeyClick_Continuous(300)){	;树状视图
			TcSendUserCommand("cm_SrcTree")
		}
		else {	;新建文件(夹)
			TcSendUserCommand("em_NewFiles")
		}
	return

	$!z::TcSendUserCommand("cm_SrcComments")	;备注模式
	$!x::TcSendUserCommand("cm_SrcLong")		;详细信息模式
	$!c::TcSendUserCommand("cm_SrcThumbs")		;缩略图模式
	$+!c::SendInput,^+c						;复制完整路径
	$#!c::SendInput,^+n						;复制文件名
	$^`::TcSendUserCommand("cm_DirectoryHotlist")	;常用文件夹
	$!v::TcSendUserCommand("cm_DirectoryHotlist")	;常用文件夹
	$!b::TcSendUserCommand("cm_DirBranch")		;展开所有文件夹

	;tc中使用数字按键来进行快速打开和快速切换标签
	;开启之后如需继续使用快搜，那快搜起始键不能是数字
	;需要打开或关闭直接修改下行的注释即可

	^!+d::
		GV_TotalcmdToggleJumpByNumber := !GV_TotalcmdToggleJumpByNumber
		if(GV_TotalcmdToggleJumpByNumber == 1)
			ToolTip 已启用TC中数字键跳转功能
		else
			ToolTip 已关闭TC中数字键跳转功能
		Sleep 2000
		ToolTip
	return

	1::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,1
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(1)
			} else if (p = "00") {
				;双击
				TcSendPos(5001)
			} else if (p = "1") {
				;长按
				TcSendPos(5001)
				TcSendPos(2001)
			}
		}
	return

	2::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,2
		else {
			p := ClickAndLongClick()
			if (p = "0"){
				;单击
				fun_TCselectFileByNum(2)
			}else if (p = "00"){
				;双击
				TcSendPos(5002)
			}else if (p = "1"){
				;长按
				TcSendPos(5002)
				TcSendPos(2001)
			}
		}
	return

	3::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,3
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(3)
			} else if (p = "00") {
				;双击
				TcSendPos(5003)
			} else if (p = "1") {
				;长按
				TcSendPos(5003)
				TcSendPos(2001)
			}
		}
	return

	4::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,4
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(4)
			} else if (p = "00") {
				;双击
				TcSendPos(5004)
			} else if (p = "1") {
				;长按
				TcSendPos(5004)
				TcSendPos(2001)
			}
		}
	return

	5::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,5
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(5)
			} else if (p = "00") {
				;双击
				TcSendPos(5005)
			} else if (p = "1") {
				;长按
				TcSendPos(5005)
				TcSendPos(2001)
			}
		}
	return

	6::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,6
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(6)
			} else if (p = "00") {
				;双击
				TcSendPos(5006)
			} else if (p = "1") {
				;长按
				TcSendPos(5006)
				TcSendPos(2001)
			}
		}
	return

	7::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,7
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(7)
			} else if (p = "00") {
				;双击
				TcSendPos(5007)
			} else if (p = "1") {
				;长按
				TcSendPos(5007)
				TcSendPos(2001)
			}
		}
	return

	8::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,8
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(8)
			} else if (p = "00") {
				;双击
				TcSendPos(5008)
			} else if (p = "1") {
				;长按
				TcSendPos(5008)
				TcSendPos(2001)
			}
		}
	return

	9::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,9
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(9)
			} else if (p = "00") {
				;双击
				TcSendPos(5009)
			} else if (p = "1") {
				;长按
				TcSendPos(5009)
				TcSendPos(2001)
			}
		}
	return

	0::
		if !GV_TotalcmdToggleJumpByNumber or fun_TcExistHotMenu() or TC_Focus_Edit()
			SendInput,0
		else {
			p := ClickAndLongClick()
			if (p = "0") {
				;单击
				fun_TCselectFileByNum(0)
			} else if (p = "00") {
				;双击
				TcSendPos(5001)
				TcSendPos(3006)
			} else if (p = "1") {
				;长按
				TcSendPos(5001)
				TcSendPos(3006)
				TcSendPos(2001)
			}
		}
	return

	;避免中文输入法的问题,取消选择
	,::
		ControlGetFocus, TC_CurrentControl, A
		;TInEdit1 地址栏和重命名 Edit1 命令行
		if (RegExMatch(TC_CurrentControl, "TMyListBox1|TMyListBox2"))
			TcSendPos(524) ;cm_ClearAll
		else
			SendInput,`,
	return

	CapsLock & y::SendInput,{AppsKey}

	; /*
	[::SendInput,{Home}{Down}

	]::SendInput,{End}
	; */

	;复制到对面选中目录
	$!+F5::
		SendInput,{Tab}^+c{Tab}{F5}
		Sleep,500
		SendInput,^v
		Sleep,500
		SendInput,{Enter 2}
	return

	;移动到对面选中目录
	$!+F6::
		SendInput,{Tab}^+c{Tab}{F6}
		Sleep,500
		SendInput,^v
		Sleep,500
		SendInput,{Enter 2}
	return

	;加上剪贴板中内容改名
	;ez版本中还是tcfs2实现
	$^F2::
		SendInput,+{F6}
		Sleep,300
		SendInput,{Right}
		Sleep,300
		SendInput,{Space}^v
		Sleep,300
	Return

	$^+F2:: ;更新文件名中日期
		SendInput,{F2}
		Sleep,100
		ControlGetText,OldName,TInEdit1,ahk_class TTOTAL_CMD
		Sleep,100
		NewName:= RegExReplace(OldName,"\d\d-\d\d-\d\d",fun_GetFormatTime("yy-MM-dd"))
		Sleep,100
		ControlSetText,TInEdit1,%NewName%
		Sleep,100
		SendInput,{Enter}
	Return

	;cm_OpenDirInNewTabOther    中键点击，在对面新标签中复制打开
	$MButton::
		SendInput,{Click}
		Sleep 50
		TcSendPos(3004)
	return

	;cm_OpenDirInNewTab     alt+中键点击，在新标签中复制打开
	$!MButton::	;^MButton和Quicker冲突改成$!MButton
	~LButton & MButton::
		SendInput,{Click}
		Sleep 50
		TcSendPos(3003)
	return

	;cm_OpenDirIncloesTab   Ctrl+Shift+中键点击，关闭全部标签
	$^+MButton::
	$^!MButton::
	$+!MButton::
		SendInput,^+w
		Sleep 50
		SendInput,y
	return

	;左手alt+e作为F4
	$!e::
		BlockInput On
		SendInput,{Esc}
		Sleep,100
		SendInput,{Alt Up}
		SendInput,{F4}
		BlockInput Off
	return

	; 双击右键，发送退格，返回上一级目录. 20231122
	; ~RButton::
	; 	KeyWait,RButton
	; 	KeyWait,RButton, d T0.4
	; 	if ! Errorlevel
	; 	{
	; 		SendInput,{BackSpace}
	; 	}
	; return

	;花号的作用
	; $^`::TC_azHistory()
	$!`::TC_azHistory()
	;`::SendInput,{Enter}
	;`::SendInput,{Appskey}

	$!j::TC_azHistory()

	;智能对话框跳转
	$!w::
		Dlg_HWnd := WinExist("ahk_group GroupDiagOpenAndSave")
		if Dlg_HWnd
		;IfWinExist ahk_group GroupDiagOpenAndSave
		{
			WinGetTitle, Dlg_Title, ahk_id %Dlg_HWnd%
				if RegExMatch(Dlg_Title,"新建|选择|保存|另存|存储|打开|上传|导入|导出|插入|浏览|Open|Save|Select|并入|查找|发布|更改|输入|输出|替换|位置|Acrobat|PDF|XPS|下载"){
					;msgbox "这是保存对话框"
					orgClip:=ClipboardAll
					Clipboard =
					;Postmessage, TC_Msg, CM_CopyFullNamesToClip,0,, ahk_class TTOTAL_CMD
					TcSendPos(CM_CopyFullNamesToClip)
					ClipWait, 1
					selFiles := Clipboard
					Clipboard:=orgClip
					selFilesArray := StrSplit(selFiles, "`n","`r")
				if selFilesArray.length() > 1{
					selFiles:=selFilesArray[1]
					EzTip("对话框是保存类型，只认第一个文件",1)
				}

				StringGetPos OutputVar, selFiles,`\,R1
				StringMid, filePath, selFiles,1, OutputVar+1
				StringMid, fileName, selFiles,OutputVar+2,StrLen(selFiles)-OutputVar

				IfWinNotActive, %Dlg_Title% ahk_id %Dlg_HWnd%, , WinActivate, %Dlg_Title% ahk_id %Dlg_HWnd%
					WinWaitActive, %Dlg_Title% ahk_id %Dlg_HWnd%
				if !ErrorLevel
				{
						ControlGetText, orgFileName,Edit1
						ControlFocus, Edit1,
						Sleep 200
						Send,{BackSpace}
						Sleep 300
						SetKeyDelay, 10,10
						ControlSetText, Edit1, %filePath%
						Sleep 900
						Send,{Enter}
						Sleep 500
						if StrLen(fileName) > 0{
							ControlSetText, Edit1, %fileName%, A
						}
						else {
							ControlSetText, Edit1, %orgFileName%, A
						}
				}
			}
			else {
				;msgbox "打开对话框"
				orgClip:=ClipboardAll
				Clipboard =
				;Postmessage, TC_Msg, CM_CopyFullNamesToClip,0,, ahk_class TTOTAL_CMD
				TcSendPos(CM_CopyFullNamesToClip)
				ClipWait, 1
				selFiles := Clipboard
				Clipboard:=orgClip

				selFilesArray := StrSplit(selFiles, "`n","`r")
				quote:=(selFilesArray.length() > 1) ? """" : ""
				selFiles=
				loop % selFilesArray.MaxIndex()
				{
					this_file := selFilesArray[A_Index]
					selFiles=%selFiles% %quote%%this_file%%quote%
				}
				IfWinNotActive, %Dlg_Title% ahk_id %Dlg_HWnd%, , WinActivate, %Dlg_Title% ahk_id %Dlg_HWnd%
					WinWaitActive, %Dlg_Title% ahk_id %Dlg_HWnd%
				if !ErrorLevel
				{
					Sleep 300
					SetKeyDelay, 10,10
					ControlSetText, Edit1, %selFiles%, A
				}
			}
			gosub,ForceSelfReload
		}
		else {
			EzTip("系统当前没有打开或保存对话框",2)
		}
	return

	;Ctrl+D->User个人
	$+MButton::
		TcSendPos(3001)
		ControlSend,,^d
		Sleep 50
		SendInput,s
		Sleep 50
	return

	$^z::	;撤销
		SetControlDelay -1	;提高可靠性
		;点击窗口内指定坐标
		ControlClick, x100 y100, ahk_class Progman, FolderView,,, NA
		ControlClick, x100 y100, ahk_class WorkerW, FolderView,,, NA
		;向控件发送热键
		ControlSend, SysListView321,^z, ahk_class Progman, FolderView
		ControlSend, SysListView321,^z, ahk_class WorkerW, FolderView
	return

	$^!z::	;重做
		SetControlDelay -1	;提高可靠性
		;点击窗口内指定坐标
		ControlClick, x100 y100, ahk_class Progman, FolderView,,, NA
		ControlClick, x100 y100, ahk_class WorkerW, FolderView,,, NA
		;向控件发送热键
		ControlSend, SysListView321,^y, ahk_class Progman, FolderView
		ControlSend, SysListView321,^y, ahk_class WorkerW, FolderView
	return

	$Space::SendInput,{Blind}{Space}	;默认打字功能
}
#IfWinActive

#If WinActive("ahk_class TTOTAL_CMD") and MouseUnder("(TMy|LCL)ListBox[123]")
	;长按左键，等于F4
	~$LButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{LButton}"
		GV_KeyClickAction2 := "SendInput,{Enter}"
		GV_MouseButton := 1
		GV_LongClickAction := "SendInput,{Click}{F4}"
		gosub,Sub_ButtonLongPress
	return
#If

; 双击右键发送退格，返回上一级目录,排除EzTc_32位版本(自带),使适用于其他版本的TC.20240120
/*#If WinActive("ahk_class TTOTAL_CMD") and MouseUnder("Window[11-12]") and !WinActive("Frank Zheng ahk_exe TOTALCMD.EXE")  ;左侧状态栏
 ~$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "GoFun,"TcSendUserCommand("cm_VisButtonbar")""	;显示/隐藏: 水平工具栏
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return
#If

#If WinActive("ahk_class TTOTAL_CMD") and MouseUnder("Window[16-17]") and !WinActive("Frank Zheng ahk_exe TOTALCMD.EXE")  ;右侧状态栏
 ~$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "GoFun,"TcSendUserCommand("cm_VisButtonbar2")""	;显示/隐藏: 垂直工具栏
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return
#If
*/

#If (WinActive("ahk_class TTOTAL_CMD") or WinActive("强化版 ahk_exe TOTALCMD.EXE") or WinActive("ahk_group Group_browser")) and !WinActive("ahk_group Group_disableRButtonBackspace")
$RButton::
	GV_MouseTimer := 400
	GV_KeyClickAction1 := "SendInput,{RButton}"
	GV_KeyClickAction2 := "SendInput,{BackSpace}"	;退回上一级目录
	GV_MouseButton := 2
	GV_LongClickAction := "SendInput,{RButton}"
	gosub,Sub_MouseClick123
return
#If

MouseUnder(Controls){
	MouseGetPos,,,, Control
	if RegExMatch(Control, Controls)
	return, true
}

TcSendPos(Number)
{
	PostMessage 1075, %Number%, 0, , AHK_CLASS TTOTAL_CMD
}

;#IfWinActive ahk_class TTOTAL_CMD
	;#0::TcSendUserCommand("em_To7zip")
	;return
;#IfWinActive

TcSendUserCommand(strCommand) ;string
{
	VarSetCapacity(CopyDataStruct, 3*A_PtrSize, 0) ;Set up the structure's memory area.
	dwData := Asc("E") + 256 * Asc("M")
	NumPut(dwData, CopyDataStruct, 0)
	cbData := StrPutVar(strCommand, strCommand, "cp0")
	NumPut(cbData, CopyDataStruct, A_PtrSize) ;OS requires that this be done.
	NumPut(&strCommand, CopyDataStruct, 2*A_PtrSize) ;Set lpData to point to the string itself.
	SendMessage, 0x4a, 0, &CopyDataStruct,, ahk_class TTOTAL_CMD ;0x4a is WM_COPYDATA. Must use Send not Post.
}

StrPutVar(string, ByRef var, encoding)
{
	;Ensure capacity.
	VarSetCapacity( var, StrPut(string, encoding) * ((encoding="utf-16"||encoding="cp1200") ? 2 : 1) )
	;Copy or convert the string.
	return StrPut(string, &var, encoding)
}

#IfWinActive 批量重命名 ahk_class TMultiRename
{
	F1::SendInput,!p{tab}{Enter}e

	$MButton::
	Escape & F1::
		SendInput,{F10}e
	return
}
#IfWinActive

;MButton盲点不是默认的“确定”或者OK按钮，by tuutg,2024/01/09 22:08
#If (WinActive("ahk_group Group_MButtonClickOk") and !WinActive("ahk_group GroupDiagOpenAndSave") and !WinActive("ahk_group MButtonClickPassWord") and !WinActive("ahk_group Group_CQCCAPassWord"))
	$MButton::
		try{
			SendInput,{Enter}
			SetTitleMatchMode RegEx
			SetTitleMatchMode Slow
			ControlClick, i)确定|.*确定|确定.*|全部.*|OK.*|是.*|.*Y|.*A, A
		} catch e{
			ControlClick, Button1, A
			ControlClick, Button2, A
			ControlClick, TButton1, A
		}
	return


#If

;;新建文件(夹),盲点“确定”或者OK按钮，by tuutg,20240115
#If WinActive("ahk_class TfomMain")
	CapsLock & w::SendInput,^{Enter}	;换行
	$MButton::SendInput,{Enter}			;确定

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,{Esc}"	;取消
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}"
		gosub,Sub_MouseClick123
	return
#If
;****************************************************
;****************************************************
;excel中 {{{2
;excel 2010: ahk_class XLMAIN
;excel2013: ahk_class XLMAIN
;WPS 表格-wps11-4合1集成模式,ahk_exe wpsoffice.exe,打印 ahk_class bosa_sdm_XL9
;WPS_et 双击中键关闭/单击中键缩放100%
#If WinActive("ahk_exe et.exe") and !WinActive("打印 ahk_class bosa_sdm_XL9")
	CapsLock & w::
	$MButton::	;2023/07/30 15:32
	if (GV_KeyClick_Continuous(300)){	;保存并关闭
		SendInput,^s
		Sleep ,100
		SendInput,^w
		Sleep ,100
		EzTip("文件保存并关闭成功!",1)
	}
	else {	;100%->保存
		SendInput,^0
		Sleep ,100
		SendInput,^s
		Sleep ,100
		;SendInput,^{Home}
		;EzTip("文件保存成功!",1)
	}
	return

	^#a::	;另存为CVS
		Click, 40, 55, 1
		Sleep, 50
		ControlSend, ,{a}{m}, WPS 表格 ahk_class XLMAIN
		Sleep, 100
		WinActivate, 另存为 ahk_class #32770
		Sleep, 100
		ControlSend, Edit1, {Tab}, 另存为 ahk_class #32770
		Sleep, 100
		Click, 408, 551, 1
		Sleep, 100
		Click, 314, 717, 1	;CVS
		Sleep, 100
		Click, 770, 520, 0	;保存(s)
		Sleep, 100
		; WinActivate, 另存为 ahk_class #32770
		; ControlSend, ,{Alt}{y}{enter}, WPS 表格 ahk_class XLMAIN
		; Sleep, 100
		; WinActivate, 另存为 ahk_class #32770
		; ControlSend, ,{Alt}{n}{enter}, WPS 表格 ahk_class XLMAIN
	return

	^#s::	;另存为xlsx
		Click, 40, 55, 1
		Sleep, 100
		ControlSend, ,{a}, WPS 表格 ahk_class XLMAIN
		Sleep, 100
		Click, 315, 315, 1
		WinActivate, 另存为 ahk_class #32770
		Sleep, 100
		Click, 770, 520, 0	;保存(s)
	return
#IfWinActive
;****************************************************
#If WinActive("ahk_class XLMAIN") or WinActive("xls ahk_class OpusApp") or WinActive("工作簿 ahk_class OpusApp")
	CapsLock & u::SendInput,^{End}
	CapsLock & i::SendInput,^{Home}

	CapsLock & r:: ;删除行/列
		SendInput,{Click,Right}
		Sleep 50
		ControlSend,,d
	return

	CapsLock & e::SendInput,^{Up}
	CapsLock & d::SendInput,^{Down}
	CapsLock & s::SendInput,^{Left}
	CapsLock & f::SendInput,^{Right}

	; CapsLock & g::^1 ;Ctrl+1   ;设置单元格格式,20231122

	$!m::
	CapsLock & b::		;Ctrl+M|合并居中
	if (WinActive("ahk_exe et.exe")){
		SendInput, ^m
	}
	else {	;ahk_exe EXCEL.EXE
		SendInput, !hyh{Enter}
	}
	return

	CapsLock & q::
	if (GV_KeyClick_Continuous(300)){	;同一工作簿表间切换
		if (WinActive("ahk_exe EXCEL.EXE")){
			SendInput, ^{PgUp}
		}
		else {	;ahk_exe et.exe
			Send, {Control Down }
			Sleep, 100
			ControlSend, EXCEL71, {PgUp}
			Sleep, 100
			Send, {Control Up}
		}
		return
	}
	else {
		SendInput,^+{Tab}	;工作簿标签间切换
	}
	return

	CapsLock & a::
	if (GV_KeyClick_Continuous(300)){	;同一工作簿表间切换
		if (WinActive("ahk_exe EXCEL.EXE")){
			SendInput, ^{PgDn}
		}
		else {	;ahk_exe et.exe
			Send, {Control Down}
			Sleep, 100
			ControlSend, EXCEL71, {PgDn}
			Sleep, 100
			Send, {Control Up}
		}
	}
	else {
		SendInput,^{Tab}	;工作簿标签间切换
	}
	return

	CapsLock & z:: 	 ;插入复制行|列
		SendInput,^c
		Sleep 100
		SendInput,{AppsKey}
		Sleep 100
		ControlSend,,e
	return

	$!q::SendInput,!q	;检索内容,自带快捷键

	$!w::	;鼠标置于MS_Office Tab标签上,右键定位到文件夹
	if WinActive("ahk_exe EXCEL.EXE"){
		Click,Right, ,Down
		Sleep,100
		Click,Right, ,Up
		Sleep,100
		ControlSend, ,{Up 9}
		Sleep,100
		ControlSend, ,{Enter}
	}
	else {
		Click, Right, , Down
		Sleep,100
		Click, Right, , Up
		Sleep,100
		ControlSend, , {Up 5}
		Sleep,100
		ControlSend, , {Enter}
	}
	return

	$!e::	;字体居中
	if (WinActive("ahk_exe EXCEL.EXE")){
		SendInput,!hyc	;字体居中
		SendInput,!hyf	;字体居中
	}
	else {
		SendInput,!hac	;字体居中
	}
	return

	$!r::	;当前日期
	if (WinActive("ahk_exe EXCEL.EXE")){
		SendInput,!hyc	;字体居中
		SendInput,!hyf	;字体居中
		Sleep,100
		SendInput,^`;	;当前日期
	}
	else {
		SendInput,!hac	;字体居中
		Sleep,100
		SendInput,^`;	;当前日期
	}
	return
	$!t::ControlClick, Edit1	;只适用于MS_Office,定位到Edit1

	$!a::SendInput,^a	;全选
	$!s::SendInput,!ohr	;重命名工作表
	$!d::SendInput,^e	;向下填充
	$!f::SendInput,^f	;查找|!g->定位
	$<!g::SendInput,!{Enter}	;单元格内换行
	$>!g::SendInput,^g	;定位,20231122

	$!z::SendInput,^z	;撤销
	$!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
	$!x::SendInput,!el	;只适用于MS_Office,删除工作表

	FrontColor:
	$!c::	;字体颜色|;SendInput,{F2}^+{Home}^c{Esc}	;复制单元格纯文本
	if (WinActive("ahk_exe EXCEL.EXE")){
		SendInput,!hfc
		; Click ,265,115,1
		; Click ,305,115,1
	}
	else {
		SendInput,!h!
		Click ,360,115,1	;字体颜色
		Sleep,100
		Click ,325,115,1	;表格颜色
	}
	return
;****************************************************
	;Space模式用于工具|数字,20240309
	Space & g::SendInput,{Enter}
	Space & x::gosub,Space_SgX ;剪切

	Space & c::
		GV_KeyClickAction1 := "gosub,Space_SgC" ;复制
		GV_KeyClickAction2 := "gosub,FrontColor" ;字体颜色
		gosub,Sub_KeyClick123
	return

	Space & v::SendInput,^v	;粘贴
	$Space::SendInput,{Blind}{Space} ;恢复空格打字上屏

	Space & 1:: SendInput,{0} ;相加=11
	Space & 2:: SendInput,{9} ;相加=11
	Space & 3:: SendInput,{8} ;相加=11
	Space & 4:: SendInput,{7} ;相加=11
	Space & 5:: SendInput,{6} ;相加=11
	Space & 6:: SendInput,{5} ;相加=11
	Space & 7:: SendInput,{4} ;相加=11
	Space & 8:: SendInput,{3} ;相加=11
	Space & 9:: SendInput,{2} ;相加=11
	Space & 0:: SendInput,{1} ;相加=11

	Space & q:: SendInput,{PgUp} ;上翻页
	Space & a:: SendInput,{PgDn} ;下翻页
;****************************************************

	$!v::SendInput,!hfp ;格式刷
	$!b::SendInput,^b 	;加粗

	;筛选
	;f3::Postmessage, 0x111, 447, 0, , a
	$F3::SendInput,^+l	;ctrl+shift+L

	;添加单元格
	^=::SendInput,^+=
	$!i::SendInput,!his	;只适用于MS_Office,新建工作表

	;详细编辑
	!;::
	{
		ControlClick, EXCEL<1
		SendInput,{Home}
	}
	return

	;自行调整行高
	![::
	try{
		ox := ComObjActive("Excel.Application")
		ox.Application.Selection.EntireRow.AutoFit
	}
	catch e{
		;出错就用传统快捷键
		SendInput,!ora
	}
	return

	;自行调整列宽
	!]::
	try{
		ox := ComObjActive("Excel.Application")
		ox.Application.Selection.EntireColumn.AutoFit
	}
	catch e{
		SendInput,!oca
	}
	return

	;默认快捷键
	;$!WheelUp::SendInput,!{PgUp}
	;$!WheelDown::SendInput,!{PgDn}
	$!WheelUp::SendInput,{Left 8}
	$!WheelDown::SendInput,{Right 8}
	$+WheelUp::SendInput,{Left}
	$+WheelDown::SendInput,{Right}

	;先保存,双击中键关闭/单击中键缩放100%
	$MButton::gosub,中键设定_Office
	$!MButton::SendInput,{F12} ;另存为
	$+RButton::SendInput,{Enter} ;Enter,处理中文输入法英文上屏
#If
;****************************************************
;****************************************************
;word中,word2013: ahk_class OpusApp, {{{2
;WPS 文字-wps11-4和1集成模式,ahk_exe wpsoffice.exe

#If WinActive("Word ahk_class OpusApp") or WinActive("doc ahk_class OpusApp") or WinActive("文字 ahk_class OpusApp")
	CapsLock & o:: ;簿间切换<-
	CapsLock & q:: ;簿间切换<-
	if WinActive("ahk_exe wps.exe")
	{
		SendInput,^+{Tab}
	}
	else
	{
		SendInput,^+{F6}
	}
	return

	CapsLock & p:: ;簿间切换->
	CapsLock & a:: ;簿间切换->
	if WinActive("ahk_exe wps.exe")
	{
		SendInput,^{Tab}
	}
	else
	{
		SendInput,^{F6}
	}
	return

	CapsLock & b::^h ;Ctrl+H,替换

	;!q::	;检索内容,自带快捷键
	$!w::	;鼠标置于MS_Office Tab标签上,右键定位到文件夹
	if WinActive("ahk_exe WINWORD.EXE"){
		Click, Right, , Down
		Sleep,100
		Click, Right, , Up
		Sleep,100
		ControlSend, , {Up 9}
		Sleep,100
		ControlSend, , {Enter}
		Sleep,100
	}
	else {
		Click, Right, , Down
		Sleep,100
		Click, Right, , Up
		Sleep,100
		ControlSend, , {Up 5}
		Sleep,100
		ControlSend, , {Enter}
		Sleep,100
	}
	return

	$!e::SendInput,^e	;字体居中
	$!r::SendInput,^r	;右对齐
	; $!t::             ;工具

	$!a::SendInput,^a	;全选
	$!s::SendInput,^s	;保存文件
	$!d::ControlSend,,^d	;字体设置
	$!f::SendInput,^f	;查找
	$!g::SendInput,^g	;定位

	$!z::SendInput,^z	;撤销
	$!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
	$!x::SendInput,^x	;剪切
	$!c::SendInput,^c	;复制
	$!v::SendInput,!hfp ;格式刷
	$!b::SendInput,^b 	;加粗

	;先保存,双击中键关闭/单击中键缩放100%
	$MButton::gosub,中键设定_Office
	$!MButton::SendInput,{F12} ;另存为
	$+RButton::SendInput,{Enter} ;Enter,处理中文输入法英文上屏
#If
;****************************************************
;****************************************************
;TgEverything中 {{{2
;audio:  搜索音频文件.
;zip:	搜索压缩文件.
;doc:	搜索文档文件.
;exe:	搜索可执行文件.
;pic:	搜索图片文件.
;v20ideo:	 搜索视频文件.
;folder: 仅匹配文件夹.
;8-tf-  文本文件
;9-ct-  内容搜索
;cf-    重复文件
;mt-    音频-作者专辑标题
#If WinActive("ahk_class EVERYTHING") or WinActive("ahk_class EVERYTHING_(1.5a)")
{
	$!q::SendInput,!p ;预览

	;打开文件夹,默认^{Enter},并在TC中定位到文件,即光标在文件上;20240113
	CapsLock & w::gosub,EvToTcAClick ;激活Tc并选中,即光标在文件上
	$!w::gosub,EvToTcAClick 		 ;激活Tc并选中,即光标在文件上

	$!e::EverythingChooseType("exe")	;5过滤可执行文件
	$!r::EverythingChooseType("folder")	;8过滤文件夹
	$!t::EverythingChooseType("pic")	;6过滤图片
	$!a::EverythingChooseType("audio")	;2过滤音频

	;一键打开路径,跳入Win资管
	$!s::SendInput,^e
	~$MButton::SendInput,^e

	$!d::EverythingChooseType("doc")	;4过滤文档
	; $!f:: ;预留Ev
	$!g::ControlClick, ComboBox1, ,,,, NA	;筛选

	$!z::EverythingChooseType("zip")	;3压缩文件
	$!x::EverythingChooseType("tf")		;9文本文件
	$!v::EverythingChooseType("video")	;7过滤视频
	$!b::EverythingChooseType("")		;1过滤所有

	;一键复制路径
	$!c::SendInput,^+c
	$!MButton::SendInput,^+c

	; !1::EverythingFiltersType(1)
	; !2::EverythingFiltersType(2)
	; !3::EverythingFiltersType(3)
	; !4::EverythingFiltersType(4)

	;自动调整列宽
	$+MButton::SendInput,^{NumpadAdd}

	~LButton::
		GV_LongClickAction := "Send,{Click}{F4}"
		GV_MouseButton := 1
		gosub,Sub_ButtonLongPress
	return

	$F4::	;ControlSend,,{F4},F4Menu
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{F}{Enter}
	return

	CapsLock & f::
		if MouseUnder("SysListView321"){
			SendInput,{Click,Right}{Down}
		} else{
			SendInput,{Right}
		}
	return
}
#If

EverythingChooseType(ft){
	ControlGetText, searching, Edit1, A
	searching := ft . ":" . searching
	ControlSetText, Edit1, %searching%, A
	Sleep,500
	SendInput,{End}
}

EvToTcAClick:	;激活Tc并选中,即光标在文件上
	Clipboard=""
	SetTitleMatchMode RegEx
	SetTitleMatchMode Slow
	ControlSend,,{Click},ahk_class EVERYTHING.*
	ControlSend,,^+c,ahk_class EVERYTHING.*
	Sleep,500
	; EzTip(Clipboard,1)
	SendInput,^{Enter}
	Run,"%COMMANDER_EXE%" /T /O /S /L="%Clipboard%"
	Sleep,500
	MyWinWaitActive("ahk_class TTOTAL_CMD")
return
;****************************************************
;****************************************************
;MPV播放器中 {{{2
#IfWinActive ahk_exe MPV.exe
{
	;速度控制
	XButton1 & WheelUp::SendInput,[
	XButton2 & WheelUp::SendInput,[
	XButton1 & WheelDown::SendInput,]
	XButton2 & WheelDown::SendInput,]

	;4速切换
	XButton2 & RButton::SendInput,\
	XButton1 & RButton::SendInput,\

	;上下
	XButton1::SendInput,.
	XButton2::SendInput,,

	^RButton::SendInput,^RButton
	!f::ControlSend,,!f

}
#IfWinActive
;****************************************************
;****************************************************
;Qsel启动器 {{{2
#If WinActive("Qsel ahk_class WindowClass_0")
{
	XButton1::SendInput,{Tab}
	XButton2::SendInput,{BackSpace}
	WheelDown::SendInput,{Tab}
	WheelUp::SendInput,{BackSpace}
	Space & WheelDown::SendInput,{Tab}
	Space & WheelUp::SendInput,{BackSpace}
	$Space::Space

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,{Escape}"
		gosub,Sub_MouseClick123
	return
}
#If
;****************************************************
;****************************************************
;IrfanView {{{2
#If (WinActive("ahk_class IrfanView") and ((A_CaretX ="") and (A_Cursor != "IBeam")))
{
	;IrfanView自身支持ctrl+滚轮，但alt更好按，也不用多想到底哪一个按键
	d::	;by tuutg 2024/01/09
	!WheelDown::SendInput,{NumpadSub}
	e::	;by tuutg 2024/01/09
	!WheelUp::SendInput,{NumpadAdd}
	.::SendInput,{NumpadAdd}
	,::SendInput,{NumpadSub}

	`;::SendInput,{Esc}

	y::SendInput,{PgDn}
	;如果是动画，先按g暂停动画图片了后再按jk
	j::SendInput,{PgDn}
	k::SendInput,{PgUp}
	s::SendInput,{PgDn}	;by tuutg 20231209
	f::SendInput,{PgUp}	;by tuutg 20231209

	x::SendInput,i	;图片信息

	a::	;by tuutg 2024/01/09
	u::SendInput,{End}

	q::	;by tuutg 2024/01/09
	i::SendInput,{Home}

	/::SendInput,^h	;原始大小
	\::SendInput,+f	;适应窗口大小

	c::SendInput,^c
	!r::SendInput,{F2}	;重命名
	1::SendInput,!ofn{Enter}	;按文件名排序
	4::SendInput,!ofd{Enter}	;按日期排序
	5::SendInput,!of{Up}{Enter}	;反向排序

	!s::SendInput,!fs	;另存为 by tuutg 20231209
}
#If
;****************************************************
#If (WinActive("ahk_class IrfanViewThumbnails") and ((A_CaretX ="") and (A_Cursor != "IBeam")))	;缩略图模式
{
	j::SendInput,{Down}
	k::SendInput,{Up}
	h::SendInput,{Left}
	l::SendInput,{Right}
	d::SendInput,{Down}	;by tuutg 2024/01/09
	e::SendInput,{Up}	;by tuutg 2024/01/09
	s::SendInput,{Left}	;by tuutg 2024/01/09
	f::SendInput,{Right} ;by tuutg 2024/01/09
	x::ControlClick SysTreeView321 ;移动焦点至目录树
}
#If
;****************************************************
;****************************************************
;JPEGView {{{2
#if WinActive("ahk_class #32770 ahk_exe JPEGView.exe")
{
	!WheelDown::SendInput,{NumpadSub}	;-
	!WheelUp::SendInput,{NumpadAdd}	;+
	$!e::SendInput,^o	;打开图片
	$!w::SendInput,^w	;打开图片目录
}
#if
;****************************************************
;****************************************************
;SumatraPDF {{{2
#if (WinActive("ahk_class SUMATRA_PDF_FRAME") and ((A_CaretX ="") and (A_Cursor != "IBeam")))
{
	$q::SendInput,^k		;显示命令面板
	$w::SendInput,^+{NumpadSub}	;向左旋转
	$e::SendInput,{NumpadAdd}	;+,放大
	$r::SendInput,^+{NumpadAdd}	;向右旋转
	$t::SendInput,{F12}		;显示/隐藏书签

	$a::SendInput,^s		;保存|另存
	$s::SendInput,{p}		;上一页
	$d::SendInput,{NumpadSub}	;-,缩小
	$f::SendInput,{n}		;下一页
	$g::SendInput,^g		;转到页面

	$z::SendInput,^0		;适合页面
	$x::SendInput,{F8}		;显示/隐藏工具栏
	$c::SendInput,{F11}		;进入/退出全屏
	$v::SendInput,{F5}		;进入/退出演示
	$b::SendInput,^b		;加入书签

	$!f::SendInput,^f		;页面查找
	$!g::ControlSend,,^f		;页面查找

	;用其他软件打开
	!e::
		Acrobat_Path =D:\Program Files (x86)\Adobe\Acrobat DC 2022\Acrobat DC\Acrobat\Acrobat.exe
		WinGetActiveTitle, title
		Clipboard= % title
		filenamenew := RegExReplace(Clipboard, "(.*(\.chm|\.pdf|\.epub)+).*","$1")
		if RegExMatch(filenamenew, ".pdf$"){
			Run, "%Acrobat_Path%" "%filenamenew%", ..\, Max,
			; Run, "FoxitReaderPortable.exe" "%filenamenew%", ..\, Max,
		}
		else if RegExMatch(filenamenew, ".chm$"){
			Run, "hh.exe" "%filenamenew%", ..\, Max,
		}
	return
}
#if
;****************************************************
;****************************************************
;快速目录切换 {{{2
;收藏的目录，
;最近使用的目录
#IfWinActive ahk_group GroupDiagOpenAndSave
	;从对话框中切换到tc，在tc中再选文件，然后alt+w再回来
	$!w:: gosub,Sub_SendCurDiagPath2Tc
	;直接用tc中的地址（已经选好）
	$!g:: gosub,Sub_SendTcCurPath2Diag
#IfWinActive

;在TC中打开对话框的路径
Sub_SendCurDiagPath2Tc:
	WinActivate, ahk_class TTOTAL_CMD
	/*
	;WinGetText, CurWinAllText
	;;MsgBox, The text is:`n%CurWinAllText%
	;loop, Parse, CurWinAllText, `n, `r
	;{
		;if RegExMatch(A_loopField, "^地址: "){
		;curDiagPath := SubStr(A_loopField,4)
		;break
		;}
	;}
	;WinActivate, ahk_class TTOTAL_CMD
	;ControlSetText, Edit1, cd %curDiagPath%, ahk_class TTOTAL_CMD
	;Sleep 900
	;ControlSend, Edit1,{Enter}, ahk_class TTOTAL_CMD
	*/
return

;将tc中路径发送到对话框
Sub_SendTcCurPath2Diag:
	;开关： 将剪贴板中内容作为文件名
	B_Clip2Name := false
	;开关： 是否改大对话框
	B_ChangeDiagSize := false ;true

	ControlGetText, orgFileName,Edit1

	;先获取TC中当前路径
	clip:=Clipboard
	Clipboard =
	TcSendPos(CM_CopySrcPathToClip)
	;TcSendPos(CM_CopyFullNamesToClip)

	ClipWait, 1
	tcSrcPath := Clipboard
	Clipboard:=clip

	;处理例如根目录c:\就不用额外添加\
	if(SubStr(tcSrcPath, StrLen(tcSrcPath))!="`\"){
		tcSrcPath := tcSrcPath . "`\"
	}

	ControlFocus, Edit1,
	Sleep 200
	SendInput,{BackSpace}
	Sleep 300
	SetKeyDelay, 10,10
	ControlSetText, Edit1, %tcSrcPath%
	Sleep 900
	SendInput,{Enter}
	Sleep 500

	if(B_Clip2Name){
		ControlSetText, Edit1, %clip%,A
	}
	else {
		ControlSetText, Edit1, %orgFileName%
	}

	;ControlSetText, Edit1, %text%,A

	if(B_ChangeDiagSize){
		;WinGetPos, xTB, yTB,lengthTB,hightTB, ahk_class Shell_TrayWnd
		;改变对话框大小，省事就直接移动到100,100的位置，然后85%屏幕大小，否则就要详细结算任务栏在上下左右的位置
		WinMove, A,,80,80, A_ScreenWidth * 0.85, A_ScreenHeight * 0.85
	}
return

;构建对话框中菜单
Sub_Menu2Diag:
	;左边历史
	;右边历史
	;hotdir
return

;Totalcmd历史记录 {{{2
;添加按照ini读取的启动菜单，接管`按键
;剪贴板增强
;固定文本条目增强
;#Persistent
TC_azHistory()
{
	if RegExMatch(COMMANDER_EXE, "i)totalcmd64\.exe$")
	{
		TCListBox := "LCLListBox"
		TCEdit := "Edit2"
		TInEdit := "TInEdit1"
		TCPanel1 := "Window1"
		TCPanel2 := "Window11"
		TCPathPanel := "TPathPanel2"
	}
	else
	{
		TCListBox := "TMyListBox"
		TCEdit := "Edit1"
		TInEdit := "TInEdit1"
		TCPanel1 := "TPanel1"
		TCPanel2 := "TMyPanel8"
		TCPathPanel := "TPathPanel1"
	}

	;<cm_ConfigSaveDirHistory>
	TcSendPos(582)
	Sleep, 200
	history := ""
	TCINI := COMMANDER_PATH . "\wincmd.ini"
	;msgbox % TCINI
	tcLeftRight := fun_TcGet(1000)
	;msgbox % tcLeftRight
	if tcLeftRight = 1
	{
		IniRead, history, %TCINI%, LeftHistory
		if RegExMatch(history, "RedirectSection=(.+)", HistoryRedirect)
		{
			StringReplace, HistoryRedirect1, HistoryRedirect1, `%COMMANDER_PATH`%, %COMMANDER_PATH%
			IniRead, history, %HistoryRedirect1%, LeftHistory
		}
	}
	else if tcLeftRight = 2
	{
		IniRead, history, %TCINI%, RightHistory
		if RegExMatch(history, "RedirectSection=(.+)", HistoryRedirect)
		{
			StringReplace, HistoryRedirect1, HistoryRedirect1, `%COMMANDER_PATH`%, %COMMANDER_PATH%
			IniRead, history, %HistoryRedirect1%, RightHistory
		}
	}
	history_obj := []
	Global history_name_obj := []
	;loop, Parse, history, `n
	;max := A_index
	loop, Parse, history, `n
	{
		idx := RegExReplace(A_loopField, "=.*$")
		value := RegExReplace(A_loopField, "^\d\d?=")
		;避免&被识别成快捷键
		value := RegExReplace(value, "\t.*$")
		name := StrReplace(value, "&", ":＆:")
		;msgbox % name
		if RegExMatch(Value, "::\{20D04FE0\-3AEA\-1069\-A2D8\-08002B30309D\}\|")
		{
			name := RegExReplace(Value, "::\{20D04FE0\-3AEA\-1069\-A2D8\-08002B30309D\}\|")
			value := 2122
		}
		if RegExMatch(Value, "::\|")
		{
			name := RegExReplace(Value, "::\|")
			value := 2121
		}
		if RegExMatch(Value, "::\{21EC2020\-3AEA\-1069\-A2DD\-08002B30309D\}\\::\{2227A280\-3AEA\-1069\-A2DE\-08002B30309D\}\|")
		{
			name := RegExReplace(Value, "::\{21EC2020\-3AEA\-1069\-A2DD\-08002B30309D\}\\::\{2227A280\-3AEA\-1069\-A2DE\-08002B30309D\}\|")
			value := 2126
		}
		if RegExMatch(Value, "::\{208D2C60\-3AEA\-1069\-A2D7\-08002B30309D\}\|") ;NothingIsBig的是XP系统，网上邻居是这个调整
		{
			name := RegExReplace(Value, "::\{208D2C60\-3AEA\-1069\-A2D7\-08002B30309D\}\|")
			value := 2125
		}
		if RegExMatch(Value, "::\{F02C1A0D\-BE21\-4350\-88B0\-7367FC96EF3C\}\|")
		{
			name := RegExReplace(Value, "::\{F02C1A0D\-BE21\-4350\-88B0\-7367FC96EF3C\}\|")
			value := 2125
		}
		if RegExMatch(Value, "::\{26EE0668\-A00A\-44D7\-9371\-BEB064C98683\}\\0\|")
		{
			name := RegExReplace(Value, "::\{26EE0668\-A00A\-44D7\-9371\-BEB064C98683\}\\0\|")
			value := 2123
		}
		if RegExMatch(Value, "::\{645FF040\-5081\-101B\-9F08\-00AA002F954E\}\|")
		{
			name := RegExReplace(Value, "::\{645FF040\-5081\-101B\-9F08\-00AA002F954E\}\|")
			value := 2127
		}
		name := "&" . Chr(idx+65) . " " . name
		history_obj[idx] := name
		history_name_obj[name] := value
	}
	Menu, az, UseErrorLevel
	Menu, az, add
	Menu, az, deleteall
	MaxItem := 26
	loop, %MaxItem%
	{
		idx := A_Index - 1
		name := history_obj[idx]
		Menu, az, Add, %name%, azHistorySelect
	}
	Menu, az, Add, [&4] 关闭,azHistoryDeleteAll	;by tuutg 2024/01/09
	ControlGetFocus, TLB, ahk_class TTOTAL_CMD
	ControlGetPos, xn, yn, wn, , %TLB%, ahk_class TTOTAL_CMD
	Menu, az, show, %xn%, %yn%
}

azHistoryDeleteAll:
	Menu, az, DeleteAll
return

azHistorySelect:
	azHistorySelect()
return

azHistorySelect()
{
	Global history_name_obj
	if ( history_name_obj[A_ThisMenuItem] = 2122 ) or RegExMatch(A_ThisMenuItem, "::\{20D04FE0\-3AEA\-1069\-A2D8\-08002B30309D\}")
		TcSendPos(cm_OpenDrives)
	else if ( history_name_obj[A_ThisMenuItem] = 2121 ) or RegExMatch(A_ThisMenuItem, "::(?!\{)")
		TcSendPos(cm_OpenDesktop)
	else if ( history_name_obj[A_ThisMenuItem] = 2126 ) or RegExMatch(A_ThisMenuItem, "::\{21EC2020\-3AEA\-1069\-A2DD\-08002B30309D\}\\::\{2227A280\-3AEA\-1069\-A2DE\-08002B30309D\}")
		TcSendPos(cm_OpenPrinters)
	else if ( history_name_obj[A_ThisMenuItem] = 2125 ) or RegExMatch(A_ThisMenuItem, "::\{F02C1A0D\-BE21\-4350\-88B0\-7367FC96EF3C\}") or RegExMatch(A_ThisMenuItem, "::\{208D2C60\-3AEA\-1069\-A2D7\-08002B30309D\}\|") ;NothingIsBig的是XP系统，网上邻居是这个调整
		TcSendPos(cm_OpenNetwork)
	else if ( history_name_obj[A_ThisMenuItem] = 2127 ) or RegExMatch(A_ThisMenuItem, "::\{645FF040\-5081\-101B\-9F08\-00AA002F954E\}")
		TcSendPos(cm_OpenRecycled)
	else
	{
		ThisMenuItem := StrReplace(A_ThisMenuItem, ":＆:", "&")
		ThisMenuItem := RegExReplace(ThisMenuItem, "^&[A-Z] ")
		TcSendPos(CM_EditPath)
		Sleep,300
		ControlSetText, %TInEdit%, %ThisMenuItem%, ahk_class TTOTAL_CMD
		Sleep,300
		ControlSend, %TInEdit%, {Enter}, ahk_class TTOTAL_CMD
	}
}

MenuHandler:
	MsgBox You selected %A_ThisMenuItem% from the Menu %A_ThisMenu%.
return
;快速目录切换$
;*************** 各程序快捷键或功能$ ****************


;****************【初始化菜单|设置】*****************
;****************       Menu^       *****************
CreatTrayMenu:
	Menu,Tray,NoStandard
	Menu,Tray,add,设置Capstg(&T),Settings_Gui
	Menu,Tray,add,Edit编辑脚本(&E),Menu_Edit
	Menu,Tray,add,Window Spy(&C),Menu_Debug
	Menu,Tray,add,AHK帮助文档(&H),Menu_Document
	Menu,Tray,add,Open自身监视(&F),Menu_Open
	Menu,Tray,add
	Menu,Tray,add,开启或关闭随系统自动启动(&Q),Menu_AutoStart
	Menu,Tray,add,添加或去除绿软SoftDir变量(&D),Menu_SoftDir
	Menu,Tray,add
	Menu,Tray,add,拾遗补缺的绿化(&G),Menu_GreenPath
	Menu,Tray,add
	Menu,Tray,add,重启脚本(&R),Menu_Reload
	Menu,Tray,add
	Menu,Tray,add,暂停热键(&S),Menu_Suspend
	Menu,Tray,add,暂停脚本(&A),Menu_Pause
	Menu,Tray,add,退出脚本(&X),Menu_Exit
return


Menu_Open:
	ListLines
return

Menu_Edit:
	;Edit
	;Run,%COMMANDER_PATH%\Tools\notepad\Notepad3.exe %A_ScriptFullPath%
	Run,%COMMANDER_PATH%\Tools\AutoHotkey\SciTE\SciTE.exe "%A_ScriptFullPath%"
return

Menu_Debug:
	Run,%COMMANDER_PATH%\AU3_Spy.exe
return

Menu_Document:
	;Run,hh.exe %COMMANDER_PATH%\AutoHotkey.chm
	Run,https://wyagd001.github.io/zh-cn/docs/
return

Menu_Reload:
	gosub,ForceSelfReload
return

Menu_AutoStart:
	if A_Is64bitOS
		SetRegView 64
	RegRead, OutputVar, HKEY_LOCAL_MACHINE, Software\Microsoft\Windows\CurrentVersion\Run, CapsEz
	if OutputVar
	{
		RegDelete, HKEY_LOCAL_MACHINE, Software\Microsoft\Windows\CurrentVersion\Run, CapsEz
		EzTip("已关闭CapsEz随系统自动启动",10)
	}
	else
	{
		RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, Software\Microsoft\Windows\CurrentVersion\Run, CapsEz, "%A_AhkPath%"
		EzTip("已设置CapsEz随系统自动启动",10)
	}
return

Menu_SoftDir:
	if A_Is64bitOS
		SetRegView 64
		RegRead, OutputVar, HKEY_LOCAL_MACHINE, SYSTEM\CurrentControlSet\Control\Session Manager\Environment, SoftDir
	if OutputVar
	{
		RegDelete, HKEY_LOCAL_MACHINE, SYSTEM\CurrentControlSet\Control\Session Manager\Environment, SoftDir
		EzTip("已去掉SoftDir环境变量",10)
	}
	else
	{
		RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SYSTEM\CurrentControlSet\Control\Session Manager\Environment, SoftDir, %SOFTDIR%
		EzTip("已添加SoftDir环境变量",10)
	}
return

;Menu_RightMenu:
	;if A_Is64bitOS
		;SetRegView 64
	;RegRead, OutputVar, HKEY_LOCAL_MACHINE, SYSTEM\CurrentControlSet\Control\Session Manager\Environment, SoftDir
	;if OutputVar
	;{
		;RegDelete, HKEY_LOCAL_MACHINE, SYSTEM\CurrentControlSet\Control\Session Manager\Environment, SoftDir
		;eztip("已去掉SoftDir环境变量",10)
	;}
	;else
	;{
		;RegWrite, REG_SZ, HKEY_LOCAL_MACHINE, SYSTEM\CurrentControlSet\Control\Session Manager\Environment, SoftDir, %SOFTDIR%
		;eztip("已添加SoftDir环境变量",10)
	;}
;return


Menu_GreenPath:
	;1、newfile中的模板，Tools\NewFiles\NewFiles.ini
	p := COMMANDER_PATH . "\Tools\NewFiles\Templates"
	IniWrite, %p%, %COMMANDER_PATH%\Tools\NewFiles\NewFiles.ini, FileList,TemplatePath

	;2、everything的Everything.ini
	p := "$exec(""" . COMMANDER_PATH . "\" . COMMANDER_NAME . """ /A /T /O /S /R=""%1"")"
	IniWrite, %p%, %COMMANDER_PATH%\Everything.ini, Everything,open_folder_command2
	IniWrite, %p%, %COMMANDER_PATH%\Everything.ini, Everything,open_path_command2
	p := "$exec(""" . COMMANDER_PATH . "\Tools\F4Menu\F4Menu.exe"" ""%1"")"
	IniWrite, %p%, %COMMANDER_PATH%\Everything.ini, Everything,explore_command2
	; IniWrite, %p%, %COMMANDER_PATH%\Everything.ini, Everything,explore_path_command2

	;3、tcmatch.ini
	p := "Long description@" . COMMANDER_PATH . "\Plugins\WDX\FileDiz\FileDiz.wdx"
	IniWrite, %p%, %COMMANDER_PATH%\tcmatch.ini, wdx, wdx_text_plugin3
return

Menu_Suspend:
	Menu,tray,ToggleCheck,暂停热键(&S)
	Suspend
return

Menu_Pause:
	Menu,tray,ToggleCheck,暂停脚本(&A)
	Pause
return

Menu_Exit:
	ExitApp
return

Quit:
	ExitApp
;****************       Menu$       *****************

;****************       Vim^        *****************
;vim: textwidth=120 wrap tabstop=4 shiftwidth=4
;vim: foldmethod=marker fdl=0
;****************       Vim$        *****************

;****************  Settings_Gui^    *****************
Settings_Gui:
	Critical, On ;防止短时间内打开多次界面出现问题
	Thread, NoTimers,true
	HotKeyFlag:=MenuVarFlag:=OpenExtFlag:=AdvancedConfigFlag:=false
	GUI_WIDTH_66=700
	TAB_WIDTH_66=680
	GROUP_WIDTH_66=660
	GROUP_LISTVIEW_WIDTH_66=650
	GROUP_CHOOSE_EDIT_WIDTH_66=580
	GROUP_ICON_EDIT_WIDTH_66=550
	MARGIN_TOP_66=15
	Gui,66:Destroy
	Gui,66:default
	Gui,66:+Resize
	Gui,66:Margin,30,20
	Gui,66:Font,,Microsoft YaHei

	;CapsTg基本设置
	Gui,66:Add,Tab3,x10 y10 w%TAB_WIDTH_66%,CapsTg基本设置
	Gui,66:Tab,1

	;1.RunCaptX安装目录
	Gui,66:Add,GroupBox,xm-10 y+25 w%GROUP_WIDTH_66% h60, 1. RunCaptX安装目录, 默认D:\RunCaptX, 不要改动位置.如放U盘运行,同步调整1-2-3项
	Gui,66:Add,Button,xm yp+25 GSetRunCaptX,RunCaptX安装目录
	Gui,66:Add,Edit,x+11 yp+2 w482 r1 vRunCaptX,%RunCaptX%

	;2.TOTALCMD安装目录
	Gui,66:Add,GroupBox,xm-10 y+25 w%GROUP_WIDTH_66% h60, 2. TOTALCMD(64).exe所在目录, 默认D:\RunCaptX\GreenTools\Totalcmd\SoftDir\totalcmd_ez
	Gui,66:Add,Button,xm yp+25 GSetTcDir,TOTALCMD安装目录
	Gui,66:Add,Edit,x+11 yp+2 w498 r1 vTcDir,%COMMANDER_PATH%

	;3.Tg截图保存目录
	Gui,66:Add,GroupBox,xm-10 y+25 w%GROUP_WIDTH_66% h60, 3. Tg截图保存目录, 默认D:\RunCaptX\PixPinTg截图, 可自定义
	Gui,66:Add,Button,xm yp+25 GSetScreenShotDir,Tg截图保存目录
	Gui,66:Add,Edit,x+11 yp+2 w525 r1 vScreenShotDir,%ScreenShotPath%

	;4.QQ|Tim文件接收目录
	Gui,66:Add,GroupBox,xm-10 y+25 w%GROUP_WIDTH_66% h60, 4. QQ|Tim文件接收目录(带\), 默认X:\Users\Personal\Tencent Files\自己的QQ号\FileRecv\
	Gui,66:Add,Button,xm yp+25 GSetQQTimFPath,QQ|Tim文件接收目录
	Gui,66:Add,Edit,x+11 yp+2 w495 r1 vQQTimFPath,%QQTimFPath%

	;5.微信|wechat文件接收目录
	Gui,66:Add,GroupBox,xm-10 y+25 w%GROUP_WIDTH_66% h60, 5. 微信|wechat文件接收目录(带\), 默认X:\Users\XXX\Personal\WeChat Files\
	Gui,66:Add,Button,xm yp+25 GSetWechatFpath,微信|wechat文件接收目录
	Gui,66:Add,Edit,x+11 yp+2 w475 r1 vWechatFpath,%WechatFpath%

	;6.微信|wechat安装目录
	Gui,66:Add,GroupBox,xm-10 y+25 w%GROUP_WIDTH_66% h60, 6. wechat.exe所在目录, 默认D:\Program Files\Tencent\WeChat\WeChat.exe.如不是请填写正确的wechat.exe目录
	Gui,66:Add,Button,xm yp+25 GSetWx_Path,微信|wechat安装目录
	Gui,66:Add,Edit,x+11 yp+2 w498 r1 vWx_Path,%Wx_Path%

	;7.启用光标下滚轮
	Gui,66:Add,GroupBox,xm-10 y+25 w%GROUP_WIDTH_66% h60, 7. 启用光标下滚轮,(Win7设置为1,Win7以上0)
	Gui,66:Add,Text,xm yp+25 ,启用光标下滚轮
	Gui,66:Add,Edit,x+11 yp+2 w540 r1 vWheelOnCursor,%GV_ToggleWheelOnCursor%

	;8.最下方4个按键
	Gui,66:Add,Button,x150 y605 w75  ggOK,确定(&S)
	Gui,66:Add,Button,x250 y605 w100 ggOpen,打开配置文件(&F)
	Gui,66:Add,Button,x375 y605 w100 ggSpic,打开配置简图(&T)
	Gui,66:Add,Button,x500 y605 w75  ggCancel,取消(&C)

	Gui,66:Tab	;即后续添加的控件将不属于前面那个选项卡控件
	Gui,66:Show, w%GUI_WIDTH_66% h680
	Critical,Off
return

;按键对应动作的跳转标签
;1.RunCaptX安装目录
SetRunCaptX:
	FileSelectFolder, dir, , 1
	if(dir){
		GuiControl,, RunCaptX, %dir%
	}
	Gui,66:Submit, NoHide
return

;2.TOTALCMD安装目录
SetTcDir:
	FileSelectFolder, dir, , 0
	if(dir){
		GuiControl,, TcDir, %dir%
	}
	Gui,66:Submit, NoHide
return

;3.Tg截图保存目录
SetScreenShotDir:
	FileSelectFolder, dir, , 1
	if(dir){
		GuiControl,, ScreenShotDir, %dir%
	}
	Gui,66:Submit, NoHide
return

;4.QQ|Tim文件接收目录
SetQQTimFPath:
	FileSelectFolder, dir, , 1
	if(dir){
		GuiControl,, QQTimFPath, %dir%
	}
	Gui,66:Submit, NoHide
return

;5.微信|wechat文件接收目录
SetWechatFpath:
	FileSelectFolder, dir, , 1
	if(dir){
		GuiControl,, WechatFpath, %dir%
	}
	Gui,66:Submit, NoHide
return

;6.微信|wechat安装目录
SetWx_Path:
	FileSelectFolder, dir, , 1
	if(dir){
		GuiControl,, Wx_Path, %dir%
	}
	Gui,66:Submit, NoHide
return

;8.最下方4个按键
gOK:
	Critical, On
	Thread, NoTimers,True
	Gui,66: Submit

	GuiControlGet, RunCaptX, , RunCaptX
	GuiControlGet, COMMANDER_PATH, , TcDir
	GuiControlGet, ScreenShotPath, , ScreenShotDir
	GuiControlGet, QQTimFPath, , QQTimFPath
	GuiControlGet, Wx_Fpath, , Wx_Fpath
	GuiControlGet, Wx_Path, , Wx_Path
	GuiControlGet, GV_ToggleWheelOnCursor, , WheelOnCursor

	FileDelete, %INI%

	IniWrite, %RunCaptX%,   %INI%, 基本设置, RunCaptX
	IniWrite, %COMMANDER_PATH%, %INI%, 基本设置, COMMANDER_PATH
	IniWrite, %ScreenShotPath%, %INI%, 基本设置, ScreenShotPath
	IniWrite, %QQTimFPath%,     %INI%, 基本设置, QQTimFPath
	IniWrite, %WechatFpath%,    %INI%, 基本设置, WechatFpath
	IniWrite, %Wx_Path%,        %INI%, 基本设置, Wx_Path
	IniWrite, %GV_ToggleWheelOnCursor%, %INI%, 基本设置, GV_ToggleWheelOnCursor
	;MsgBox TOTALCMD安装目录: %COMMANDER_PATH%

	gosub, Menu_Reload
	Critical, Off
return

gOpen:
	Ini_Run(INI)
return

gCancel:
	Gui,66:Destroy
return

gSpic:
	Run, %RunCaptX%\Capstg简介\Capstg目录自定义设置\Capstg目录自定义设置.jpg
return
;****************************************************
Ini_Run(ini){
	try {
		if(!FileExist(ini)){
			MsgBox,16,%ini%,没有找到配置文件：%ini%
		}
			Run,"%ini%"
	} catch {
		Run,notepad.exe "%ini%"
	}
}

Label_ReadINI: ; 读取INI配置文件
	if !FileExist(INI)
	gosub,Label_Init_INI

	; 读取基本设置快捷键

	IniRead, RunCaptX,    %INI%, 基本设置, RunCaptX,   D:\RunCaptX
	IniRead, COMMANDER_PATH,  %INI%, 基本设置, COMMANDER_PATH, D:\RunCaptX\GreenTools\Totalcmd\SoftDir\totalcmd_ez
	IniRead, ScreenShotPath,  %INI%, 基本设置, ScreenShotPath, D:\RunCaptX\PixPinTg截图
	IniRead, QQTimFPath	,     %INI%, 基本设置, QQTimFPath,     E:\Users\Tuutg\Personal\Tencent Files\542114344\FileRecv\
	IniRead, WechatFpath,     %INI%, 基本设置, WechatFpath,    E:\Users\Tuutg\Persona\WeChat Files\
	IniRead, Wx_Path	,     %INI%, 基本设置, Wx_Path,        D:\Program Files\Tencent\WeChat\WeChat.exe
	IniRead, GV_ToggleWheelOnCursor, %INI%, 基本设置, GV_ToggleWheelOnCursor, 0
return

Label_Init_INI:	; 初始化配置文件INI
	FileAppend,[基本设置]`n, %INI%
	FileAppend,RunCaptX =D:\RunCaptX`n, %INI%
	FileAppend,COMMANDER_PATH=D:\RunCaptX\GreenTools\Totalcmd\SoftDir\totalcmd_ez`n, %INI%
	FileAppend,ScreenShotPath=D:\RunCaptX\PixPinTg截图`n, %INI%

	FileAppend,QQTimFPath =E:\Users\Tuutg\Personal\Tencent Files\542114344\FileRecv\`n, %INI%
	FileAppend,WechatFpath =E:\Users\Tuutg\Persona\WeChat Files\`n, %INI%
	FileAppend,Wx_Path =D:\Program Files\Tencent\WeChat\WeChat.exe`n, %INI%
	FileAppend,GV_ToggleWheelOnCursor=0`n, %INI%
return
;****************************************************
;****************  Settings_Gui$    *****************


;*********** Tuutg自定义应用增强例子开始^ ***********
#IfWinActive ahk_group Group_code
$!w::
	SendInput,^s	;单击, 保存
	Sleep,100
	SendInput,#!d    ;Ra_XiaoYao_plus设定好#!d为定位文件目录动作
return

CapsLock & w:: ;{Enter}/保存
	if (GV_KeyClick_Continuous(300)){
		SendInput,^s ;双击保存并提示
		EzTip("文件保存成功!",1)
		SendInput,^w ;关闭标签/窗口
	}
	else if(#IfWinActive,ahk_class ConsoleWindowClass){
		SendInput,{Enter} ;单击,Enter
	}else {
		; SendInput,{Enter} ;单击,Enter
		SendInput,^s ;单击, 保存
	}
return

$!q::
$!e:: ;用e作为注释键,因此比较熟练.
	if (GV_KeyClick_Continuous(300)){
		;ControlSend,, ^q ;取消之前的注释代码,SciTEWindow
		;ToolTip,在400毫秒内连续按下了两次.
		SendInput,{End}	;从行末起跳,行首位置统一
		Sleep,100
		SendInput,{Home} ;到代码段的行首
		SendInput,{Del 2} ;删除注释说明的符号
	}
	else {
		;ControlSend,, ^q ;只按一次的话,行首加注释说明的符号
		SendInput,{Home} ;到代码段的行首
		SendInput,{Insert}`;{Space}	;+注释说明的符号
	}
return

$!r::ControlSend,,!r	;当前软件默认,VS查找,启用正则
$!t::ControlSend,,!t	;当前软件默认

CapsLock & q:: ;文段首|Home,行首
	if (GV_KeyClick_Continuous(300)){
		SendInput,^{Home} ;文段首
	}
	else {
		SendInput,{Home} ;只按一次的话,行首
	}
return
;****************************************************
CapsLock & a:: ;文段末|End,行末
	if (GV_KeyClick_Continuous(300)){
		SendInput,^{End} ;文段末
	}
	else {
		SendInput,{End} ;只按一次的话,行末
	}
return

$!a::SendInput,^a    	;全选
; $!s::SendInput,^s	;改为,全局Ra_搜索
$!f::SendInput,^f	;查找
$!d::SendInput,^d	;复制当前行
; CapsLock & g::^g	;改为{Enter}
$!g::SendInput,^g	;定位|跳转到行号
$!b::SendInput,^h	;查找|替换

$!z::SendInput,^z	;撤销
$!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
$!x::ControlSend,,!x	;当前软件默认
$!c::ControlSend,,!c	;当前软件默认,VS查找,启用大小写
$!v::					;VS Code代码格式化
	if(WinActive("ahk_exe Code.exe")){
		SendInput,+!f
	}else {
		ControlSend,,!v	;当前软件默认
	}
return

CapsLock & b::SendInput,^b	;Notepad--,目录比较|VS Code,主侧栏

$+RButton::SendInput,{Enter} ;Enter,处理中文输入法英文上屏
$MButton::					 ;单击, 保存|Enter
	if(WinActive("ahk_exe BCompare.exe") or WinActive("ahk_exe uc.exe") or WinActive("ahk_exe WinMergeU.exe")){
		SendInput,^s
		Sleep,100
		SendInput,{Enter}
	}else {
		SendInput,^s	;单击, 保存认
	}
return

CapsLock::	;增强代码编辑器,单击CapsLock={Tab},双击退出
	Suspend Permit
	GV_KeyClickAction1 := "SendInput,{Tab}"
	GV_KeyClickAction2 := "SendInput,{Esc}{Rshift}"
	gosub,Sub_KeyClick123
return
#IfWinActive
;****************************************************
;****************************************************
; /*
#IfWinActive ahk_class SciTEWindow
{
	$^q::ControlSend,,^q	; 注释
	$!q::ControlSend,,^q    ; 注释
	$!w::
		SendInput,^s	;单击, 保存
		Sleep,100
		; SendInput,#!d  ;Ra_XiaoYao_plus设定好#!d为定位文件目录动作
		SendInput,^2 	;右键定位到文件目录
	return

	CapsLock & w:: ;{Enter}/保存
	if (GV_KeyClick_Continuous(300)){
		SendInput,^s ;双击保存并提示
		EzTip("文件保存成功!",1)
		SendInput,^w ;关闭标签/窗口
	}
	else if(#IfWinActive,ahk_class ConsoleWindowClass){
		SendInput,{Enter} ;单击,Enter
	}   else {
		SendInput,^s ;单击,保存
	}
	return

	$!e::ControlSend,,^q    ; 注释
	$!r::          ; Run/F5
		Send,{F7}
		Sleep,100
		Send,{F5}  	; Click,395,60
	return
	;$!t          ; 工具

	CapsLock & q::	;文段首|Home,行首
	if (GV_KeyClick_Continuous(300)){
		SendInput,^{Home} ;文段首
	}
	else {
		SendInput,{Home} ;只按一次的话,行首
	}
	return
;****************************************************
	CapsLock & a:: ;Home|End,行末
	if (GV_KeyClick_Continuous(300)){
		SendInput, ^{End} ;文段末
	}
	else {
		SendInput,{End} ;只按一次的话,行末
	}
	return

	$!a::SendInput,^a    ; 全选
	$!s::          ; 右键多开
		Click, ,  Right, 1
		Sleep,100
		SendInput,{Down 9}
		Sleep,100
		SendInput,{Enter}
	return

	$!d::SendInput,^d	; 复制当前行
	$!f::SendInput,^f	; 查找
	$!g::SendInput,^g	; 定位|跳转到行号

	$!z::SendInput,^z	; 撤销
	$!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
	$!x::ControlClick,Button4	; 清除标记
	$!c::SendInput,^3	; 右键运行选区代码
	$!v::Click,485,60	; 代码格式化.之前为Button2
	$!b::SendInput,^h	; 替换|查找

	CapsLock & b::    ; 右键定位到#include文件
		Click, ,  Right, 1
		Sleep,100
		SendInput,{Up 5}
		Sleep,100
		SendInput,{Enter}
	return

	$+RButton::SendInput,{Enter} ;Enter,处理中文输入法英文上屏
	~$MButton::SendInput,^s	;单击, 保存
	$!MButton:: SendInput,!{Enter}   ; 跳转到定义}

	CapsLock::	;增强代码编辑器,单击CapsLock={Tab},双击退出|返回英文
		Suspend Permit
		GV_KeyClickAction1 := "SendInput,{Tab}"
		GV_KeyClickAction2 := "SendInput,{Esc}{Rshift}"
		gosub,Sub_KeyClick123
	return
}
#IfWinActive
*/
;****************************************************
;****************************************************
#If WinActive("ahk_group Group_MButtonDoubleClose")
::zz::SendInput,^w
;****************************************************
中键设定_Acrobat:	;单击中键缩放100%/双击中键关闭
~$MButton::
if (GV_KeyClick_Continuous(300)){
	SendInput,^s
	Sleep ,100
	SendInput,^w
	Sleep ,100
	EzTip("文件保存并关闭成功!",1)
}
else {
	SendInput,^s
	Sleep ,100
	SendInput,^0	;单击中键缩放100%
	Sleep ,100
}
return
#If
;****************************************************
;****************************************************
#If WinActive("͉ahk_class Photoshop")		;适用于Photoshop
	$^#!d::		;左键另存为PDF|动作设定^+{F12}
	$+!LButton::
	$^+LButton::
		SendInput,!fa
		WinWaitActive, 另存为 ahk_class #32770
		ControlClick, ComboBox2
		ControlSend, ComboBox2, {Home}{Down 13}{Enter}, 另存为 ahk_class #32770
		Sleep, 1000
	return

	$^#!j::
	$+!MButton::
	$^+MButton:: ;中键另存为JPG|动作设定^+{F11}
		SendInput,!fa
		WinWaitActive, 另存为 ahk_class #32770
		ControlClick, ComboBox2
		ControlSend, ComboBox2, {Home}{Down 9}{Enter}, 另存为 ahk_class #32770
		Sleep, 1000
	return

	$^#!p::		;^+!u ,快速导出png
	$+!RButton::
	$^+RButton::
		SendInput,!fe{Enter}
	return

;****************************************************

	;Space模式,约等Ctrl
	~$Space::Space ;默认抓手工具
		; if (A_CaretX ="") {
			; SendInput,{h}
		; } else {
			; SendInput,{Space}
		; }
	; return

	Space & q::SendInput,^p  ;打印
	Space & w::	;Ctrl+W,保存|关闭
		SendInput,^s
		Sleep, 100
		SendInput,^w
	return
	Space & e::SendInput,^e  ;Ctrl+E,合并复制
	Space & r::SendInput,^+!r ;旋转图像
	Space & t::SendInput,^t ;Ctrl+t,自由变换

	Space & a::SendInput,^a ;Ctrl+A,全部选择
	Space & s::SendInput,^`/ ;Ctrl+/,锁定图层
	Space & d::ControlSend,,^d ;Ctrl+D,取消选择
	Space & f::SendInput,^j ;Ctrl+J,复制图层
	Space & g::SendInput,^g ;Ctrl+G,对象编组

	Space & z::SendInput,^z ;Ctrl+Z,撤销操作
	Space & x::SendInput,^+x ;液化
	Space & c::SendInput,^!i ;图像大小
	Space & v::SendInput,^`, ;Ctrl+,|显示图层
	Space & b::		;Photoshop_替换内容_智能对象
	CapsLock & b::
		SendInput,{Click}
		Sleep,100
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 14}
		Sleep,500
		SendInput,{Enter}
	return

	Space & F5::SendInput,+{F5} ;填充图层
#If
;****************************************************
;****************************************************
#IfWinActive ahk_class #32770 ahk_group Group_WPS
	$!f::	;模仿Listary, 跳转目标路径
	$MButton::
	; CapsLock & g::	;Win7打开,Win11关闭(Listary6)
		; 方法1,Utools
		Click, 75, 80 Left, 1
		Sleep, 100
		Click, 550, 300 Middle, Down
		Sleep, 500
		Click, 550, 300 Middle, Up
		Sleep, 100
		; Click, 465, 365 Left, 1 ;适用uTools,4.0.1以下
		Click, 550, 435 Left, 1	;适用uTools,4.4.1以上
		Sleep, 100
		SendInput, {Enter}
		Sleep, 100
		SendInput, {Enter}
	return

	CapsLock & g::SendInput,^g	;QuickJump或Listary
#IfWinActive
;****************************************************
;****************************************************
#If WinActive("ahk_group GroupDiagOpenAndSave") and !WinActive("跳至页面 ahk_exe Acrobat.exe")
{
	; $!s::	;和Ra搜索冲突,屏蔽
	$+MButton:: ;单击保存/确定/打开按钮/IDM下载
		ControlSend, Edit1, {Enter}
		Sleep,100
		if WinActive("下载文件信息 ahk_class #32770") ;IDM下载
			ControlClick,Button1
	return
;****************************************************
	;复制文件名->Listary自搜索->自动跳转
	;$<!MButton::
	$!f::gosub,Listary_CyJp
;****************************************************
	CapsLock & g::SendInput,^g	;QuickJump或Listary 跳转目标路径
	CapsLock & w::SendInput,{Enter}	 ;解决中文输入法输入英文上屏
;****************************************************
	;打开|保存对话框中,CapsLock=Listary_CyJp,快速自动跳转到Listary中
	CapsLock::
		Suspend Permit
		GV_KeyClickAction1 := "gosub,Listary_CyJp"
		GV_KeyClickAction2 := "gosub,Listary"	;双击Ctrl激活Listary
		gosub,Sub_KeyClick123
	return
}
#IfWinActive
;****************************************************
Listary_CyJp:	;复制文件名->Listary自搜索->自动跳转
	; Clipboard=
	Sleep,100
	ControlGetText,Out,Edit1,A ; 复制文件名
	; Clipboard=%Out%
	;1.缩短文件名便于匹配更多结果
	Out := RegExReplace(Out, "[0-9]", "")
	Out := RegExReplace(Out, "\_v", "")
	Out := RegExReplace(Out, "\-v", "")
	Out := RegExReplace(Out, "\-mod", "")
	Out := RegExReplace(Out, "\-mod", "")
	Out := RegExReplace(Out, "Setup", "")
	Out := RegExReplace(Out, "bit", "")
	Out := RegExReplace(Out, "Portable", "")
	Out := RegExReplace(Out, "Green", "")
	out := RegExReplace(Out, "Single", "")
	Out := RegExReplace(Out, "[\-\.\_\(\)]", " ")
	Sleep,100

	;2.Listary跳转目标路径
	;SendInput,#!s	;Listary复制粘贴文件名(Quicker-LY设定好#!s)
	SendInput,^g	;QuickJump或Listary跳转到资管当前路径
	gosub,Listary	;双击Ctrl激活Listary搜索框
	Sleep,1000	;延时等待,激活Listary搜索框
	SendInput,%Out%	;粘贴文件名
	Sleep,1000	;延时等待,搜索词匹配目标对象
	ControlSend,,{Blind}^{Enter},SearchBarWindow ahk_exe Listary.exe ;适配Listary6.3,在Listary5中不可靠,改右键方式
	SendInput,{Blind}^{Enter}	;适配Listary5.0,在Listary5中不可靠,改右键方式
	; ControlSend,,{Right},ahk_exe Listary.exe	;适配Listary5
	; Sleep,1000
	; ControlSend,,{Enter},ahk_exe Listary.exe	;适配Listary5
return
;****************************************************
/*Listary_CyJp1:	;复制文件名->Listary自搜索->手动跳转
	; Clipboard=
	Sleep,100
	ControlGetText,Out,Edit1,A ; 复制文件名
	; Clipboard=%Out%
	;1.缩短文件名便于匹配更多结果
	Out := RegExReplace(Out, "[0-9]", "")
	Out := RegExReplace(Out, "\_v", "")
	Out := RegExReplace(Out, "\-v", "")
	Out := RegExReplace(Out, "\-mod", "")
	Out := RegExReplace(Out, "\-mod", "")
	Out := RegExReplace(Out, "Setup", "")
	Out := RegExReplace(Out, "bit", "")
	Out := RegExReplace(Out, "Portable", "")
	Out := RegExReplace(Out, "Green", "")
	out := RegExReplace(Out, "Single", "")
	Out := RegExReplace(Out, "[\-\.\_\(\)]", " ")
	Sleep,100

	;2.Listary跳转目标路径
	;SendInput,#!s	;Listary复制粘贴文件名(Quicker-LY设定好#!s)
	SendInput,^g	;QuickJump或Listary跳转到资管当前路径
	gosub,Listary	;双击Ctrl激活Listary搜索框
	Sleep,1000		;延时等待,激活Listary搜索框
	SendInput,%Out%	;粘贴文件名
	Sleep,1000	;延时等待,搜索词匹配目标对象
	ControlSend,,{Blind}^{Enter},SearchBarWindow ahk_exe Listary.exe ;适配Listary6.3,在Listary5中不可靠,改右键方式
	; SendInput,{Blind}^{Enter}	;适配Listary5.0,在Listary5中不可靠,改右键方式
	; ControlSend,,{Right},ahk_exe Listary.exe	;适配Listary5
	; Sleep,1000
	; ControlSend,,{Enter},ahk_exe Listary.exe	;适配Listary5
return
*/
;****************************************************
;****************************************************
#if WinActive("ahk_exe explorer.exe") or WinActive("ahk_group Group_explorer") or WinActive("ahk_group GroupDiagOpenAndSave")
{
	$F7:: ;空白处右键/新建文件夹
	if WinActive("ahk_exe explorer.exe"){
		SendInput,^+n	;新建文件夹
	}
	else {
		SendInput,{Click,Right}
		Sleep 50
		SendInput, w
		Sleep 50
		SendInput, f
		Sleep 50
		; SendInput, ^v
		; Sleep 50
		; Clipboard :=	;清空剪贴板
	}
	return
;****************************************************
	$F8:: ;右键del
	{
		SendInput,{Delete}
		Sleep 100
		; SendInput, y	;Win1X中del删除不用确认
	}
	return
;****************************************************
	$F3::gosub, QuickLook ;QuickLook预览或;用做贴图
;****************************************************
	$^+F2::	;剪切板重命名,2023/12/07 18:40
	FileName := Clipboard ; 保存剪贴板内容到变量中
	if (FileName != " "){ ;使用剪贴板内容重命名
		Send, {F2} ; 激活重命名命令
		Sleep, 50 ; 等待重命名框出现
		illegalChars := "[\\\\/:*?\""<>|]"	;去除重命名非法字符
		Clipboard :=RegExReplace(FileName,illegalChars," ")
		Send, %Clipboard% ; 输入新的文件名
		Sleep, 50 ; 等待重命名完成
		Clipboard := " " ;清空剪贴板
	}
	return
;****************************************************
	$^F2:: ;追加剪切板重命名
	{
		SendInput,{F2}
		Sleep,100
		SendInput,{Right}
		Sleep,100
		SendInput,{NumpadSub}^v
		Sleep,100
		;SendInput,{Enter}
	}
	return
;****************************************************
	CapsLock & e:: ;一键解压|压缩 2023/08/09 15:48
	if (GV_KeyClick_Continuous(300)){
		Send,{AppsKey}
		Sleep 100
		SendInput,w
		Sleep 100
		SendInput,e
		Sleep 100
		ControlSend,,t	;防止激活Listary
	}
	else {
		SendInput,{Up}
	}
	return
;****************************************************
	$^e:: ;一键解压|压缩
	{
		SendInput,{Click,Right}
		Sleep 100
		SendInput,w
		Sleep 100
		SendInput,e
		Sleep 100
		ControlSend,,t	;防止激活Listary
		Sleep 100
	}
	return
;****************************************************
	$!MButton:: ;一键隐藏文件
	{
		SendInput,!{Enter}
		Sleep,100
		ControlClick, x35 y45, 属性 ahk_class #32770
		Sleep,250
		SendInput,!h
		Sleep,100
		SendInput,{Enter}
		; Sleep,100
		; SendInput,{Enter}
	}
	return
;****************************************************
	;双击右键，发送退格，返回上一级目录, Win10:SendInput,!{Up}|{BackSpace}
	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,!{Up}"	;退回上一级目录
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{ESC}"
		gosub,Sub_MouseClick123
	return
;****************************************************
	$!RButton::SendInput,!{Right}	;前进下一级目录
	$!LButton:: ;SendInput,!{Left}	;退回上一级目录
	GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,!{Left}" ;退回上一级目录
		GV_KeyClickAction2 := "SendInput,!{Enter}" ;文件属性
		GV_MouseButton := 1
		GV_LongClickAction := "SendInput,{ESC}"
		gosub,Sub_MouseClick123
	return
}
#If
;****************************************************
QuickLook: ;QuickLook预览
{
	SendInput,{Click}
	Sleep,100
	SendInput,^c
	Sleep,100
	clip:=
	clip:=Clipboard
	Sleep,100
	Run, "%RunCaptX%\GreenTools\QuickLook\QuickLook.exe" "%clip%"
	Sleep,100
	clip:=
}
return
;****************************************************
;****************************************************
#IfWinActive XnView MP ahk_exe xnviewmp.exe
{
	;双击右键，发送退格，返回上一级目录
	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,{BackSpace}"
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Enter}"
		gosub,Sub_MouseClick123
	return
;****************************************************
	CapsLock & q::
	{
		if (GV_KeyClick_Continuous(300)){
			ControlSend,,{PgUp} ;双击Ctrl+↑
		}
		else {
			ControlSend,,*	;单击1:1-100%显示
		}
		return
	}

	q::ControlSend,,!1 ;PS打开/需设置!1=PS
	w::ControlSend,,!w ;用资源管理器打开文件
	CapsLock & w::ControlSend,,^s ;保存
	e::ControlSend,,{NumpadAdd} ;+号-放大
	;CapsLock & e::SendInput,{Up}
	r::ControlSend,,+r ;R90
	;CapsLock & r::SendInput,{Del}
	t::SendInput,+d ;加字
	;CapsLock & t::SendInput,{BackSpace}

	CapsLock & a::
	{
		if (GV_KeyClick_Continuous(300)){
			ControlSend,,{PgDn} ;双击Ctrl+↓
		}
		else {
			ControlSend,,^+s ;另存
		}
		return
	}
	a::ControlSend,,^+s ;另存
	;CapsLock+s/f = <-/->, 上下翻页
	CapsLock & s::
	s::ControlSend,,{Left} ;<-
	CapsLock & f::
	f::ControlSend,,{PgDn} ;->
	d::ControlSend,,`- ;-号-缩小
	CapsLock & d::SendInput,{Down} ;-号-缩小
	g::ControlSend,,*	;单击1:1-100%显示

	z::ControlSend,,^{NumpadDiv} ;缩放实际尺寸
	$!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
	x::ControlSend,,+x ;查看器模式-裁剪
	c::ControlSend,,!c ;复制到'''
	v::ControlSend,,!m ;移动到'''
	b::ControlSend,,+l ;L90
	CapsLock & b::ControlSend,,+s ;大小调整

	$!LButton::ControlSend,,!{Enter} ;属性
}
#IfWinActive
;****************************************************
;****************************************************
#If WinActive("PCHunter ahk_class #32770")
	CapsLock & r:: ;文件页->右键,强制删除
		SendInput,{Click,Right}
		Sleep,500
		ControlSend, , {Down 4}{Enter}
	return

	CapsLock & t:: ;进程页->右键,强制关闭进程树
		SendInput,{Click,Right}
		Sleep,500
		SendInput, {Down 12}{Enter 2}
	return

	CapsLock & d:: ;进程页->右键,定位到hunter目录
		SendInput,{Click,Right}
		Sleep,500
		SendInput, {Up 2}{Enter}
	return

	$F5::
	CapsLock & w:: ;进程页->右键,刷新
		SendInput,{Click,Right}
		Sleep,500
		SendInput, {Down 1}{Enter}
	return

	CapsLock & q:: ;进程页->右键,查看进程文件属性
		SendInput,{Click,Right}
		Sleep,500
		SendInput, {Up 3}{Enter}
	return

	CapsLock & c:: ;进程页->右键,复制进程名
		SendInput,{Click,Right}
		Sleep,500
		SendInput, {Up 7}{Enter}
	return

	CapsLock & v:: ;进程页->右键,复制进程路径
		SendInput,{Click,Right}
		Sleep,500
		SendInput, {Up 8}{Enter}
	return
#If
;****************************************************
;****************************************************
#IfWinActive ahk_exe acad.exe
{
	;布局之间切换
	;CapsLock & q::SendInput,^{PgUp}
	;CapsLock & a::SendInput,^{PgDn}
	$F3::^f	;F3对象捕捉	;屏蔽截图占用F3
	$!w:: ;定位到文件夹	;2023/08/01 02:10
	{
		WinGetTitle, Title_acad, A
		Title_RegEx1:= LTrim(Title_acad, OmitChars := "AutoCAD 2022 - [")
		Title_RegEx2:= RTrim(Title_RegEx1, OmitChars := "]")
		;MsgBox, %Title_RegEx2%
		SendInput,!{Space}	;EVERYTHING
		Sleep, 100
		SendInput,%Title_RegEx2%{Enter}
		Sleep, 100
		SendInput,^{Enter}
		WinMinimize, A
	}
	return
}
#IfWinActive
;****************************************************
;****************************************************
#IfWinActive ahk_exe SUMo.exe
{
	$MButton:: ;打开文件夹
	{
		SendInput,{Click,Right}
		Sleep,100
		SendInput, {Up 4}{Enter}
	}
	return
}
#IfWinActive
;****************************************************
;****************************************************
#IfWinActive 极连快传 ahk_exe munify.exe
{
	;右键在文件夹中显示
	$MButton::
	{
		SendInput,{Click,Right}
		Sleep 100
		SendInput ,{Up 1}{Enter}
		Sleep 500
	}
	return
;****************************************************
	;右键删除
	!d::
	$!MButton::
	{
		SendInput,{Click,Right}
		Sleep 100
		SendInput,{Down 1}{Enter}
		Sleep 100
	}
	return
;****************************************************
	!f::
	{
		360JL_path = % "G:\TDownload\360Download\360下载\Doc\360JiLianFiles\" . fun_GetFormatTime("yyyy-MM")
		Run,"%COMMANDER_EXE%" /T /O /S /R="%360JL_path%"
		Sleep 500
		MyWinWaitActive("ahk_class TTOTAL_CMD")
	}
	return
}
#IfWinActive
;****************************************************
;****************************************************
;股票软件
#IfWinActive ahk_exe mainfree.exe	;东方财富
	$!f:: ;可转债
		Click, 285, 18	;点击菜单行情（Q）
		SendInput, {Down 14}
		Sleep,100
		SendInput, {Right 1}
		Sleep,100
		SendInput, {Down 8}
		Sleep,100
		SendInput, {Right 1}
		Sleep,100
		SendInput, {Down 1}{Enter}
	return
;****************************************************
	$F3::ControlSend,,{F3}	;F3=上证, F4=深证
	~$MButton::Send,{F6} ;自选股
	$!z::Send, {Insert}{Enter}	;一键加入自选股
	CapsLock & z::Send,{Insert}	;加入自选股/板块
	CapsLock & b::	;标记①
		SendInput,{Click,Right}
		SendInput,{Down 7}
		SendInput,{Right}
		SendInput,{Down 2}{Enter}
	return
	CapsLock & w::Send,{F7} ;条件选股
;****************************************************
	$!w:: ;导出数据
	$!c:: ;导出数据
		SendInput,{Click,Right}
		SendInput,{Down 8}
		SendInput,{Right}{Down}{Enter}
		;Click, 415 100,导出对话 ahk_class #32770
	return

	CapsLock & q::SendInput,{PgUp}	;20240301
	CapsLock & a::SendInput,{PgDn}	;20240301

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,{Escape}"
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Enter}"
		gosub,Sub_MouseClick123
	return
#IfWinActive
;****************************************************
;****************************************************
#IfWinActive ahk_exe Tdxw.exe	;通达信
	$!f:: ;可转债Send,kzz{Enter}
		Click, 10 10
		Send, {Down 4}{Right 1}
		Send, {Down 1}{Right 1}
		Send, {Up 5}{Right 1}
		Send, {Up 6}{Enter}
	return
;****************************************************
	$F3::ControlSend,,{F3}	;F3=上证, F4=深证
	~$MButton::Send,{F6} ;自选股
	$!z::ControlSend,,!z	;一键加入自选股
	CapsLock & z::Send,^z	;加入自选股/板块
	; $!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
	CapsLock & b::	;标记①
		SendInput,{Click,Right}
		SendInput,{Up 6}
		SendInput,{Right}
		SendInput,{Down 1}{Enter}
	return
	CapsLock & w::Send,^t ;条件选股
;****************************************************
	$!w:: ;导出数据
	$!c:: ;导出数据
		Click, 10 10
		Send, {Down 1}{Right 1}
		Send, {Down 2}{Enter}	;Send, 34{Enter}
	return
;****************************************************
	$!t:: ;股池
	$!g:: ;股池
		SendInput, {Text}78
		Sleep,100
		SendInput, {Enter}
	return
;****************************************************
	$!s:: ;下载数据
		Click, 10 10
		Send, {Down 1}{Right 1}
		Send, {Up 6}{Enter}
		WinActivate, 数据下载 ahk_class #32770
		Sleep,1500
		SetControlDelay -1
		ControlClick, Button1,数据下载 ahk_class #32770,,,, NA
		Sleep,100
		ControlClick, Button9,数据下载 ahk_class #32770,,,, NA
	return

	CapsLock & q::SendInput,{PgUp}	;20240301
	CapsLock & a::SendInput,{PgDn}	;20240301

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}"
		GV_KeyClickAction2 := "SendInput,{Escape}"
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Enter}"
		gosub,Sub_MouseClick123
	return
#IfWinActive
;****************************************************
;****************************************************
;打开扫描仪进行扫描
#If WinActive("ahk_exe explorer.exe") or WinActive("ahk_class AcrobatSDIWindow")
/*	$!#c::	;系统扫描仪进行扫描
	{
		WinActivate, Program Manager ahk_class Progman
		Click, 854, 30 Left, , Down
		Sleep,50
		Click, 854, 30 Left, , Up
		Sleep,50
		SendInput ,{AppsKey}
		Sleep,1000
		ControlSend, SysListView321, {t Down}, Program Manager ahk_class Progman
		Sleep,50
		ControlSend, SysListView321, {t Up}, Program Manager ahk_class Progman
		Sleep, 200
		ControlSend, SysListView321, {Enter Down}, Program Manager ahk_class Progman
		Sleep,50
		ControlSend, SysListView321, {Enter Up}, Program Manager ahk_class Progman
		Sleep,50

		WinActivate, 新扫描 ahk_class #32770
		Click, 1115, 780, 0
		ControlSend, Button1, {s Down}, 新扫描 ahk_class #32770
		Sleep,50
		ControlSend, Button1, {s Up}, 新扫描 ahk_class #32770
		Sleep, 16000

		WinActivate, 导入图片和视频 ahk_class #32770
		Click, 148, 134 Left, , Down
		Sleep,50
		Click, 148, 134 Left, , Up
		Sleep,50
		ControlSend, Edit1, {Tab Down}, 导入图片和视频 ahk_class #32770
		Sleep,50
		ControlSend, Edit1, {Tab Up}, 导入图片和视频 ahk_class #32770
		Sleep,50
		ControlSend, Button1, {m Down}, 导入图片和视频 ahk_class #32770
		Sleep,50
		ControlSend, Button1, {m Up}, 导入图片和视频 ahk_class #32770
		Sleep,5000

		scan_path = % "E:\Users\Tuutg\Pictures\扫描文件\" . fun_GetFormatTime("yyyy-MM-dd")
		Run , "%scan_path%"
		Sleep 500
		Run,"%COMMANDER_EXE%" /T /O /S /R="%scan_path%"
		Sleep 500
		MyWinWaitActive("ahk_class TTOTAL_CMD")
	}
	return
*/
;****************************************************
	;打开Adobe PDF进行扫描
	$^#+s::
	IfWinNotExist, ahk_class AcrobatSDIWindow
	{
		Software="D:\Program Files (x86)\Adobe\Acrobat DC 2022\Acrobat DC\Acrobat\Acrobat.exe"
		Run, %Software%
		Sleep,1000
		gosub AdobePDF_scan
	}
	else
	{
		gosub AdobePDF_scan
	}
	return
#If
;****************************************************
AdobePDF_scan:
	WinActivate ahk_class AcrobatSDIWindow
	Sleep,250
	ControlClick, AVL_AVView49	; 主页|扫描
	Sleep,100
	SendInput,!v
	Sleep,500
	SendInput,t
	Sleep,100
	SendInput,{Down 6}
	Sleep,100
	SendInput,{Right}
	Sleep,100
	SendInput,{Enter}
	Sleep,100
	WinGetPos, x, y,lengthA,hightA, A
	CoordWinClick(lengthA/2+85,415)	; 扫描文档
	Sleep,100
	CoordWinClick(lengthA/2-20,595)	; 开始扫描
	Sleep,100
	CoordWinClick(lengthA/2-170,788)	; 扫描
	Sleep, 22000
	; 保存
	scan_path := "E:\Users\Tuutg\Pictures\扫描文件\PDF扫描\"
	WinGetTitle, Title, ahk_class AcrobatSDIWindow
	ControlFocus, AVL_AVView35, ahk_class AcrobatSDIWindow
	Sleep 100
	SendInput,^s
	Sleep,100
	ControlFocus,Edit2,另存为 PDF ahk_class #32770
	SendInput,%scan_path%
	Sleep,100
	SendInput,{Enter}
	ControlFocus,Edit1,另存为 PDF ahk_class #32770
	Title1:= RTrim(Title, OmitChars := " .PDF - Adobe Acrobat Pro DC (32-bit) " ) . "-" . fun_GetFormatTime( "yy-MM-dd HH-mm-ss" )
	Title2:= "Scan" . "-" . fun_GetFormatTime( "yy-MM-dd HH-mm-ss" )
	SendInput,%Title2%
	Sleep,500
	ControlClick,Button4,另存为 PDF ahk_class #32770
	; 打开扫描保存目录
	Run , "%scan_path%"
return
;****************************************************
;****************************************************
#If (WinActive("ahk_class AcrobatSDIWindow") and (A_CaretX ="") and (A_Cursor != "IBeam"))

$!g::ControlSend,,^f	;页面查找

$!s:: ;AdobePDF_图章
{
	ControlClick, AVL_AVView49
	Sleep,100
	Click,140,38		;点击视图菜单
	Sleep,500
	SendInput,t			;点击工具菜单
	Sleep,100
	SendInput,{up 5}	;AdobePDF_图章
	Sleep,100
	SendInput,{Right}
	Sleep,100
	SendInput,{Enter}
return
}
;****************************************************
$!b:: ;AdobePDF_保护
{
	ControlClick, AVL_AVView49
	Sleep,100
	Click,140,38		;点击视图菜单
	Sleep,500
	SendInput,t			;点击工具菜单
	Sleep,100
	SendInput,{up 2}	;AdobePDF_保护
	Sleep,100
	SendInput,{Right}
	Sleep,100
	SendInput,{Enter}
	Sleep,100
return
}
;****************************************************
CapsLock & b:: ;AdobePDF_替换页面
{
	SendInput,{Click,Right}
	Sleep,100
	SendInput,r
	Sleep, 200
	SendInput,^g	;QuickJump或Listary跳转
	Sleep,100
	SendInput,{tab}
	Sleep,2000
	SendInput,{Down 18}
	Sleep,100
	SendInput,{Enter}
return
}
;****************************************************
CapsLock & x:: ;AdobePDF_页面标签
{
	SendInput,{Click,Right}
	Sleep,100
	SendInput,b
	Sleep,100
return
}
;****************************************************
CapsLock & t:: ;AdobePDF_提取页面
{
	SendInput,{Click,Right}
	Sleep,100
	SendInput,x
	Sleep, 200
	SendInput,!e
	Sleep,100
	SendInput,{Enter}
	Sleep,100
	SendInput,^g	;QuickJump或Listary跳转
	Sleep,100
return
}
;****************************************************
CapsLock & g::^+i	;AdobePDF_插入页面
;****************************************************
$^+c::				;从剪切板插入页面
{
	SendInput,{Click,Right}
	Sleep,100
	SendInput,nc
	SendInput,{Enter}
return
}
;****************************************************
$!e::SendInput,!ei	;AdobePDF_菜单编辑
;****************************************************
;D->J->P
$+!LButton::	;PDF在jpg前,所以用LButton
$^+LButton::
$^#!d::SendInput,!fhr ;另存为较小的PDF

$+!MButton::	;中键
$^+MButton::
$^#!j::SendInput,!ftij	;导出为JPG

$+!RButton::
$^+RButton::
$^#!p::SendInput,!ftip	;导出png

$^#!w::SendInput,!ftww ;导出为word
$^#!e::SendInput,!ftse ;导出为excel
$^#!t::SendInput,!ftt ;导出为PPt
$^#!c::SendInput,!ftc ;导出为文本
$^#!l::SendInput,!ftL ;导出为纯文本

;****************************************************

~$q::SendInput,^5		;显示/隐藏线条粗细
~$w::SendInput,^+{NumpadSub}	;向左旋转
~$e::SendInput,^{NumpadAdd}	;+,放大
~$r::SendInput,^+{NumpadAdd}	;向右旋转
~$t::SendInput,^r		;显示/隐藏标尺

~$a::SendInput,^s		;保存|另存
~$s::SendInput,{PgUp}		;上一页
~$d::SendInput,^{NumpadSub}	;-,缩小
~$f::SendInput,{PgDn}		;下一页
~$g::SendInput,^+n		;转到页面

~$z::SendInput,^0		;适合页面
~$x::SendInput,{F8}		;显示/隐藏工具栏
~$c::SendInput,^l		;进入/退出全屏
~$v::SendInput,{F4}		;进入/退出导航窗格
~$b::SendInput,+{F4}}	;显示/隐藏工具窗格

#If
;****************************************************
;****************************************************
;Snipaste
#If WinActive("Snipaste ahk_exe Snipaste.exe")
{
	CapsLock & 1::SendInput,^1	;矩形/椭圆
	CapsLock & 2::SendInput,^2	;折线
	CapsLock & 3::SendInput,^3	;画笔
	CapsLock & 4::SendInput,^4	;记号笔
	CapsLock & 5::SendInput,^5	;马赛克
	CapsLock & 6::SendInput,^6	;文字

	Space & a::SendInput,^1	;矩形/椭圆
	Space & s::SendInput,^2	;折线
	Space & d::SendInput,^3	;画笔
	Space & f::SendInput,^4	;记号笔
	Space & g::SendInput,^5	;马赛克
	Space & M::SendInput,^5	;马赛克

	Space & r::SendInput,^5	;马赛克

	Space & 5::
	Space & t::SendInput,^6	;文字

	Space & y::SendInput,^y	;重做 ctrl+Y
	Space & z::SendInput,^z	;撤销 ctrl+Z
	; CapsLock & z::SendInput,^z	;撤销,Capstg默认
	$!+z::ControlSend,,^y	;重做,屏蔽火绒弹窗拦截冲突
	Space & x::SendInput,{Enter}	;{Enter}
	Space & c::SendInput,^c	;复制 ctrl+c
	$!c::SendInput,^c		;复制 ctrl+c
	Space & v::SendInput,^y	;重做 ctrl+Y
	Space & b::SendInput,^3 	;画笔
	Space & q::SendInput,^4	;记号笔

	Space & w::
	CapsLock & w::SendInput,^s	;保存 ctrl+S

	$Space::SendInput,{Blind}{Space} ;恢复{Space}默认打字功能

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,^c{Escape}{Enter}"	;快速退出
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return
}
#If
;****************************************************
#If WinActive("图像 ahk_class #32770")
	$Space::SendInput,{Blind}{Space}	;恢复{Space}打字功能.20240108
#If
;****************************************************
;只在PixPin钉图界面有效,启用Space模式
#If WinActive("PixPin ahk_exe PixPin.exe")
{	; 适用于1.2.0.0以下版本
	; ΔX :=(lengthA-x)/i, ΔY :=hightA-y
	; ::PixPinToolsClick(1)	;打钩
	; ::PixPinToolsClick(2)	;ctrl+Y
	; ::PixPinToolsClick(3)	;ctrl+Z
	; ::PixPinToolsClick(4)	;橡皮擦
	; ::PixPinToolsClick(5)	;文字
	; ::PixPinToolsClick(6)	;马赛克
	; ::PixPinToolsClick(7)	;记号笔
	; ::PixPinToolsClick(8)	;铅画笔
	; ::PixPinToolsClick(9)	;标序号
	; ::PixPinToolsClick(10) ;标箭头
	; ::PixPinToolsClick(11) ;折线
	; ::PixPinToolsClick(12) ;矩形/椭圆
;****************************************************
	$^1::
	CapsLock & 1::
	; Space & a::PixPinToolsClick(12)	;矩形/椭圆
	Space & a::SendInput,+1				;矩形/椭圆

	$^2::
	CapsLock & 2::
	; Space & s::PixPinToolsClick(11)	;折线
	Space & s::SendInput,+2				;折线

	$^3::
	CapsLock & 3::
	; Space & d::PixPinToolsClick(10)	;标箭头
	Space & d::SendInput,+3 			;标箭头

	$^4::
	CapsLock & 4::
	; Space & f::PixPinToolsClick(9)	;标序号
	Space & f::SendInput,+4 			;标序号

	$^5::
	CapsLock & 5::
	; Space & g::PixPinToolsClick(8)	;铅画笔
	Space & g::SendInput,+5 			;铅画笔

	$!g::SendInput,^!g					;GIF录制
;****************************************************
	$^6::
	Space & 5::
	CapsLock & 6::
	; Space & b::PixPinToolsClick(7)	;记号笔
	Space & b::SendInput,+6 			;记号笔

	$^7::
	Space & 4::
	CapsLock & 7::
	; Space & r::PixPinToolsClick(6)	;马赛克
	Space & m::SendInput,+7 			;马赛克
	Space & r::SendInput,+7 			;马赛克

	$^8::
	Space & 3::
	CapsLock & 8::
	; Space & t::PixPinToolsClick(5)	;文字
	Space & t::SendInput,+8 			;文字

	$^9::
	Space & 2::
	CapsLock & 9::
	; Space & e::PixPinToolsClick(4)	;橡皮擦
	Space & e::SendInput,+9 		;橡皮擦

	Space & w::
	CapsLock & w::SendInput,^s		;保存 ctrl+S

	Space & q::SendInput,+5 		;铅(q)画笔
;****************************************************
	Space & z::SendInput,^z		;撤销 ctrl+z
	; CapsLock & z::SendInput,^z  	;撤销,Capstg默认
	Space & x::SendInput,^!x		;长截屏
	Space & c::SendInput,^c		;复制 ctrl+c
	$!c::SendInput,^+c			;复制纯文本ctrl+shift+c
	Space & v::			;重做 ctrl+Y
	Space & y::			;重做 ctrl+Y
	$!+z::ControlSend,,^y		;重做,屏蔽火绒弹窗拦截冲突
	; Space & b::SendInput,+6 		;记号笔
;****************************************************
	$Space::SendInput,{Blind}{Space}	;恢复{Space}默认打字功能

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,^c{Escape}{Enter}"	;快速复制并退出
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return
}
#If
;****************************************************
	~$F1::	;截图|贴图OCR|复制
		SendInput,{F1}  ; 发送Pixpin截图快捷键

		Clipboard := "" ; 清空剪切板

		Loop
			{
				If GetKeyState("LButton", "P") || GetKeyState("MButton", "P")
				{
					Break
				}
				Sleep, 100
			}

		; 等待鼠标弹起
		Loop
		{
			If !GetKeyState("LButton", "P") && !GetKeyState("MButton", "P")
			{
				Break
			}
			Sleep, 100
		}

		WinGetPos, x, y,lengthA,hightA, A
		Sleep, 100
		Click, lengthA/2, hightA/2
		Sleep, 100
		SendInput,^c
	return
;****************************************************
;****************************************************
;直接打印/选定打印机打印
#IfWinActive ahk_group Group_打印
{
	$MButton::SendInput,{Enter} ;盲点打印

	$+LButton::	;杨磊彩色打印机
	{
		SendInput,{Home}
		Sleep,100
		SendInput,{Right}
		Sleep,100
	}
	return

	$!LButton::SendInput,{Left}{up}	 ;MP 2014打印机
	$!RButton::SendInput,{up 4}	;Acrobat选定MP 2014打印机
}
#IfWinActive
;****************************************************
;****************************************************
;Listary 5 选项, 双击右键盲点确定/取消/应用
#If WinActive("Listary 选项 ahk_class Listary_WidgetWin_0") or WinActive("Listary 选项 ahk_class Listary_WidgetWin_1")
{
	$RButton::
	{
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "gosub,Apply_Listary" ;点击确定
		GV_MouseButton := 2
		GV_LongClickAction := "gosub,Escape_Listary" ;点击取消
		gosub,Sub_MouseClick123
	}
	return
}
#If
;****************************************************
Ok_Listary:
	CoordMode, Mouse, Window
	Click , 550,675
return

Escape_Listary:
	CoordMode, Mouse, Window
	Click , 645,675
return

Apply_Listary:
	CoordMode, Mouse, Window
	Click , 745,675
return
;****************************************************
;Listary搜索框增强,Listary5|6通用
#If WinActive("ahk_group Group_ListarySearchBox")
	CapsLock & r::	 ;Ctrl+A/清空搜索框
		SendInput,^a
		Sleep, 100
		SendInput,{Del}
	return
;****************************************************
	;默认^{Enter},在默认资管(win系统)中定位到文件,即光标在文件上;20240114
	$!s::SendInput,^{Enter}
	$MButton::SendInput,^{Enter}
	CapsLock & w::SendInput,^{Enter}
;****************************************************
	;打开文件夹,默认^{Enter},并在TC中定位到文件,即光标在文件上,;20240113
	$!w:: ;选中,即光标在文件上
	; CapsLock & w:: ; 用idm,快速save
		Clipboard=""
		SendInput,^+c	;复制文件路径
		Sleep,500
		; EzTip(Clipboard,1)
		;这里改成自己对应的路径
		Run,"%COMMANDER_EXE%" /T /O /S /L="%Clipboard%"
		Sleep,500
		MyWinWaitActive("ahk_class TTOTAL_CMD")
	return
;****************************************************
	;Listary搜索框中,单击Caps={Ctrl 2},双击快速切换到ListaryPro6.3的文件窗口
	CapsLock::
		Suspend Permit
		if (WinActive("Listary ahk_exe Listary.exe")){ ;在Listary6.3文件搜索窗口
			WinGetPos,x,y,lengthA,hightA,Listary ahk_exe Listary.exe
			GV_KeyClickAction1 :="gosub,ListaryFileToLauncher" ;文件搜索->启动器
			;GV_KeyClickAction1 :="SendInput,{Ctrl}"  ;ListaryPro5,3次^,TC启动器
			GV_KeyClickAction2 :="gosub,Listary" ;ListaryPro6.3,退出文件搜索窗口
			gosub,Sub_KeyClick123
		}
		else {	;不在Listary6.3文件搜索窗口
			GV_KeyClickAction1 :="gosub,Listary" ;ListaryPro5,3次^,TC启动器
			;GV_KeyClickAction1 :="SendInput,{Ctrl}" ;ListaryPro5,3次^,TC启动器
			GV_KeyClickAction2 :="gosub,Listary" ;ListaryPro6.3,4次^文件搜索窗口
			gosub,Sub_KeyClick123
		}
	return

	ListaryFileToLauncher:
		WinGetPos,x,y,lengthA,hightA,Listary ahk_exe Listary.exe
		; EzTip(lengthA-170,1)
		CoordWinClick(lengthA-170,15) ;返回启动器按钮
	return
;****************************************************
	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,{Escape}"  ;发送取消|退出
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return

	/*;QuickLook预览,win7 and Win10,Listary5打开,Listary6关闭
	$!q::	;QuickLook预览
		Clipboard=""
		SendInput,^+c	;复制文件路径
		Sleep,500
		; EzTip(Clipboard,1)
		; 这里改成自己对应的路径
		Run,"%RunCaptX%\GreenTools\QuickLook\QuickLook.exe" "%Clipboard%"
	return
	*/
#if
;****************************************************
#If WinActive("ahk_exe Listary.exe")
	$!q::ControlSend,,!q   ;工具栏->预览,Listary6打开,Listary5关闭
	; $!w::ControlSend,,!w ;工具栏->打开文件夹
	$!e::ControlSend,,!e	;动  作->关键字
	$!r::ControlSend,,!r	;工具栏->最近文档
	$!t::ControlSend,,!t	;工具栏->Edit Notepad++

	$!a::ControlSend,,!a	;工具栏->智能命令|Atom
	; $!s::ControlSend,,!s	;动  作->发送到..
	$!d::ControlSend,,^d	;工具栏->收藏
	; $!f::ControlSend,,!f	;工具栏->打开方式
	$!g::ControlSend,,!g	;工具栏->切换到程序安装目录

	$!z::ControlSend,,^d	;工具栏->收藏
	; $!x::ControlSend,,!x	;预留给Anytext
	$!c::ControlSend,,!c	;打开动作
	$!v::ControlSend,,!v	;动  作->Vim
	$!b::ControlSend,,!b	;工具栏->浏览程序安装目录|Bash
#If
;****************************************************
;****************************************************
#If WinActive("uTools ahk_class Chrome_WidgetWin_1")
	CapsLock & r::	 ;Ctrl+A/清空搜索框
		SendInput,^a
		Sleep, 100
		SendInput,{Del}
	return
#If
;****************************************************
#IfWinActive 文本代码对比 ahk_class Chrome_WidgetWin_1	;uTools_diff
{
	CapsLock & q:: ;向上翻页
	{
	if (GV_KeyClick_Continuous(300)){
		SendInput,{PgUp} ;向上翻页
	}
	else {
		Click,460,80 ;上一处差异
	}
	return
	}
;****************************************************
	CapsLock & a:: ;向下翻页
	{
	if (GV_KeyClick_Continuous(300)){
		SendInput,{PgDn} ;向下翻页
	}
	else {
		Click,500,80 ;下一处差异
	}
	return
	}
}
#IfWinActive
;****************************************************
;****************************************************

; $^+#z::ClickPicture("D:\RunCaptX\RunPlugins\Test\wxtz\wxtz.png", 1, 0,false,false)

;模擬滑鼠點擊圖片
ClickPicture(ImageFilePath,ClickCount:=1,Speed:=0,return:=true,ShowError:=true){
	pos:=GetPicturePosition(ImageFilePath)
	if %pos%{
		posX:=pos[1]
		posY:=pos[2]
		ClickPosition(posX,posY,ClickCount,Speed,,return)
		return [posX,posY]
	}else {
	if %ShowError% {
		MsgBox 畫面中找不到圖片`n %ImageFilePath%
	}
	return false
	}
}
;****************************************************
;模擬滑鼠點擊
ClickPosition(posX,posY,ClickCount:=1,Speed:=0,CoordMode:="Screen",Return:=true){
	;若使用相對模式
	if (CoordMode="Relative"){
		CoordMode,Mouse,Screen
		MouseGetPos, posX_i, posY_i ;儲存原來的滑鼠位置
		;根據點擊次數是否為零來使用MouseClick或MouseMove
	if %ClickCount%{
		MouseClick,,%posX%,%posY%,%ClickCount%,%Speed%,,R ;點擊相對位置
	}else {
		MouseMove, %posX%, %posY%,%Speed%
	}
	;若使用其他模式
	}else {
		CoordMode,Mouse,%CoordMode%
		MouseGetPos, posX_i, posY_i ;儲存原來的滑鼠位置
		;根據點擊次數是否為零來使用MouseClick或MouseMove
	if %ClickCount%{
		MouseClick,,%posX%,%posY%,%ClickCount%,%Speed%
	}else {
		MouseMove, %posX%, %posY%,%Speed%
	}
	}
	;是否點擊後返回
	if %return%{
		MouseMove, %posX_i%, %posY_i%,%Speed%
	}
	return
}
;****************************************************
;獲取圖片的位置
GetPicturePosition(ImageFilePath){
	Gui,add,picture,hwndmypic,%ImageFilePath%
	ControlGetPos,,,width,height,,ahk_id %mypic%
	CoordMode Pixel
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight,%ImageFilePath%
	CoordMode Mouse
	if %FoundX%{
		return [FoundX+width/2,FoundY+height/2]
	} else {
		return FoundX
	}
}
;****************************************************
;****************************************************
#IfWinActive ahk_exe tagLyst.exe
	F1::Click , 25,50	;切换显示左侧边栏
	$F3::^f	;Ctrl+F进行关键字查找
	$!f::SendInput,^n	;添加新的文件或文件夹
	CapsLock & w::^n ;添加新的文件或文件夹
	$!r::SendInput,^{F5}	;重设筛选条件并刷新结果

	CapsLock & r::
	{
		if (GV_KeyClick_Continuous(300)){
			SendInput,{F5} ;刷新结果
		}
		else {
			SendInput,{Del}	;删除
		}
	}
	return

	CapsLock & t::
	{
		if (GV_KeyClick_Continuous(300)){
			SendInput,+{Del} ;彻底删除
		}
		else {
			SendInput,{BackSpace}	;上级目录
		}
	}
	return

	$!s::SendInput,^{Enter}	;资管打开当前选中文件

	$RButton::
	{
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,{BackSpace}" ;上级目录
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;点击取消
		gosub,Sub_MouseClick123
	}
	return

	CapsLock & f::Click , 1090,650	;导入文件 2023/07/10 16:43
	CapsLock & s::Click , 1000,650	;引用文件 2023/07/10 16:43
	CapsLock & g::Click , , 2	 ;左键双击,打开

	~Enter::
	~MButton::
	{
		ClickPicture("%RunCaptX%\RunPlugins\Test\tag\完成.png", 1, 0,true,false)	;完成
		ClickPicture("%RunCaptX%\RunPlugins\Test\tag\确定.png", 1, 0,true,false)	;确定
		ClickPicture("%RunCaptX%\RunPlugins\Test\tag\保存.png", 1, 0,true,false)	;保存
		ClickPicture("%RunCaptX%\RunPlugins\Test\tag\S&O.png", 1, 0,true,false)		;保存并打开
		ClickPicture("%RunCaptX%\RunPlugins\Test\tag\Clink.png", 1, 0,true,false)	;创建引用链接
		;ClickPicture("%RunCaptX%\RunPlugins\Test\tag\S&M.png", 1, 0,true,false)	;开始移动
	}
	return
#IfWinActive
;****************************************************
;****************************************************
MouseNotUnder(Controls){
	MouseGetPos,,,, Control
	if Control != Controls
	return, true
}
;****************************************************
;****************************************************
#If WinActive("ahk_class 360ExplorerFrame") or WinActive("ahk_exe Q-Dir.exe") or WinActive("ahk_exe Q-Dir32.exe")
	$Space::
	if ((A_CaretX ="") and (A_Cursor != "IBeam")){	 ;非输入模式
		gosub, QuickLook	;QuickLook预览
	}
	else {			;输入模式
		SendInput,{Space}
	}
return
#If
;****************************************************
;****************************************************
;浏览器点击关闭按钮,将浏览器窗口最小化到任务栏
; 定义一个函数，用于将浏览器窗口最小化
; 定义一个函数，用于模拟鼠标点击
ClickMouse(x, y)
{
	Click, x, y, 1 ; 1 表示左键点击
}

#If WinActive("ahk_group Group_browser")
	WinGetPos, x, y, lengthA, hightA, A
	CloseButtonX := %lengthA%-33 ; 根据实际情况调整关闭按钮的X坐标
	CloseButtonY := %y%+10 ; 根据实际情况调整关闭按钮的Y坐标
	ClickCloseButton := ClickMouse(CloseButtonX, CloseButtonY)
	; 将最小化操作绑定到关闭按钮的点击事件
	^!::ClickMouse(CloseButtonX, CloseButtonY)
	if ErrorLevel = 0 ; 如果模拟点击操作成功（即点击了关闭按钮），则调用最小化函数
	{
		WinMinimize, %BrowserTitle%
	}
#If
;****************************************************
;****************************************************
MyWinRunWaitActive(title){	;激活并左侧半屏显示
	CoordMode, Mouse, Window
	WinWait, %title%
	IfWinNotExist, %title%
	{
		Run, "C:\Windows\explorer.exe"
		WinActivate, %title%
		WinWaitActive, %title%
		WinMove, %title%, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	}
	else {
		WinActivate, %title%
		WinWait, %title%
		WinMove, %title%, , 0, 0, A_ScreenWidth/2-1, A_ScreenHeight-75
	}
	return
}
;****************************************************
;****************************************************
;Snipaste黑名单,修复snipaste快捷键强制占用,恢复其他软件,F1,F3默认功能
#If WinActive("ahk_group Group_code")
	$F1::ControlSend,,{F1}
	$F3::ControlSend,,{F3}
#If
;****************************************************
#If WinActive("ahk_group Group_disableSnipaste")
	; $F1::ControlSend,,{F1}
	$F3::ControlSend,,{F3}
#If
;****************************************************
;Runany黑名单,修复Runany快捷键`强制占用,恢复其他软件`默认功能,如Listary
#If WinActive("ahk_group Group_disableRunany")
	$`::SendInput, `` ;屏蔽Runany快捷键`
#If
;****************************************************
;****************************************************
;排除ahk_class Photoshop, ahk_exe Acrobat.exe
;GridMove,切换窗口,半屏留空|留空录屏,用于键盘鼠标操作演示
#If !WinActive("ahk_group DisableGridMove")
Space & LButton::
$+!LButton::SendInput,^#!2	;切换窗口到左侧半屏

Space & RButton::
$+!RButton::SendInput,^#!3	;切换窗口到右侧半屏
#If
;****************************************************
Tab & LButton::
^#!a::SendInput,^#!2		;切换窗口到左侧半屏
^#!Left::SendInput,^#!2 	;切换窗口到左侧半屏

Tab & RButton::
^#!s::SendInput,^#!3		;切换窗口到右侧半屏
^#!Right::SendInput,^#!3	;切换窗口到右侧半屏
;****************************************************
;****************************************************
;任务管理器
#If WinActive("ahk_exe Taskmgr.exe")
	CapsLock & t::SendInput,{Del}{Enter}	;结束进程(E)

	CapsLock & r::	 ;结束进程树(T)
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 3}{Enter 2}
	return
#If
;****************************************************
;****************************************************
#If WinActive("ahk_exe BCompare.exe")	;Tuutg,20231220
	$MButton::SendInput,^s{Enter}

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,{BackSpace}"	;后退目录
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return

	$!RButton::SendInput,!{Right}	;前进目录

	$r::			;重命名|编辑
	if (A_Cursor = "IBeam"){	;输入模式
		SendInput,{r}
	}
	else {	;非输入模式
		SendInput,{F2}
	}
	return

	CapsLock & f::SendInput,^r	;复制到右边
	CapsLock & s::SendInput,^l	;复制到左边

	$f::
		if (A_Cursor = "IBeam"){	;输入模式
			SendInput,{f}
		}
		else {	;非输入模式
			SendInput,^r
		}
	return

	$s::
	if (A_Cursor = "IBeam"){	;输入模式
		SendInput,{s}
	}
	else {	;非输入模式
		SendInput,^l
	}
	return

	$e::
		if (A_Cursor = "IBeam"){	;输入模式
			SendInput,{e}
		}
		else {	;非输入模式
			SendInput,^p
		}
	return

	$d::
	if (A_Cursor = "IBeam"){	;输入模式
		SendInput,{d}
	}
	else {	;非输入模式
		SendInput,^n
	}
	return

	CapsLock & q::SendInput,^p	;上一个差异,20231209
	CapsLock & a::SendInput,^n	;下一个差异,20231209

	$^enter::		;文件夹比较|属性设置
	$!MButton::
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Up}{Enter}
		Sleep,100
		SendInput,r
	return

	$!LButton::	;资管打开|编辑
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{up}{Enter}
		Sleep,100
		SendInput,o
	return

	$!w::SendInput,^s	;保存文件

	CapsLock & w:: 	;保存文件|会话
		if (GV_KeyClick_Continuous(300)){
			SendInput,^+s 		;保存会话
		}
		else {
			SendInput,^s 		;保存文件
		}
	return

	CapsLock & b:: 	;保存文件|会话
		if (GV_KeyClick_Continuous(300)){
			SendInput,^+b 		;三方比较<-
		}
		else {
			SendInput,^b 		;三方比较->
		}
	return
#If
;****************************************************
;****************************************************
#If WinActive("ahk_exe uc.exe")
	$MButton::SendInput,^s{Enter}

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,!{Left}"	;后退目录
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return

	; $!RButton::SendInput,!{Right}	;前进目录

	CapsLock & f::SendInput,!{Right}	;复制到右边
	CapsLock & s::SendInput,^{Left}	;复制到左边

	CapsLock & q::SendInput,{F4}	;上一个差异
	CapsLock & a::SendInput,{F3}	;下一个差异

	$^enter::		;会话设置|F5刷新
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Up}{Enter}
	return

	$!MButton::	;资管打开2
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Up  4}{Enter}
	return

	$!LButton::	;资管打开1
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{up  5}{Enter}
	return

	$!w::SendInput,^s	;保存文件

	CapsLock & w:: 	;保存文件|会话
		if (GV_KeyClick_Continuous(300)){
			SendInput,^+s 		;保存会话
		}
		else {
			SendInput,^s 		;保存文件
		}
	return
#If
;****************************************************
;****************************************************
#If WinActive("ahk_exe WinMergeU.exe")	;Tuutg,20231220
	$MButton::SendInput,^s{Enter}

	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,{BackSpace}"	;后退目录
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return

	; $!RButton::SendInput,!{Right}	;前进目录

	CapsLock & f::SendInput,^!{Right}	;复制到右边并前进
	CapsLock & s::SendInput,^!{Left}	;复制到左边并前进

	CapsLock & q::SendInput,!{Up}	;上一个差异
	CapsLock & a::SendInput,!{Down}	;下一个差异

	; $^enter::		;默认程序编辑
	; $!MButton::
		; SendInput,{Click,Right}
		; Sleep,100
		; SendInput,{Up}{Enter}
		; Sleep,100
		; SendInput,er
	; return

	$!RButton::	;资管打开
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{up 2}{Enter}
		Sleep,100
		SendInput,{Left}{up}{Enter}
	return

	$!w::SendInput,^s	;保存文件

	CapsLock & w:: 	;保存文件|会话
		if (GV_KeyClick_Continuous(300)){
			SendInput,!fv 		;保存会话
		}
		else {
			SendInput,^s 		;保存文件
		}
	return
#If
;****************************************************
;****************************************************
RunWechat:	;一键启动微信
	; 定义一个数组来存储微信的安装路径
	wechat1 := "C:\Program Files\Tencent\WeChat\WeChat.exe"
	wechat2 := "D:\Program Files\Tencent\WeChat\WeChat.exe"
	wechat3 := "E:\Program Files\Tencent\WeChat\WeChat.exe"
	wechat4 := "F:\Program Files\Tencent\WeChat\WeChat.exe"
	wechat5 := "G:\Program Files\Tencent\WeChat\WeChat.exe"
	wechat6 := "C:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
	wechat7 := "D:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
	wechat8 := "E:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
	wechat9 := "F:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
	wechat10:= "G:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
	wechat11 := "%Wx_Path%"	;如果不在默认位置, 手动填写安装路径
	wechatPaths:= [wechat1,wechat2,wechat3,wechat4,wechat5,wechat6,wechat7,wechat8,wechat9,wechat10,wechat11]

	; 遍历数组中的每个路径，并启动微信
	loop, % wechatPaths.MaxIndex()
	{
		; 检查当前索引的路径是否存在
		IfExist, % wechatPaths[A_Index]
		{
			Run, % wechatPaths[A_Index]
			Sleep, 1000 ; 等待1秒
		}
	}
return
;****************************************************
;****************************************************
; ACDSee.exe,20231216
#If WinActive("ahk_exe ACDSee.exe")
	CapsLock & s::SendInput,{PgDn}
	CapsLock & f::SendInput,{PgUp}
#If
;****************************************************
;****************************************************
; Win11系统默认图片查看器
#If WinActive(" ‎- 照片 ahk_class ApplicationFrameWindow") and ((A_CaretX ="") and (A_Cursor != "IBeam"))
	~$q::SendInput,f	;显示影片
	~$w::SendInput,^e	;编辑图像
	~$e::SendInput,^{NumpadAdd}	;放大|上
	~$r::SendInput,^r	;旋转图像
	~$t::SendInput,^l	;锁定界面
;****************************************************
	~$a::SendInput,^s    	;另保为
	~$s::SendInput,{Left}	;<-|左
	~$d::SendInput,^{NumpadSub}	;缩小|下
	$f::SendInput,{Right}	;->|右
	~$g::SendInput,^1	;1:1
;****************************************************
	~$z::SendInput,l	;+|-收藏夹
	~$x::			;调整图像大小
		SendInput,{Click,Right}
		Sleep,50
		SendInput,{Up 6}{Enter}
	return
	~$c::SendInput,^c	;复制
	~$v::			;创建视频
		SendInput,{Click,Right}
		Sleep,50
		SendInput,{Up 2}{Enter}
	return
	~$b::			;在资源管理器打开文件
		SendInput,{Click,Right}
		Sleep,50
		SendInput,{Up 3}{Enter}
	return
;****************************************************
	~$MButton::SendInput,^{0}	;缩放以适应
	$!LButton::SendInput,!{Enter}	;文件信息
	$!WheelUp::SendInput,{Left}	;<-,20231225
	$!WheelDown::SendInput,{Right}	;->,20231225

	$F4::	;打开方式
		SendInput,{Click,Right}
		Sleep,50
		SendInput,{Up 4}{Enter}
	return

	$!w::Click,30 20 1 	;浏览所有文件
#If
;****************************************************
;****************************************************
;Anytext搜索增强,搜索通用.20240116
#If WinActive("ahk_exe ATGUI.exe")
	CapsLock & r::	 ;Ctrl+A/清空搜索框
		SendInput,^a
		Sleep, 100
		SendInput,{Del}
	return
;****************************************************
	;默认^e,在默认资管(win系统)中定位到文件,即光标在文件上;20240114,
	$!s::SendInput,^e
	$MButton::SendInput,^e
;****************************************************
	;打开文件夹,默认^e,并在TC中定位到文件,即光标在文件上,;20240113
	$!w:: ;选中,即光标在文件上
	CapsLock & w:: ; 用idm,快速save
		Clipboard=""
		SendInput,{Right}
		Sleep,100
		SendInput,{Down 2} ;复制文件路径
		; EzTip(Clipboard,1)
		;这里改成自己对应的路径
		Run,"%COMMANDER_EXE%" /T /O /S /L="%Clipboard%"
		Sleep,500
		MyWinWaitActive("ahk_class TTOTAL_CMD")
	return
;****************************************************
	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,{Escape}"  ;发送取消
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return

	$F4::	;F4Menu
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{F}{Enter}
	return

	CapsLock & f::
	if MouseUnder("Qt5QWindowIcon11"){
		SendInput,{Click,Right}{Down}
	} else{
		SendInput,{Right}
	}
return
#if
;****************************************************
;****************************************************
;FileLocatorPro.exe搜索增强,搜索通用.20240116
#If WinActive("ahk_exe FileLocatorPro.exe")
	CapsLock & r::	 ;Ctrl+A/清空搜索框
		SendInput,^a
		Sleep, 100
		SendInput,{Del}
	return
;****************************************************
	;默认+!r,在默认资管(win系统)中定位到文件,即光标在文件上;20240114,
	$!s::SendInput,+!r
	$MButton::SendInput,+!r
;****************************************************
	;打开文件夹,默认^e,并在TC中定位到文件,即光标在文件上,;20240113
	$!w:: ;选中,即光标在文件上
	CapsLock & w:: ; 用idm,快速save
		Clipboard=""
		SendInput,+!c	;复制文件路径
		; Clipboard=%Clipboard%
		EzTip(Clipboard,1)
		;这里改成自己对应的路径
		Run,"%COMMANDER_EXE%" /T /O /S /L="%Clipboard%"
		Sleep,500
		MyWinWaitActive("ahk_class TTOTAL_CMD")
	return
;****************************************************
	$RButton::
		GV_MouseTimer := 400
		GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
		GV_KeyClickAction2 := "SendInput,{Escape}"  ;发送取消
		GV_MouseButton := 2
		GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
		gosub,Sub_MouseClick123
	return

	$F4::	;F4Menu
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{F}{Enter}
	return

	CapsLock & f::
		if MouseUnder("BCGPGridCtrl.*"){
			SendInput,{Click,Right}{Down}
		} else{
			SendInput,{Right}
		}
	return
#if
;****************************************************
;****************************************************
; 火绒-文件解锁->解锁
#If WinActive("文件解锁 ahk_class HRFileUnlock")
	g::
	CapsLock & g::
		WinActivate,文件解锁 ahk_class HRFileUnlock
		Click,570 300 1	;解锁
		Sleep,100
		WinActivate,ahk_class ATL:010AED28
		Click,325 215 1 ;确定
	return
#If
;****************************************************
;****************************************************
; fupx.exe,20240124
#If WinActive("ahk_exe fupx.exe")
	CapsLock & g::
	$NumpadDot::	;压缩|.
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 1}{Enter}
	return

	$NumpadAdd::	;+
	$!a::SendInput,^a	;全部选择

	$NumpadSub::	;取消全部选择|-
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 9}{Enter}
	return

	$NumpadMult::	;反向|*
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 11}{Enter}
	return

	$NumpadDiv::	;取消选择|/
		SendInput,{Click,Right}
		Sleep,100
		SendInput,{Down 13}{Enter}
	return
#If
;****************************************************
;****************************************************
;XMind.exe,20240315
#If WinActive("ahk_exe XMind.exe") and (A_Cursor != "IBeam")
$!d::SendInput,^d		;复制->粘贴主题

$q::SendInput,^o 		;文件>打开
$w::SendInput,^t		;文件>新建
$e::SendInput,^`=		;+,放大
$r::SendInput,^r		;前往中心主题
$t::SendInput,^+t		;显|隐标签栏

$a::SendInput,^+s		;保存|另存
$s::SendInput,{PgUp}	;上一页
$d::SendInput,^`-		;-,缩小
$f::SendInput,{PgDn}	;下一页
$g::SendInput,^0		;缩放100%

$z::SendInput,^+f		;适合页面
$x::SendInput,^x 		;显示属性
$c::SendInput,^c		;复制
$v::SendInput,^v		;删除|不要
$b::SendInput,^!b		;标注
#If
;****************************************************
;****************************************************
;Win7默认看图器Photo_Lightweight_Viewer,20240313
#If WinActive("ahk_class Photo_Lightweight_Viewer")
$q::SendInput,{Click,Right}{h} ;显示打开方式
$w::SendInput,^`,		;向左旋转
$e::SendInput,{WheelUp}		;+,放大
$r:: ;SendInput,^`.		;向右旋转
	SendInput,{Click,Right}{l}{Enter}
return
$t::SendInput,{Click,Right}{h}{Enter} ;画图打开

$a::SendInput,!fk		;保存|另存
$s::SendInput,{Left}		;上一页
$d::SendInput,{WheelDown}	;-,缩小
$f::SendInput,{Right}		;下一页
$g::				;定位到系统
	SendInput,{Click,Right}{i}{Enter}
return

$z::SendInput,^!0			;适合页面
$x::SendInput,{Click,Right}{r}{Enter} 	;显示属性
$c::SendInput,^c			;复制
$v::SendInput,{del}			;删除|不要
$b::SendInput,{Click,Right}{k}{Enter} 	;设为背景

$RButton::
	GV_MouseTimer := 400
	GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
	GV_KeyClickAction2 := "SendInput,!{F4}"	;关闭取消
	GV_MouseButton := 2
	GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
	gosub,Sub_MouseClick123
return
#If
;****************************************************
;****************************************************
/*;Win7,ahk_exe mspaint.exe,系统画图,20240315
#If WinActive("ahk_exe mspaint.exe") and (A_CaretX ="") and (A_Cursor != "IBeam")
$q::SendInput,!fo 	;文件>打开
$w::SendInput,!hirol	;向左旋转
$e::SendInput,!vi	;+,放大
$r::SendInput,!hiror	;向右旋转
$t::SendInput,!ht 	;工具>文字

$a::SendInput,!fs	;保存|另存
$s::SendInput,{WheelUp} ;{Left}
$d::SendInput,!vo	;-,缩小
$f::SendInput,{WheelDown} ;{Right}
$g::SendInput,!vm	;缩放100%

$z::SendInput,!hm	;局部缩放
$x::SendInput,!hsh	;形状线条
$c::SendInput,!hec	;编辑颜色
$v::SendInput,!hser	;选择|同PS
$b::SendInput,!hb 	;笔刷工具

~$MButton::Send,^{0}	;缩放以适应
#If
*/
;****************************************************
;/*;Win11,ahk_exe mspaint.exe,系统画图,20240317
#If WinActive("ahk_exe mspaint.exe") and (A_CaretX ="") and (A_Cursor != "IBeam")
$q::SendInput,^o 		;文件>打开

$w::				;向左旋转
	BlockInput on
	WinGetPos, x, y,lengthA,hightA, A
	CoordWinMove(lengthA/2,hightA/2)
	SendInput,{Click,Right}
	Sleep,50
	SendInput,{Down 2}
	Sleep,50
	SendInput,{Right}
	Sleep,50
	SendInput,{Down}
	Sleep,50
	SendInput,{Enter}
	BlockInput Off
Return

$!w::SendInput,!w 		;重设大小

$e::SendInput,^{PgUp}	;+,放大

$r::				;向右旋转
	BlockInput on
	WinGetPos, x, y,lengthA,hightA, A
	CoordWinMove(lengthA/2,hightA/2)
	SendInput,{Click,Right}
	Sleep,50
	SendInput,{Down 2}
	Sleep,50
	SendInput,{Right}
	Sleep,50
	SendInput,{Enter}
	BlockInput Off
Return

$t::SendInput,!t 		;工具>铅笔


$a::SendInput,^s		;保存|另存
$s::SendInput,{WheelUp} ;{Left}
$d::SendInput,^{PgDn}	;-,缩小
$f::SendInput,{WheelDown} ;{Right}
$g::SendInput,^0	;缩放100%


$z::SendInput,^1		;适应窗口大小

$x::				;形状线条
	BlockInput on
	SendInput,{Alt Down}
	Sleep,50
	SendInput,{Alt Up}
	SendInput,sh		;形状线条
	BlockInput Off
Return

$c::				;编辑颜色
	BlockInput on
	SendInput,{Alt Down}
	Sleep,50
	SendInput,{Alt Up}
	SendInput,ec		;编辑颜色
	BlockInput Off
Return

$v::				;选择|同PS
	BlockInput on
	SendInput,{Alt Down}
	Sleep,50
	SendInput,{Alt Up}
	SendInput,se		;选择|同PS
	BlockInput Off
Return

$b::				;笔刷工具
	BlockInput on
	SendInput,{Alt Down}
	Sleep,50
	SendInput,{Alt Up}
	SendInput,b		;选择|同PS
	BlockInput Off
Return

$h::				;水平翻转
	BlockInput on
	WinGetPos, x, y,lengthA,hightA, A
	CoordWinMove(lengthA/2,hightA/2)
	SendInput,{Click,Right}
	Sleep,50
	SendInput,{Down 3}
	Sleep,50
	SendInput,{Right}
	Sleep,50
	SendInput,{Enter}
	BlockInput Off
Return

$!v::				;垂直翻转
	BlockInput on
	WinGetPos, x, y,lengthA,hightA, A
	CoordWinMove(lengthA/2,hightA/2)
	SendInput,{Click,Right}
	Sleep,50
	SendInput,{Down 3}
	Sleep,50
	SendInput,{Right}
	Sleep,50
	SendInput,{Down}
	Sleep,50
	SendInput,{Enter}
	BlockInput Off
Return

~$MButton::Send,^1		;缩放以适应
#If
*/
;****************************************************
;****************************************************
;ahk_exe ACDSee.exe,20240313
#If WinActive("ahk_exe ACDSee.exe")
$q::SendInput,^q 		;动作
$w::SendInput,^j{1}{Enter}	;向左旋转
$e::SendInput,{NumpadAdd}	;+,放大
$r::SendInput,^j{3}{Enter}	;向右旋转
$t::SendInput,^e 		;编辑器打开

$a::SendInput,^s		;保存|另存
$s::SendInput,{PgUp}		;上一页
$d::SendInput,{NumpadSub}	;-,缩小
$f::SendInput,{PgDn}		;下一页
$g::SendInput,{f}		;全屏

; $z::SendInput,{z}		;适合页面
$x::SendInput,^x		;剪切
$c::SendInput,^c		;复制
$v::SendInput,^v		;粘贴
$b::SendInput,^b 		;设为背景
#If
;****************************************************
;****************************************************
#If !(WinActive("ahk_exe explorer.exe") and WinActive("ahk_Group Group_explorer") and WinActive("ahk_Group Group_browser") and WinActive("ahk_class TTOTAL_CMD"))
$RButton::
	GV_MouseTier := 400
	GV_KeyClickAction1 := "SendInput,{Click,Right}" ;RButton
	GV_KeyClickAction2 := "SendInput,^s!{F4}"  ;保存|关闭
	GV_MouseButton := 2
	GV_LongClickAction := "SendInput,{Click,Right}" ;RButton
	gosub,Sub_MouseClick123
return
#If
;************************************************************************
;====================默认功能区6: 简易剪切板历史(文本)===================
;简易剪切板历史(文本)
ClipAppend:
	; 打开文件并读取内容到变量
	FileRead,ClipboardContent,%COMMANDER_PATH%\剪切板\ClipAppend.txt

	; 将剪贴板内容添加到变量的首行
	ClipboardContent = %clipboard%`r`n`r`n%ClipboardContent%

	; 将更新后的内容写入文件
	FileDelete, %COMMANDER_PATH%\剪切板\ClipAppend.txt
	FileAppend, %ClipboardContent%, %COMMANDER_PATH%\剪切板\ClipAppend.txt
Return

;************************************************************************
;===================默认功能区7: 快速输入自定义函数======================
;微信搜索框>输入联系人>点击联系人>跳转到聊天输入框
WeChatInput(InputStr){
	;聚焦搜索框
	if WinActive("ahk_class WeChatMainWndForPC"){
		Click,95 40
	}
	else {
		Click,55 30
	}
	SendInput, ^f	;定位搜索框
	Sleep,50
	SendInput, ^a	;选中搜索框
	Sleep,50
	SendInput, {Del}  ;清空搜索框
	Sleep,50
	SendInput, {text}%InputStr%
	Sleep,600
	OutputDebug, "找到"
	SendInput, {Shift}{Enter}
	OutputDebug, "进入"
	Click, 170,100	 ;跳转到聊天输入框
return
}
;************************************************************************
;=======================默认功能区8: 快速输入:短语=======================
;快速输入:
;快速输入,全局通用.e.g. 连续输入tdw, 即可打印当前时间
:?:tdw::
	;？号表示在单词中也会替换，e.g. tdw → V2019.....
	FormatTime, CurrentDateTime,, yyyy/MM/dd HH:mm
	Send %CurrentDateTime%
Return
:o:jxca::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("江西诚安新能源科技有限公司")
	; Sendinput, {Enter}
Return

:o:mma::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("ca2020")
	; Sendinput, {Enter}
Return

:o:tel::
:o:tee::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("18064460986")
	; Sendinput, {Enter}
Return

:o:eml::
:o:edx::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("xds.2008@163.com")
	; Sendinput, {Enter}
Return
:o:tgv::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("tuutg@live.cn")
	; Sendinput, {Enter}
Return

:o?:xdsf::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("寻冬生")
	; Sendinput, {Enter}
Return

:o:gxw::
	Sendinput, #r
	Sleep, 100
	AutoInput("\\xds-yf")
	Sendinput, {Enter}
Return

:?:exr::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("explorer.exe")
	; Sendinput, {Enter}
Return

:o:hbb::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("已汇报")
	; Sendinput, {Enter}
Return

:o:ttg::
:o:tgg::
	;？号表示在单词中也会替换，e.g. Vtdw → V2019.....
	AutoInput("Tuutg")
	; Sendinput, {Enter}
Return

;************************************************************************
;====================默认功能区8: 微信联系人快速输入=====================
;微信联系人快速输入,按空格或回车,自动跳到对应联系人,要改成自己的微信联系人
;举例 :o:yl::--yl-快速输入简称, WeChatInput("杨磊")--杨磊 自己的微信联系人
#IfWinActive ahk_exe WeChat.exe ;这里不要改动,下面{ }的改成自己的微信联系人
{
:o:yy::
:o:yl::      ;输入yl,按空格或回车,自动跳到对应联系人聊天输入框
	WeChatInput("杨磊")     ;点击输入框,输入联系人
Return

:o:xe::
:o:xl::
	WeChatInput("徐乐")     ;点击输入框,输入联系人
Return

:o:yz::
	WeChatInput("杨总")
Return

:o:wc::
:o:wz::
:o:wj::
	WeChatInput("文件传输助手")
Return

:o:zg::
	WeChatInput("周工@绿联")
Return

:o:yg::
	WeChatInput("印工@无锡晶汇")
Return

:o:zgq::
	WeChatInput("诚安职工群")
Return

:o:rdb::
	WeChatInput("诚安技术部")
Return

:o:qz::
	WeChatInput("钱总@减震厂")
Return

:o:cag::
:o:caq::
	WeChatInput("诚安管理人员群")
Return

:o:xx::
	WeChatInput("Xiang")
Return

:o:tt::
:o:tk::
	WeChatInput("唐凯 *电动车电缆*")
Return

:o:yyf::
:o:ff::
	WeChatInput("叶一峰")
Return

:o:yyy::
	WeChatInput("杨艳")
Return

:o:qg::
	WeChatInput("浅光暖笑@欧阳敏")
Return

:o:dsb::
	WeChatInput("诚安碟刹泵协调@吉强")
Return

:o:xh::
	WeChatInput("辛虹")
Return

:o:qx::
	WeChatInput("江西诚安～全喜线束工作沟通群")
Return

:o:xa::
	WeChatInput("诚安&小安车厂技术对接群")
Return







}
#IfWinActive ;这里不要改动,上面大{ }的改成自己的微信联系人
;****************************************************
;****************************************************

;*********** Tuutg自定义应用增强例子结束$ ***********
;****************************************************
;****************************************************
;***********  用户自定义应用增强例子开始^ ***********
; “例子”位置,进行自定义修改,请开始你的表演.






























;****************************************************
;**********  用户自定义应用增强例子结束$ ************