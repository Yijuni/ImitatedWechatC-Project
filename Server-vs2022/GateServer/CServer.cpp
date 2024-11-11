#include "CServer.h"
#include "HttpConnection.h"
#include "AsioIOServicePool.h"
CServer::CServer(net::io_context& ioc, unsigned short& port):_ioc(ioc),_acceptor(ioc,tcp::endpoint(tcp::v4(),port)){
}
void CServer::Start() {
	auto self = shared_from_this();
	auto& io_context = AsioIOServicePool::GetInstance()->GetIOService();//让连接均匀运行在不同的io_context
	std::shared_ptr<HttpConnection> new_con = std::make_shared<HttpConnection>(io_context);
	_acceptor.async_accept(new_con->GetSocket(), [self,new_con](beast::error_code ec) {
		try {
			//如果出错，放弃这次链接，继续监听其他链接
			if (ec) {
				self->Start();
				return;
			}
			//创建新链接，创建HttpConnection类管理这个链接
			new_con->Start();//监听读写
			
			//继续监听
			self->Start();
		}
		catch (std::exception &e) {
			std::cout << "exception is" << e.what() << std::endl;
			self->Start();
		}
	});
}