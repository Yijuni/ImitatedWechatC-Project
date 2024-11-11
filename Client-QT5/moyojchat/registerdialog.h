#ifndef REGISTERDIALOG_H
#define REGISTERDIALOG_H
#include <QDialog>
#include "global.h"
namespace Ui {
class RegisterDialog;
}

class RegisterDialog : public QDialog
{
    Q_OBJECT

public:
    explicit RegisterDialog(QWidget *parent = nullptr);
    ~RegisterDialog();

private slots:
    void on_get_code_clicked();
    void slot_reg_mod_finish(ReqId id,QString res,ErrorCodes err);

    void on_sure_btn_clicked();

    void on_cancel_btn_clicked();

    void on_return_btn_clicked();

private:
    Ui::RegisterDialog *ui;
    QMap<TipErr, QString> _tip_errs;
    void AddTipErr(TipErr te, QString tips);
    void DelTipErr(TipErr te);
    void showTip(QString str,bool b_ok);
    void initHttpHandlers();//初始化不同的请求结果处理函数
    QMap<ReqId,std::function<void(const QJsonObject&)>> _handlers;//不同的请求（ReqId不同）有不同的处理函数
    bool checkUserValid();
    bool checkEmailValid();
    bool checkPassValid();
    bool checkVarifyValid();
    bool checkConfirmValid();
    void ChangeTipPage();
    QTimer* _countdown_timer;
    int _countdown;
signals:
    void sigSwitchLogin();

};

#endif // REGISTERDIALOG_H