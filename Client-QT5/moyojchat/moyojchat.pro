QT       += core gui network # 加模块

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
TARGET = moyojchat
TEMPLATE = app
CONFIG += c++11
RC_ICONS = icon.ico
DESTDIR = ./bin
# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    adduseritem.cpp \
    applyfriend.cpp \
    applyfrienditem.cpp \
    applyfriendlist.cpp \
    applyfriendpage.cpp \
    authenfriend.cpp \
    bubbleframe.cpp \
    chatdialog.cpp \
    chatitembase.cpp \
    chatpage.cpp \
    chatuserlist.cpp \
    chatuserwid.cpp \
    chatview.cpp \
    clickedbtn.cpp \
    clickedlabel.cpp \
    clickedoncelabel.cpp \
    contactuserlist.cpp \
    conuseritem.cpp \
    customizeedit.cpp \
    findfaildlg.cpp \
    findsuccessdlg.cpp \
    friendinfopage.cpp \
    friendlabel.cpp \
    global.cpp \
    grouptipitem.cpp \
    httpmgr.cpp \
    listitembass.cpp \
    loadingdlg.cpp \
    logindialog.cpp \
    main.cpp \
    mainwindow.cpp \
    messagetextedit.cpp \
    picturebubble.cpp \
    registerdialog.cpp \
    resetdialog.cpp \
    searchlist.cpp \
    statewidget.cpp \
    tcpmgr.cpp \
    textbubble.cpp \
    timerbtn.cpp \
    userdata.cpp \
    usermgr.cpp

HEADERS += \
    adduseritem.h \
    applyfriend.h \
    applyfrienditem.h \
    applyfriendlist.h \
    applyfriendpage.h \
    authenfriend.h \
    bubbleframe.h \
    chatdialog.h \
    chatitembase.h \
    chatpage.h \
    chatuserlist.h \
    chatuserwid.h \
    chatview.h \
    clickedbtn.h \
    clickedlabel.h \
    clickedoncelabel.h \
    contactuserlist.h \
    conuseritem.h \
    customizeedit.h \
    findfaildlg.h \
    findsuccessdlg.h \
    friendinfopage.h \
    friendlabel.h \
    global.h \
    grouptipitem.h \
    httpmgr.h \
    listitembass.h \
    loadingdlg.h \
    logindialog.h \
    mainwindow.h \
    messagetextedit.h \
    picturebubble.h \
    registerdialog.h \
    resetdialog.h \
    searchlist.h \
    singleton.h \
    statewidget.h \
    tcpmgr.h \
    textbubble.h \
    timerbtn.h \
    userdata.h \
    usermgr.h

FORMS += \
    adduseritem.ui \
    applyfriend.ui \
    applyfrienditem.ui \
    applyfriendpage.ui \
    authenfriend.ui \
    chatdialog.ui \
    chatpage.ui \
    chatuserwid.ui \
    conuseritem.ui \
    findfaildlg.ui \
    findsuccessdlg.ui \
    friendinfopage.ui \
    friendlabel.ui \
    grouptipitem.ui \
    loadingdlg.ui \
    logindialog.ui \
    mainwindow.ui \
    registerdialog.ui \
    resetdialog.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    config.ini \
    res/add_friend.png \
    res/add_friend_hover.png \
    res/add_friend_normal.png \
    res/addtip.png \
    res/arowdown.png \
    res/chat_icon.png \
    res/chat_icon_hover.png \
    res/chat_icon_press.png \
    res/chat_icon_select_hover.png \
    res/chat_icon_select_press.png \
    res/close_search.png \
    res/close_transparent.png \
    res/contact_list.png \
    res/contact_list_hover.png \
    res/contact_list_press.png \
    res/female.png \
    res/filedir.png \
    res/filedir_hover.png \
    res/filedir_press.png \
    res/head_1.jpg \
    res/head_2.jpg \
    res/head_3.jpg \
    res/head_4.jpg \
    res/head_5.jpg \
    res/ice.png \
    res/loading.gif \
    res/male.png \
    res/msg_chat_hover.png \
    res/msg_chat_normal.png \
    res/msg_chat_press.png \
    res/red_point.png \
    res/right_tip.png \
    res/search.png \
    res/smile.png \
    res/smile_hover.png \
    res/smile_press.png \
    res/tipclose.png \
    res/unvisible.png \
    res/unvisible_hover.png \
    res/video_chat_hover.png \
    res/video_chat_normal.png \
    res/video_chat_press.png \
    res/visible.png \
    res/visible_hover.png \
    res/voice_chat_hover.png \
    res/voice_chat_normal.png \
    res/voice_chat_press.png

RESOURCES += \
    rc.qrc



CONFIG(debug, debug|release) {
        #debug
    message("debug mode")
    #指定要拷贝的文件目录为工程目录下release目录下的所有dll、lib文件，例如工程目录在D:\QT\Test
    #PWD就为D:/QT/Test，DllFile = D:/QT/Test/release/*.dll
    TargetConfig = $${PWD}/config.ini
    #将输入目录中的"/"替换为"\"
    TargetConfig = $$replace(TargetConfig, /, \\)
    #将输出目录中的"/"替换为"\"
    OutputDir =  $${OUT_PWD}/$${DESTDIR}
    OutputDir = $$replace(OutputDir, /, \\)
    //执行copy命令
    QMAKE_POST_LINK += copy /Y \"$$TargetConfig\" \"$$OutputDir\" &

    # 首先，定义static文件夹的路径
    StaticDir = $${PWD}/static
    # 将路径中的"/"替换为"\"
    StaticDir = $$replace(StaticDir, /, \\)
    #message($${StaticDir})
    # 使用xcopy命令拷贝文件夹，/E表示拷贝子目录及其内容，包括空目录。/I表示如果目标不存在则创建目录。/Y表示覆盖现有文件而不提示。
     QMAKE_POST_LINK += xcopy /Y /E /I \"$$StaticDir\" \"$$OutputDir\\static\\\"
}else{
      #release
    message("release mode")
    #指定要拷贝的文件目录为工程目录下release目录下的所有dll、lib文件，例如工程目录在D:\QT\Test
    #PWD就为D:/QT/Test，DllFile = D:/QT/Test/release/*.dll
    TargetConfig = $${PWD}/config.ini
    #将输入目录中的"/"替换为"\"
    TargetConfig = $$replace(TargetConfig, /, \\)
    #将输出目录中的"/"替换为"\"
    OutputDir =  $${OUT_PWD}/$${DESTDIR}
    OutputDir = $$replace(OutputDir, /, \\)
    //执行copy命令
    QMAKE_POST_LINK += copy /Y \"$$TargetConfig\" \"$$OutputDir\"

    # 首先，定义static文件夹的路径
    StaticDir = $${PWD}/static
    # 将路径中的"/"替换为"\"
    StaticDir = $$replace(StaticDir, /, \\)
    #message($${StaticDir})
    # 使用xcopy命令拷贝文件夹，/E表示拷贝子目录及其内容，包括空目录。/I表示如果目标不存在则创建目录。/Y表示覆盖现有文件而不提示。
     QMAKE_POST_LINK += xcopy /Y /E /I \"$$StaticDir\" \"$$OutputDir\\static\\\"
}

win32-msvc*:QMAKE_CXXFLAGS += /wd"4819" /utf-8
