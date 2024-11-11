#ifndef CHATDIALOG_H
#define CHATDIALOG_H
#include <QDialog>
#include "global.h"
#include "statewidget.h"
#include "userdata.h"
#include <QListWidgetItem>
#include <QMap>
namespace Ui {
class ChatDialog;
}

class ChatDialog : public QDialog
{
    Q_OBJECT

public:
    explicit ChatDialog(QWidget *parent = nullptr);
    ~ChatDialog();
    void addChatUserList();
    void ClearLabelState(StateWidget* lb);
protected:
    bool eventFilter(QObject* watched,QEvent* event) override;
    void handleGlobalMousePress(QMouseEvent *event);
private slots:
    void slot_loading_chat_user();
    void slot_loading_contact_user();
    void slot_side_chat();
    void slot_side_contact();
    void slot_text_changed(const QString& str);
    void slot_friend_apply(std::shared_ptr<AddFriendApply>);
    void slot_add_auth_friend(std::shared_ptr<AuthInfo> auth_info);
    void slot_auth_rsp(std::shared_ptr<AuthRsp> auth_rsp);
    void slot_jump_chat_item(std::shared_ptr<SearchInfo> si);
    void slot_friend_info_page(std::shared_ptr<UserInfo> si);
    void slot_jump_chat_item_from_infopage(std::shared_ptr<UserInfo> user_info);
    void slot_switch_apply_friend_page();
    void slot_item_clicked(QListWidgetItem* item);
    void slot_append_send_chat_msg(std::shared_ptr<TextChatData> msg);
    void slot_text_chat_msg(std::shared_ptr<TextChatMsg>);
private:
    void ShowSearch(bool bsearch=false);
    void AddLBGroup(StateWidget* lb);
    void SetSelectChatItem(int uid = 0);
    void SetSelectChatPage(int uid = 0);
    void loadMoreChatUser();
    void loadMoreConUser();
    Ui::ChatDialog *ui;
    ChatUIMode _mode;
    ChatUIMode _state;
    bool _b_loading;
    QList<StateWidget*> _lb_list;
    QMap<int,QListWidgetItem*> _chat_items_added;
    int _cur_chat_uid;
    QWidget* _last_widget;
    void UpdateChatMsg(std::vector<std::shared_ptr<TextChatData>> msgdata);
};

#endif // CHATDIALOG_H
